package com.spiceapps.beanpole.concrete.parse
{
	public interface IRouteExpression
	{
		
		/**
		 */
		
		function get thru():IRouteExpression;
		
		
		/**
		 * setter for going through particular route. e.g: through/me -> this/route
		 */
		
		function set thru(value:IRouteExpression):void;
		
		/**
		 * channel for the current route. e.g: hello/world
		 */
		
		function get channel():ChannelExpression;
		
		
		/**
		 */
		
		function set channel(value:ChannelExpression):void;
	}
}