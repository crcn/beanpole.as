package com.spiceapps.beanpole.concrete
{
	import com.spiceapps.beanpole.concrete.parse.ChannelExpression;
	import com.spiceapps.beanpole.concrete.parse.Parser;
	import com.spiceapps.beanpole.concrete.parse.PathExpression;
	import com.spiceapps.beanpole.concrete.parse.RouteExpression;

	internal final class RouteCollection
	{
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		private var _tree:RouteTree;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function RouteCollection()
		{
			this._tree = new RouteTree("/");
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		
		public function addRouteListener(listener:ConcreteRouteListener):ConcreteRouteListener
		{
			this.getTree(listener.route.channel.paths).listeners.push(listener);
			
			return listener;
		}
		
		/**
		 */
		
		public function getRouteListeners(channel:ChannelExpression):Vector.<ConcreteRouteListener>
		{
			var tree:RouteTree = this.getTree(channel.paths, true); 
			return tree ? tree.listeners : new Vector.<ConcreteRouteListener>();
		}
		
		/**
		 */
		
		public function removeRouteListener(listener:ConcreteRouteListener):void
		{
			var listeners:Vector.<ConcreteRouteListener> = this.getTree(listener.route.channel.paths).listeners,
				index:int = listeners.indexOf(listener); 
			
			if(index > -1)
			{
				listeners.splice(index, 1);	
			}
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		
		private function getTree(paths:Vector.<PathExpression>, find:Boolean = false):RouteTree
		{
			var currentTree:RouteTree = this._tree;
			
			for(var i:int = 0, n:int = paths.length; i < n; i++)
			{
				var path:PathExpression = paths[i],
					
				//prepend _ - what if _param is provided for the param name? 
				pathName:String = path.param ? '_param' : '_' + path.value;
				
				currentTree = currentTree.getChild(pathName, !find) || currentTree.getChild('_param', false);	
			}
			
			
			return currentTree;
		}
		
	}
}