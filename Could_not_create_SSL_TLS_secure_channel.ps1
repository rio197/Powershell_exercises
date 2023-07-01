#https://learn.microsoft.com/en-us/windows/win32/secauthn/tls-cipher-suites-in-windows-8-1
#https://support.vertigis.com/hc/en-us/articles/11461032941586-Windows-Server-2012-R2-and-Advanced-TLS-1-2-Cipher-Suites

#https://stackoverflow.com/questions/41618766/powershell-invoke-webrequest-fails-with-ssl-tls-secure-channel
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri https://apod.nasa.gov/apod/
