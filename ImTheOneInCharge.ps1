$NewOwner = "WhoWillNowOwnTheFile"
$File = "C:\Users\TheFileYouWantToFullyOwn"
$acl = Get-Acl $File
$acl.SetOwner([System.Security.Principal.NTAccount]$NewOwner)
Get-ChildItem -Path $File -Recurse | ForEach-Object {
    $aclObjet = Get-Acl $_.FullName
    $aclObjet.SetOwner([System.Security.Principal.NTAccount]$NewOwner)
    Set-Acl -Path $_.FullName -AclObject $aclObjet
}
Set-Acl -Path $File -AclObject $acl