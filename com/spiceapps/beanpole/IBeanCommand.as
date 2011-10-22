package com.spiceapps.beanpole
{
	import com.spiceapps.beanpole.concrete.ConcreteRequest;

	public interface IBeanCommand
	{
		function execute(request:ConcreteRequest):void;
	}
}