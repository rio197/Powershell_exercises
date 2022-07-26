# Search a log file for the last 2 entries of the phrase "Response Status Code:"

PS C:\Users> Get-Date; Get-Content file.log | Select-String "Response Status Code`:" | Select-Object -Last 2
