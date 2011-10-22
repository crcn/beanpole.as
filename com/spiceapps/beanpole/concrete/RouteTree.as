package com.spiceapps.beanpole.concrete
{
	import com.spiceapps.beanpole.concrete.parse.RouteExpression;

	internal final class RouteTree
	{
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public var path:String;
		
		
		/**
		 */
		
		
		private var _listeners:Vector.<ConcreteRouteListener>;
		
		//--------------------------------------------------------------------------
		//
		//  Private Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		private var _children:Object;
		
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function RouteTree(path:String)
		{
			this._children = {};
			this.path = path;
			this._listeners = new Vector.<ConcreteRouteListener>();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getters / Setters
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function get listeners():Vector.<ConcreteRouteListener>
		{
			return this._listeners;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		
		/**
		 */
		
		
		public function getChild(path:String, create:Boolean = true):RouteTree
		{
			return this._children[path] || (create ? (this._children[path] = new RouteTree(path)) : null);
		}
		
		
		
		
	}
}