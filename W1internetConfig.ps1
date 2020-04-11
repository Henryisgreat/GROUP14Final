New-NetIPAddress -InterfaceAlias Ethernet0 -IPAddress 10.0.5.100  -PrefixLength 24 -DefaultGateway 10.0.5.2
Set-DnsClientServerAddress -InterfaceAlias "Ethernet0" -ServerAddresses 10.0.5.5
Rename-Computer -NewName Group14
