# How to check ACL of shared folder
$Outfile = "\\Server_Name\Shared_Folder_Name"
((Get-Acl $Outfile).Access | select FileSystemRights, IdentityReference | Format-List | Out-String).Trim()
