package com.spiceapps.beanpole.concrete.stream
{
	import flash.events.IEventDispatcher;

	public interface IDataStream
	{
		
		function write(data:*):void;
		function end(data:*):void;
		function respond(data:*):void;
	}
}