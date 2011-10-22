package com.spiceapps.beanpole.concrete.parse
{
	public class PathExpression
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
		 * is param?
		 */
		
		private var _param:Boolean;
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function PathExpression(value:String, param:Boolean)
		{
			this._value = value;
			this._param = param;
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
		
		
		public function get param():Boolean
		{
			return this._param;
		}
	}
}