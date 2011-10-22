package com.spiceapps.beanpole.concrete.parse
{
	public class ThruExpression implements IRouteExpression
	{
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		private var _thru:IRouteExpression;
		
		/**
		 */
		
		
		private var _channel:ChannelExpression;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function ThruExpression(channel:ChannelExpression = null)
		{
			this._channel = channel;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getters / Setters
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function get thru():IRouteExpression
		{
			return this._thru;
		}
		
		/**
		 */
		
		public function set thru(value:IRouteExpression):void
		{
			this._thru = value;
		}
		
		/**
		 */
		
		public function get channel():ChannelExpression
		{
			return this._channel;
		}
		
		/**
		 */
		
		public function set channel(value:ChannelExpression):void
		{
			this._channel = value;
		}
		
	}
}