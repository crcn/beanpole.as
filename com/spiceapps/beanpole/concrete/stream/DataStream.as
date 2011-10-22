package com.spiceapps.beanpole.concrete.stream
{
	
	import com.spiceapps.beanpole.concrete.stream.events.RequestStreamEvent;
	
	import flash.events.EventDispatcher;
	
	
	[Event(type="com.spiceapps.beanpole.concrete.stream.events.RequestStreamEvent",name="write")]
	[Event(type="com.spiceapps.beanpole.concrete.stream.events.RequestStreamEvent",name="end")]
	[Event(type="com.spiceapps.beanpole.concrete.stream.events.RequestStreamEvent",name="response")]
	public class DataStream extends EventDispatcher implements IDataStream
	{
		
		private var _buffer:Array;
		private var _response:Object;
		private var _ended:Boolean;
		
		public function DataStream()
		{ 
			this._buffer = [];
		}
		 
		
		//--------------------------------------------------------------------------
		//
		//  Getters / Setters
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function get buffer():Array
		{
			return this._buffer;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		
		/**
		 */
		
		
		public function write(value:*):void
		{ 
			//if(!this._responded) this.response(value);
			
			this._buffer.push(value);
			
			this.dispatchEvent(new RequestStreamEvent(RequestStreamEvent.WRITE, value));
		}
		
		/**
		 */
		
		public function end(value:*):void
		{
			if(value) this.write(value);
			
			this._ended = true;
			 
			this.dispatchEvent(new RequestStreamEvent(RequestStreamEvent.END));
		}
		
		/**
		 */
		
		public function respond(value:*):void
		{
			this._response = value;
			
			this.dispatchEvent(new RequestStreamEvent(RequestStreamEvent.RESPONSE, value));
		}
	}
}