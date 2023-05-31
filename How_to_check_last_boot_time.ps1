# https://geekflare.com/windows-last-boot-time/
(hostname).toupper(); (gcim Win32_OperatingSystem).LastBootUpTime

# https://devblogs.microsoft.com/scripting/powertip-get-the-last-boot-time-with-powershell/
Get-CimInstance -ClassName win32_operatingsystem | select csname, lastbootuptime
