Stop-Service -Name wuauserv
Remove-Item HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Recurse
Start-Service -name wuauserv

Get-WindowsCapability -Online |
? {$_.Name -like "*RSAT*" -and $_.State -eq "NotPresent"} |
Add-WindowsCapability -Online