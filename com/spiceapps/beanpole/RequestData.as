package com.spiceapps.beanpole
{
	public class RequestData
	{
		//--------------------------------------------------------------------------
		//
		//  Public Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * query string data ?var=val
		 */
		
		public var query:Object;
		
		/**
		 * params in the path :param
		 */
		
		public var params:Object;
		
		/**
		 * options, such as metadata
		 */
		
		public var options:Object;
		
		/**
		 * response necessary?
		 */
		
		public var callback:Function;
		
		/**
		 */
		
		public var channel:*;
		
		/**
		 */
		
		public var router:Router;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public function RequestData(channel:*, query:Object = null, options:Object = null, callback:Function = null)
		{
			this.channel = channel;
			this.query = query;
			this.params = {};
			this.options = options;
			this.callback = callback;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		
		public function setRouter(value:Router):RequestData
		{
			this.router = value;
			return this;
		}
		
		/**
		 */
		
		public function onResult(value:Function):RequestData
		{
			this.callback = value;
			return this;
		}
		
		/**
		 */
		
		
		public function setQuery(value:Object):RequestData
		{
			this.query = value;
			return this;
		}
		
		/**
		 */
		
		
		public function setOptions(value:Object):RequestData
		{
			this.options = value;
			return this;
		}
		
		/**
		 */
		
		
		public function pull(callback:Function = null, router:Router = null):RequestData
		{ 
			
			if(callback == null) this.callback = callback;
			(router || this.router || Router.instance).pull(this);
			return this;
		}
		
		/**
		 */
		
		public function push(query:* = null, router:Router = null):RequestData
		{
			this.query = query;
			(router || this.router || Router.instance).push(this);
			return this;
		}
	}
}