package com.spiceapps.beanpole.concrete.stream
{
	import com.spiceapps.beanpole.RequestData;
	import com.spiceapps.beanpole.concrete.ConcreteRequest;
	import com.spiceapps.beanpole.concrete.ConcreteRouteListener;
	import com.spiceapps.beanpole.concrete.ConcreteRouter;
	import com.spiceapps.beanpole.concrete.stream.events.RequestStreamEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ConcreteStreamedRequest extends ConcreteRequest implements IDataStream
	{
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		
		
		/**
		 */
		
		
		private var _responsed:Boolean;

		/**
		 */
		
		protected var _stream:DataStream;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function ConcreteStreamedRequest(data:RequestData, listener:ConcreteRouteListener, router:ConcreteRouter)
		{
			super(data, listener, router);
			
			this._stream = new DataStream();
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function addEventListener(type:String, callback:Function):void
		{
			this._stream.addEventListener(type, callback);
		}
		
		/**
		 */
		
		
		public function write(data:*):void
		{
			this._stream.write(data);
		}
		
		
		/**
		 */
		
		
		public function end(data:*):void
		{
			this._stream.end(data);
			
			this.onEnd(this._stream.buffer);
		}
		
		
		/**
		 */
		
		public function respond(data:*):void
		{
			this._stream.respond(data);
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Protected Method
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		protected function onEnd(buffer:Array):void
		{
			//abstract
		}
		
		
	}
}