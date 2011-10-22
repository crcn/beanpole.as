package com.spiceapps.beanpole.concrete
{
	import com.spiceapps.beanpole.RequestData;
	import com.spiceapps.beanpole.concrete.parse.ChannelExpression;
	import com.spiceapps.beanpole.concrete.parse.Parser;
	import com.spiceapps.beanpole.concrete.parse.PathExpression;
	import com.spiceapps.beanpole.concrete.parse.RouteExpression;

	public class ConcreteRouter
	{
		
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		internal var _collection:RouteCollection;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function ConcreteRouter()
		{
			this._collection = new RouteCollection();
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function dispatch(data:RequestData):void
		{
			var channel:ChannelExpression = data.channel = Parser.parseChannel(data.channel),
			listeners:Vector.<ConcreteRouteListener> = this._collection.getRouteListeners(channel);
			
			/*for(var i:int = listeners.length; i--;)
			{
				this.getNewRequest(
			}*/
			
			this._dispatch(data, listeners);
		}
		
		/**
		 */
		
		public function addRouteListener(route:RouteExpression, callback:Function):void
		{
			this._collection.addRouteListener(new ConcreteRouteListener(route, callback, this));
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Protected Method
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		protected function get collection():RouteCollection
		{ 
			return this._collection;
		}
		
		/**
		 */
		
		
		
		protected function _dispatch(data:RequestData, listeners:Vector.<ConcreteRouteListener>):void
		{
			for(var i:int = listeners.length; i--;)
			{
				new ConcreteRequest(data, listeners[i], this).next();
			}
		}
	}
}