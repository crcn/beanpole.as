package com.spiceapps.beanpole.concrete.stream.events
{
	import flash.events.Event;

	public class RequestStreamEvent extends Event
	{
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public static const WRITE:String = "write";
		
		
		/**
		 */
		
		public static const END:String = "end";
		
		/**
		 */
		
		public static const RESPONSE:String = "response";
		
		/**
		 */
		
		
		public var data:*;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function RequestStreamEvent(type:String, data:* = null)
		{
			super(type, false, false);
			
			this.data = data;
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		override public function clone():Event
		{
			return new RequestStreamEvent(this.type, this.data);
		}
	}
}