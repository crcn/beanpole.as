package com.spiceapps.beanpole.concrete.parse
{
	public class ChannelExpression
	{
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		private var _value:String;
		
		
		/**
		 */
		
		
		private var _paths:Vector.<PathExpression>;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function ChannelExpression(value:String, paths:Vector.<PathExpression>)
		{
			this._value = value;
			this._paths = paths;
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Getters / Setters
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function get value():String
		{
			return this._value;
		}
		
		/**
		 */
		
		
		public function get paths():Vector.<PathExpression>
		{
			return this._paths;
		}
	}
}