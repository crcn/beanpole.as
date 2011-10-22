## Beanpole.as - AS3 port of beanpole            
                                             
              
### Installation

- In **additional arguments** under **compiler settings**, make sure to add: `-keep-as3-metadata+=Route -keep-as3-metadata+=Push -keep-as3-metadata+=Pull`

                     
### Overview            
                                              

Just a real quick example:     
          
In TestBean.as:

````Actionscript

package
{                          
	import com.spiceapps.beanpole.Bean;    
	import flash.utils.setTimeout;
	
	class TestBean extends Bean
	{
		
		[Route("pull timeout/1 -> hello/world")]
		
		public function helloWorld(request:PullRequest):void
		{
			request.end("Hello world!");
		}                               
		
		
		[Route("pull timeout/:seconds")]
		public function timeoutTest(request:PullRequest):void
		{                                                            
			trace("Timeout for " + request.params.seconds + " seconds.");
			
			setTimeout(request.next, parseInt(request.params.seconds) * 1000 );
		}
		
	} 
}
    

````                                                                   

In your bootstrap script:


````Actionscript

package
{                            
	
	import flash.display.Sprite;
	import flash.spiceapps.beanpole.Router;
	
	class Main extends Sprite
	{
		                        
		public function Main()
		{
			
			var router:Router = new Router(); //or Router.instance for the singleton
			
			
			router.addBean(new TestBean());
			
			                                                 
			//timeout for 1 seconds -> response... 
			router.request("hello/world").pull(onHelloWorld);
		}                                      
		
		
		private function onHelloWorld(response:String)
		{   
			trace(response);                                       
		}
	}
}
   

````       
      
So those are the basics. There maybe some cases where you just want to expose a bean's method to the router. Here's an example:



````Actionscript
   
package
{                          
	import com.spiceapps.beanpole.Bean;    
	import flash.utils.setTimeout;
	
	class TestBean extends Bean
	{                             
		private var _name:String;     
		
		public static const TEST_USER_NAME:String = "userName";
		
		[Push]
		public function userName(name:String):void
		{                                   
			_name = name;                      
		}                               
		                               
		
		[Pull]
		public function userName(request:PullRequest):void
		{
			request.end(_name);
		}
		 
		
	} 
}

```` 

The combination of push, and pull creates a binding. Think of it as a getter, and setter where `pull` is a *getter*, and `push` is a *setter*. It's also very similar to the `[Bindable]` metadata. Here's how you use it:


````Actionscript


public function Main()
{
	var router:Router = Router.instance.addBean(new TestBean());
	  
	  
	router.bind(TestBean.TEST_USER_NAME, onUsername);   
	
	router.request(TestBean.TEST_USER_NAME).push("craig");
	
	//this works too...
	router.request(TestBean.TEST_USER_NAME).pull(onUserName);
	
}


private function onUserName(username:String)  
{                                          
	trace(username);
} 

````
              