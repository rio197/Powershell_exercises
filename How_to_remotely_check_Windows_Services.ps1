# How to remotely check Windows Services
PS C:\Users> Get-WmiObject win32_service -ComputerName HOSTNAME | where { $_.StartName -eq "AD\USERNAME" } | Select name, startname, startmode, state

# How to locally check Windows Services
PS C:\Users> Get-WmiObject win32_service | Select name, startname, startmode, state | select-string "w3|ism"

# How to locally check Windows Services start times
PS C:\Users> Get-WmiObject win32_service | where-object {($_.Name -like "*w3*") -or ($_.Name -like "*ism*")} -PipelineVariable Service | 
ForEach-Object { 
    Get-Process -Id $_.ProcessId | 
    Select-Object -Property @{label='Status';expression={$Service.State}}, 
                            @{label='Name';expression={$Service.Name}},
                            @{label='DisplayName';expression={$Service.DisplayName}},
                            StartTime
}

# How to locally check Windows processes start times
PS C:\Users> Get-Process | Where-Object {($_.Name -like "*w3*") -or ($_.Name -like "*ism*")} | Select name,starttime
