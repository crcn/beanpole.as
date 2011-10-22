package com.spiceapps.beanpole
{
	import com.spiceapps.beanpole.concrete.parse.Parser;
	
	import flash.utils.describeType;

	public class Routable
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		
		public function Routable()
		{
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 */
		
		public static function register(target:Object, router:Router):void
		{
			var metadata:XMLList = flash.utils.describeType(target)..metadata;
			
			for(var i:int = metadata.length(); i--;)
			{
				var md:XML = metadata[i],
				property:String = md.parent().@name,
				route:String;
				
				switch(md.@name.toString())
				{
					case 'Route':
						route = md..@value;
					break;
					case 'Push':
						route = 'push ' + property;
					break;
					case 'Pull':
						route = 'pull ' + property;
					break;
					
				}
				
				if(!route) continue;
				
				router.on(route, target[property]);
				
				router.registerCommand(property, Parser.parse(route)[0].channel.value);
				
			}
		}
		
		/**
		 */
		
		
		public static function getRoute(target:Object):String
		{
			var metadata:XMLList = flash.utils.describeType(target)..metadata;
			
			/*for(var i:int = metadata.length(); i--;)
			{
				var md:XML = metadata[i];
				
				var route:String = md..@value,
					property:String = md.parent().@name;
				
				
				router.on(route, target[property]);
				
				router.registerCommand(property, Parser.parse(route)[0].channel.value);
			}*/
			
			trace(metadata);
			return null;
		}
	}
}