## Beanpole.as - AS3 port of beanpole            
                                             
              
### Installation

- In **additional arguments** under **compiler settings**, make sure to add: `-keep-as3-metadata+=Route -keep-as3-metadata+=Push -keep-as3-metadata+=Pull`


### Example          
          
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
			
			var router = new Router(); //or Router.instance for the singleton
			
			
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
              