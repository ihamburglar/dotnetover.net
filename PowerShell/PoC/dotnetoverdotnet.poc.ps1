#Set up the AssemblyResolve handler
$R=[System.ResolveEventHandler] {
    param($s,$e)
    #Make sure you load the DLLs into a webserver of your choice and change the URL
    $d = (New-Object Net.WebClient).DownloadData("http://localhost:8888/"+$e.Name)
    #This actually does the loading, when the assembly is not found
    return [Reflection.Assembly]::Load($d)}
#Initiate the handler
[AppDomain]::CurrentDomain.add_AssemblyResolve($R)
#Attembpt to load the DLLs
[Reflection.Assembly]::Load("IronPython.dll")|Out-Null
[Reflection.Assembly]::Load("IronPython.Modules.dll")|Out-Null
[Reflection.Assembly]::Load("Microsoft.Scripting.dll")|Out-Null
[Reflection.Assembly]::Load("Microsoft.Dynamic.dll")|Out-Null
#Now that IronPython is in memory, lets execute some Python
[ironpython.hosting.python]::CreateEngine().Execute("print 'Hello World From IronPython'")
#Good idea to tear down the handler, or you end up with buffer overflows
[AppDomain]::CurrentDomain.remove_AssemblyResolve($R)