package com.spiceapps.beanpole
{
	import com.spiceapps.beanpole.concrete.ConcreteRouteListener;
	import com.spiceapps.beanpole.concrete.ConcreteRouter;
	import com.spiceapps.beanpole.concrete.parse.Parser;
	import com.spiceapps.beanpole.concrete.parse.RouteExpression;
	import com.spiceapps.beanpole.pull.PullRouter;
	import com.spiceapps.beanpole.push.PushRouter;

	public class Router
	{
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		private var _pull:PullRouter;
		private var _push:PushRouter;
		private var _commands:Object;
		private static var _router:Router;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function Router()
		{
			this._pull = new PullRouter();
			this._push = new PushRouter();
			this._commands = {};
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		
		public static function get instance():Router
		{
			return _router || (_router = new Router());
		}
		
		/**
		 */
		
		public function addBean(value:Bean):Router
		{
			value.router = this;
			
			Routable.register(value, this);
			
			return this;
		}
		
		/**
		 */
		
		public function registerCommand(command:String, channel:String):void
		{
			//if(this._commands[command]) throw new Error("Command "+command+" already exists");
			
			this._commands[command] = channel;
		}
		
		/**
		 */
		
		public function on(routeStr:String, callback:Function):void
		{
			var routes:Vector.<RouteExpression> = Parser.parse(routeStr);
			
			for(var i:int = 0, n:int = routes.length; i < n; i++)
			{
				var route:RouteExpression = routes[i],
				command:String;
				
				
				if(command == route.getTag('command')) this.registerCommand(command, route.channel.value);
				
				
				if(route.type == 'push')
				{
					this._push.addRouteListener(route, callback);
				}
				else
				{
					this._pull.addRouteListener(route, callback);
				}	
			}
			
		}
		
		/**
		 */
		
		
		public function request(channel:String):RequestData
		{
			return new RequestData(channel).setRouter(this);	
		}
		
		/**
		 */
		
		public function pull(data:RequestData):void
		{
			this.dispatch(this._pull, data);
		}
		
		/**
		 */
		
		
		public function push(data:RequestData):void
		{			
			this.dispatch(this._push, data);
		}
		
		
		/**
		 */
		
		
		private function dispatch(dispatcher:ConcreteRouter, data:RequestData):void
		{
			if(this._commands[data.channel]) data.channel = this._commands[data.channel];
			
			dispatcher.dispatch(data);
		}
	}
}