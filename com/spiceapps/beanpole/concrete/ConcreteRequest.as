package com.spiceapps.beanpole.concrete
{
	import com.spiceapps.beanpole.RequestData;
	import com.spiceapps.beanpole.concrete.ConcreteRouteListener;
	import com.spiceapps.beanpole.concrete.parse.ChannelExpression;
	import com.spiceapps.beanpole.concrete.parse.ThruExpression;

	public class ConcreteRequest
	{
		
		//--------------------------------------------------------------------------
		//
		//  Public Variables
		//
		//--------------------------------------------------------------------------
		
		 
		/**
		 */
		
		
		public var params:Object;
		
		/**
		 */
		
		
		public var query:Object;
		
		/**
		 */
		
		
		public var callback:Function;
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		
		/**
		 * middleware
		 */
		
		
		private var _middleware:Vector.<RequestMiddleware>;
		
		
		/**
		 */
		
		private var _router:ConcreteRouter;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function ConcreteRequest(data:RequestData, listener:ConcreteRouteListener, router:ConcreteRouter)
		{ 
			this.params = data.params;
			this.query = data.query;
			this.callback = data.callback;
			this._router = router;
			this._middleware = new Vector.<RequestMiddleware>();
			 
			
			this.addListeners(data.channel, listener);
		} 
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		 
		/**
		 */
		
		
		public function hasNext():Boolean
		{ 
			return !!this._middleware.length;	
		}
		
		/**
		 */
		
		public function next():Boolean
		{
			if(!!this._middleware.length)
			{
				var middleware:RequestMiddleware = this._middleware.pop();
				
				middleware.onRequest(this);
				
				return true;
			}
import com.spiceapps.beanpole.concrete.ConcreteRouteListener;
import com.spiceapps.beanpole.concrete.parse.ThruExpression;
			
			
			
			
			
			return false;
		}
		
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		
		private function addListeners(channel:ChannelExpression, listener:ConcreteRouteListener):void
		{
			var currentMiddleware:ThruExpression = ThruExpression(listener.route.thru),
				thru:Vector.<ThruExpression> = new Vector.<ThruExpression>();
			
			this._middleware.push(new RequestMiddleware(channel, listener));
			
			while(currentMiddleware)
			{
				thru.push(currentMiddleware);
				currentMiddleware = ThruExpression(currentMiddleware.thru);
			}
			
			while(currentMiddleware = thru.pop())
			{
				var middleware:Vector.<ConcreteRouteListener> = this._router._collection.getRouteListeners(currentMiddleware.channel);
					
				for(var i:int = 0, n:int = middleware.length; i < n; i++)
				{ 
					this.addListeners(currentMiddleware.channel, middleware[i]);
				}
				
			}
			
			
			
		}
		
		
		
		
	}
}