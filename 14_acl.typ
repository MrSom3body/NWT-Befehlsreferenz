= Access Control Lists (ACLs)

*Standard*
```
ip access-list standard <NAME>
  <NUMBER> <PERMIT|DENY> <SOURCE> <WILDCARD>
  <PERMIT|DENY> <PROTOCOL> host <IP> [log]
```

*Extended*
```
ip access-list extended <number|name>
  <NUMBER> <PERMIT|DENY> <PROTOCOL> <SOURCE> <WILDCARD> <DESTINATION> <WILDCARD> eq <PORT>
  <PERMIT|DENY> <PROTOCOL> host <IP> host <IP> eq <PORT> [log]
```

*CBAC*
```
ip inspect name <NAME> <PROTOCOL>
interface <INT>
  ip inspect <NAME> out
```

#colbreak(weak: true)
*Erlauben von Protokollen*
#table(
  columns: 3,
  align: left,
  [*Protokoll*], [*Port/Protokoll*], [*Multicast-Adresse*],
  table.cell(rowspan: 2, [*OSPF*]),
  table.cell(rowspan: 2, "ospf"),
  [224.0.0.5 (All OSPF Routers)],
  [224.0.0.6 (All OSPF DR/BDR)],
  [*RIP*], [udp 520], [224.0.0.9 (RIP v2)],
  [*HSRP*], [udp 1985], [224.0.0.2],
  [*ISAKMP*], [udp 500], [-],
  [*IPsec ESP*], [esp], [-],
  [*IPsec AH*], [ahp], [-],
  [*IKEv2*], [udp 500 / udp 4500 (NAT-T)], [-],
  [*GRE*], [gre], [-],
  [*Syslog*], [udp 514], [-],
  [*SNMP*], [udp 161], [-],
  [*NTP*], [udp 123], [-],
  [*DHCP*], [udp 67/68], [-],
  [*HTTP*], [tcp 80], [-],
  [*HTTPS*], [tcp 443], [-],
  [*SSH*], [tcp 22], [-],
  [*Telnet*], [tcp 23], [-],
  [*DNS*], [tcp/udp 53], [-],
  [*BGP*], [tcp 179], [-],
  [*FTP*], [tcp 20/21], [-],
  [*TFTP*], [udp 69], [-],
)
