package com.spiceapps.beanpole.concrete.parse
{
	public class Parser
	{
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		private static var _parser:Parser;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function Parser()
		{
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		
		public static function getInstance():Parser
		{
			return _parser || (_parser = new Parser());
		}
		
		/**
		 */
		
		public static function parse(value:String):Vector.<RouteExpression>
		{
			return getInstance().parse(value);	
		}
		
		/**
		 */
		
		
		public static function parseChannel(value:String):ChannelExpression
		{
			return getInstance().parseChannel(value);
		}
		
		/**
		 */
		
		
		private function parse(source:String):Vector.<RouteExpression>
		{
			
			//clean up the source, and tokenize it
			var tokens:Array = source.
				toLowerCase().
				
				
				//remove paren (used for groupings)
				replace(/[\(\)]/g,'').
				
				//remove extra whitespace
				replace(/\s+/g,' ').
				
				//split the whitespace
				split(" ");
			
			var routes:Array = this.splitOr(tokens),
			expressions:Vector.<RouteExpression> = new Vector.<RouteExpression>(routes.length, true);
			
			
			for(var i:int = 0, n:int = routes.length; i < n; i++)
			{
				var routeTokens:Array = routes[i];
				
				//first part is always the type of route
				var expr:RouteExpression = expressions[i] = new RouteExpression(routeTokens.shift());
				
				while(routeTokens.length)
				{
					
					
					//is it a tag?
					if(routeTokens[0].substr(0, 1) == "-")
					{
						var tags:Array = routeTokens.shift().split("=");
						
						//tag may have a value. If a value is not present however, set the tag to "true"
						expr.setTag(tags.shift().substr(1), !!tags.length ? tags[0] : true);
						
						continue;
					}
					
					
					//no more tags? onto the routes.
					this.parseChannels(expr, routeTokens);
					
					//routes come last, so we're done here.
					break;
				}	
			}
			
			return expressions;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------
		
		
		/**
		 * splits "or" statements into multiple routes
		 */
		
		
		private function splitOr(tokens:Array, route:Array = null, routes:Array = null):Array
		{
			if(!route) route = [];
			if(!routes) routes = [];
			
			
			while(tokens.length)
			{
				var token:String = tokens.shift();
				
				
				
				if(token == 'or')
				{
					var orRoute:Array = route.concat();
					orRoute.pop();
					
					orRoute.push(tokens.shift());
					
					
					this.splitOr(tokens.concat(), orRoute, routes);	
					
					//remove any additional OR statements - splitOr handles it. in this case ~ some OR stringed OR expression
					while(tokens[0] == 'or')
					{
						tokens.splice(0,2);
					}
				}
				else
				{
					route.push(token);
				}
			}
			
			routes.push(route);
			
			return routes;
		}
		
		/**
		 */
		
		private function parseChannels(root:RouteExpression, tokens:Array):RouteExpression
		{
			var currentExpression:IRouteExpression = root;
			
			while(tokens.length)
			{
				var channel:ChannelExpression = this.parseChannel(tokens.shift());
				
				
				if(tokens[0] == '->')
				{
					currentExpression = currentExpression.thru = new ThruExpression(channel);
				}
			}
			
			
			root.channel = channel;
			
			
			
			return root;
		}
		
		/**
		 */
		
		
		private function parseChannel(value:String):ChannelExpression
		{ 
			var paths:Array = value.split('/'),
			pathsVector:Vector.<PathExpression> = new Vector.<PathExpression>(paths.length, true);
			
			for(var i:int = paths.length; i--;)
			{ 
				var path:String = paths[i],
				isParam:Boolean =  path.substr(0, 1) == ':';
				 
				pathsVector[i] = new PathExpression(isParam ? path.substr(1) : path, isParam);
			}
			
			
			return new ChannelExpression(value, pathsVector);
		}
		
	}
}