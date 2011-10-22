package com.spiceapps.beanpole.concrete.parse
{
	
	
	
	public class RouteExpression extends ThruExpression
	{
		
		//--------------------------------------------------------------------------
		//
		//  Public Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * type of route ~ push, pull
		 */
		
		public var type:String;
		
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * tags associated with route
		 */
		
		private var _tags:Object;
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
			
		public function RouteExpression(type:String)
		{
			super();
			
			this.type = type;
			this._tags = {};
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function getTag(name:String):*
		{
			return this._tags[name];
		}
		
		/**
		 */
		
		
		public function setTag(name:String, value:*):void
		{
			this._tags[name] = value;
		}
		
		
		
	}
}