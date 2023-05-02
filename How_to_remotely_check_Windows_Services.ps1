# How to remotely check Windows Servers
PS C:\Users> Get-WmiObject win32_service -ComputerName HOSTNAME | where { $_.StartName -eq "AD\USERNAME" } | Select name, startname, startmode, state

# How to locally check Windows Servers
PS C:\Users> Get-WmiObject win32_service | Select name, startname, startmode, state | select-string "w3|ism"
