package com.spiceapps.beanpole.concrete
{
	import com.spiceapps.beanpole.concrete.parse.ChannelExpression;
	import com.spiceapps.beanpole.concrete.parse.PathExpression;

	internal final class RequestMiddleware
	{
		
		//--------------------------------------------------------------------------
		//
		//  Public Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public var listener:ConcreteRouteListener;
		
		/**
		 */
		
		public var channel:ChannelExpression;
		
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function RequestMiddleware(channel:ChannelExpression, listener:ConcreteRouteListener)
		{
			this.channel = channel;
			this.listener = listener;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function onRequest(request:ConcreteRequest):void
		{
			var listenerChannel:ChannelExpression = this.listener.route.channel;
			
			for(var i:int = listenerChannel.paths.length; i--;)
			{
				var path:PathExpression = listenerChannel.paths[i];
				
				
				if(!path.param) continue;
				
				var paramValue:String = this.channel.paths[i].value;
			
				request.params[path.value] = paramValue;
			}
			
			this.listener.onRequest(request);
		}
	}
}