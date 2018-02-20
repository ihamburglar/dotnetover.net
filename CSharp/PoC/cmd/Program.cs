using System;
using System.Reflection;
using System.Net;
using IronPython.Hosting;



namespace cmd
{
	class Program
	{
        static Program()
        {
            //This Registers the Handler
            AppDomain.CurrentDomain.AssemblyResolve += new ResolveEventHandler(OnResolveAssembly);
        }
        public static void Main(string[] args)
		{
            //Creat and instance of IronPython 
            var engine = Python.CreateEngine();
            //Execute some IronPython
			engine.Execute("import time;print 'Hello from IronPython';time.sleep(5)"); 
		}
        //This sets up the handler
        private static Assembly OnResolveAssembly(object sender, ResolveEventArgs args)
        {
            //Get the assembly name that is missing so we know what to call it.
            string name = args.Name.Substring(0, args.Name.IndexOf(','));
            //Set up a WebClient thanks to .Net
            WebClient wc = new WebClient();
            //Load the dll over http
            return Assembly.Load(wc.DownloadData("http://localhost:8888/" + name + ".dll"));
        }
    }
}