= Simple Network Management Protokoll (SNMP)

== Cisco

*SNMP MIB-View*
```
snmp-server view <VIEW_NAME> system included
snmp-server view <VIEW_NAME> interfaces included
snmp-server view <VIEW_NAME> ip included
```

*SNMP Authentication mit Access Restriction*
```
snmp-server group <GROUP_NAME> v3 auth [read | write | notify] <VIEW_NAME>
snmp-server user <USER_NAME> <GROUP_NAME> v3 auth sha <PASSWORD>
```

*SNMP Authentication mit All View*
```
snmp-server group <GROUP_NAME> v3 auth
snmp-server user <USER_NAME> <GROUP_NAME> v3 auth sha <PASSWORD>
```

*SNMP Metadata*
```
snmp-server contact <CONTACT_INFO>
snmp-server location <LOCATION_INFO>
snmp-server chassis-id <DEVICE_INFO>
```

== Linux

*SNMP Abfrage*
```
snmpwalk -v 3 -l authNoPriv -u <USERNAME> -a SHA -A <PASSWORT> <IP> [system | interfaces | ip | ipForward | <OID>]
```

Aliases funktionieren nur auf dem CSR1000 Image

== Cisco OIDs

#table(
  columns: 2,
  align: left,
  [*OID*], [*Beschreibung*],
  [1.3.6.1.2.1.1.5], [Hostname],
  [1.3.6.1.2.1.2.2.1.2], [Interfaces],
  [1.3.6.1.2.1.2.2.1.8], [Interface Status],
  [1.3.6.1.2.1.2.2.1.11], [Incoming Packets],
)
