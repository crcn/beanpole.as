package com.spiceapps.beanpole.push
{
	import com.spiceapps.beanpole.RequestData;
	import com.spiceapps.beanpole.concrete.ConcreteRequest;

	public class PushRequest extends ConcreteRequest
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function PushRequest(data:RequestData, listener:PushRouteListener, router:PushRouter)
		{
			super(data, listener, router);
		}
		
	}
}