package com.spiceapps.beanpole.push
{
	import com.spiceapps.beanpole.concrete.ConcreteRequest;
	import com.spiceapps.beanpole.concrete.ConcreteRouteListener;
	import com.spiceapps.beanpole.concrete.parse.RouteExpression;

	public class PushRouteListener extends ConcreteRouteListener
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function PushRouteListener(route:RouteExpression, callback:Function, router:PushRouter)
		{
			super(route, callback, router);
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		override public function onRequest(request:ConcreteRequest):void
		{
			this._callback(request.query);
		}
	}
}