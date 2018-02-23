This repo demonstrates how to load .Net assemblies over the Internet using using using a concept called ".Net over .net".

#### DemoAssemblies/
This folder includes the DLLs used in the PoC.  IronPython is not necessary for ".Net over .net", but rather a powerful example of the flexibility of this technique.

If you want to try out the PoC, you need to host the DemoAssemblies on a web server somewhere.

You can set up a simple web server by using 'python -m SimpleHTTPServer 8888' and pointing the code to http://localhost:8888/

#### PoC/cmd.sln
This is a solution that generates an .exe that pulls the .Net assemblies over the net, just make sure you update the URL to point at the URL of the server you set up above.

#### More info
https://jimshaver.net/2018/02/22/net-over-net-breaking-the-boundaries-of-the-net-framework/
