# https://www.partitionwizard.com/resizepartition/powershell-get-disk-space.html
(hostname).toupper(); Get-CimInstance -Class win32_logicaldisk | Format-Table DeviceId, MediaType, @{n="Size";e={[math]::Round($_.Size/1GB,2)}},@{n="FreeSpace";e={[math]::Round($_.FreeSpace/1GB,2)}}
