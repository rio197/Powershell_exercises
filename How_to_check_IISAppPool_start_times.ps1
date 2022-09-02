# Reference: https://www.sapien.com/blog/2008/02/20/how-can-i-write-a-powershell-function-that-outputs-a-table
function MakeData($AppPool) {
 $out = new-object psobject
 $out | add-member noteproperty AppPool $AppPool
 $out | add-member noteproperty StartTime (ps -id (Get-IISAppPool -Name $AppPool).WorkerProcesses.ProcessId).StartTime
 write-output $out
}
foreach ($AppPool in (Get-IISAppPool).WorkerProcesses.AppPoolName) {
 MakeData $AppPool
}

# As a one-liner:
function MakeData($AppPool) { $out = new-object psobject; $out | add-member noteproperty AppPool $AppPool; $out | add-member noteproperty StartTime (ps -id (Get-IISAppPool -Name $AppPool).WorkerProcesses.ProcessId).StartTime; write-output $out }; foreach ($AppPool in (Get-IISAppPool).WorkerProcesses.AppPoolName) { MakeData $AppPool }
