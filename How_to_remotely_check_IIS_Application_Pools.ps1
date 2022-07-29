# How to remotely check IIS Application Pools

PS C:\Users> Invoke-Command -ComputerName HOSTNAME {Get-IISAppPool} | Select PSComputerName,Name,ManagedPipelineMode,State
