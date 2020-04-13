  


echo "--------Add WKS User--------"
$Userfirst = Read-Host "User first name: "
$Usersec = Read-Host "user second name: "
$userlogon = Read-Host "user log-in name"
New-ADUser $userlogon -GivenName $Userfirst -Surname $Usersec -SamAccountName $userlogon -UserPrincipalName $userlogon -AccountPassword(Read-Host -AsSecureString "enter password" ) -Enabled $true
echo "useradmin made"
Add-ADGroupMember -Identity "Domain Admins" -Members group14-adm
echo "added to admin group"


echo "--------Add DNS Records--------"
$dnsA = Read-Host "Name of server: "
$dnsip = Read-Host "IP of server: "
$ptrname = Read-Host "Name of Pointer Record: "
Add-DnsServerResourceRecordA -Name $dnsA -CreatePtr -ZoneName "group14.local" -AllowUpdateAny -IPv4Address $dnsip
echo "Record A made"
Add-DnsServerResourceRecordPtr -Name $dnsA -ZoneName "10.0.5.in-addr.arpa" -PtrDomainName $ptrname -ComputerName $ptrname -AllowUpdateAny 
echo "ptr for record a made"
ping $ptrname