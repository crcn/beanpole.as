package com.spiceapps.beanpole.push
{
	import com.spiceapps.beanpole.RequestData;
	import com.spiceapps.beanpole.concrete.ConcreteRouteListener;
	import com.spiceapps.beanpole.concrete.ConcreteRouter;
	import com.spiceapps.beanpole.concrete.parse.RouteExpression;

	public class PushRouter extends ConcreteRouter
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function PushRouter()
		{
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		override public function addRouteListener(route:RouteExpression, callback:Function):void
		{
			this.collection.addRouteListener(new PushRouteListener(route, callback, this));
		}
		
		//--------------------------------------------------------------------------
		//
		//  Protected Method
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		override protected function _dispatch(data:RequestData, listeners:Vector.<ConcreteRouteListener>):void
		{
			for(var i:int = listeners.length; i--;)
			{
				new PushRequest(data, PushRouteListener(listeners[i]), this).next();
			}
		}
		
		
	}
}