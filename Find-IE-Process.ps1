<#
Name: Find-IE-Process.ps1
Version: 1
Author: Abbia Zacharia
Purpose: This script is used to check if iexplore.exe is running on a computer as standalone desktop app (and not Edge IE engine process)
Description:
Version Control:
Prerequisites:
Configurations:
#>

#==================================================================================

$result = Get-CimInstance win32_process | select commandline | Where-Object {$_.commandline -Like "*iexplore.exe*"} | Where-Object {$_.commandline -NotLike "*iexplore.exe*APPID:MSEdge*"} 
if ($result -eq $null)
{
# Standalone IE process not found (iexplore.exe is not running)
Write-Output $false
}
else 
{
# Standalone IE process found (iexplore.exe is running as standalone app)
Write-Output $true
}

#==================================================================================
