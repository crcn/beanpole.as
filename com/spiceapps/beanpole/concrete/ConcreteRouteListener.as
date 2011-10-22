package com.spiceapps.beanpole.concrete
{
	import com.spiceapps.beanpole.concrete.parse.RouteExpression;
	import com.spiceapps.garbage.IDisposable;

	public class ConcreteRouteListener implements IDisposable
	{
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		private var _router:ConcreteRouter;
		
		/**
		 * the route string
		 */
		
		private var _route:RouteExpression;
		
		/**
		 */
		
		protected var _callback:Function;
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function ConcreteRouteListener(route:RouteExpression, callback:Function, router:ConcreteRouter)
		{
			this._route = route;
			this._router = router;
			this._callback = callback;
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Getters / Setters
		//
		//--------------------------------------------------------------------------
		
		 
		/**
		 */
		
		public function get route():RouteExpression
		{
			return this._route;
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
			this._callback(request);
		}
		
		
		/**
		 */
		
		
		public function dispose():void
		{
			this._router._collection.removeRouteListener(this);
		}
	}
}