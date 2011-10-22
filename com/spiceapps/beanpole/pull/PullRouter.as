package com.spiceapps.beanpole.pull
{
	import com.spiceapps.beanpole.RequestData;
	import com.spiceapps.beanpole.concrete.ConcreteRouteListener;
	import com.spiceapps.beanpole.concrete.ConcreteRouter;
	import com.spiceapps.beanpole.concrete.parse.RouteExpression;

	public class PullRouter extends ConcreteRouter
	{
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function PullRouter()
		{
			super();
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
				new PullRequest(data, listeners[i], this).next();
			}
		}
		
		
	}
}