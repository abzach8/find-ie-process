<#
Name: Find-IE-Processes.ps1
Version: 1
Author: Abbia Zacharia
Purpose: This script is used to check if iexplore.exe is running on a computer as a standalone desktop app
Description:
Version Control:
Prerequisites:
Configurations:
#>

#==================================================================================

$result1 = Get-CimInstance win32_process | select commandline | Where-Object {$_.commandline -Like "*iexplore.exe*"} | Where-Object {$_.commandline -NotLike "*iexplore.exe*APPID:MSEdge*"} 
if ($result1 -eq $null)
{
# Standalone IE process not found
Write-Host "iexplore.exe is not running"
Write-Output $false
}
else 
{
# Standalone IE process found
Write-Host "iexplore.exe is running as standalone app"
Write-Output $true
}

<#

$result2 = Get-CimInstance win32_process | select commandline | Where-Object {$_.commandline -Like "*iexplore.exe*APPID:MSEdge*"}
if ($result2 -ne $null)
{
# IE engine process found
Write-Host "iexplore.exe is running on this device because of Edge IE engine"
}
else 
{
# IE engine process not found
Write-Host "iexplore.exe is not running on this device"
}

#>

#==================================================================================