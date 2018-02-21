#Load the assemblies
[Reflection.Assembly]::Load((New-Object Net.WebClient).DownloadData("http://localhost:8888/IronPython.dll"))|Out-Null
[Reflection.Assembly]::Load((New-Object Net.WebClient).DownloadData("http://localhost:8888/IronPython.Modules.dll"))|Out-Null
[Reflection.Assembly]::Load((New-Object Net.WebClient).DownloadData("http://localhost:8888/Microsoft.Scripting.dll"))|Out-Null
[Reflection.Assembly]::Load((New-Object Net.WebClient).DownloadData("http://localhost:8888/Microsoft.Dynamic.dll"))|Out-Null
#Run some IronPython Code
[ironpython.hosting.python]::CreateEngine().Execute("print 'Hello World From IronPython'")
