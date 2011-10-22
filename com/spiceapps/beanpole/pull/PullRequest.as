package com.spiceapps.beanpole.pull
{
	import com.spiceapps.beanpole.RequestData;
	import com.spiceapps.beanpole.concrete.ConcreteRouteListener;
	import com.spiceapps.beanpole.concrete.stream.ConcreteStreamedRequest;
	import com.spiceapps.beanpole.concrete.stream.events.RequestStreamEvent;

	public class PullRequest extends ConcreteStreamedRequest
	{
		
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function PullRequest(data:RequestData, listener:ConcreteRouteListener, router:PullRouter)
		{
			super(data, listener, router);
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		private function listen():void
		{
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Protected Method
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		override protected function onEnd(buffer:Array):void
		{
			for(var i:int = buffer.length; i--;)
			{
				this.callback(buffer[i]);
			}
		}
		
	}
}