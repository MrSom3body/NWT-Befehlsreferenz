= Port-Security

*Port-Security aktivieren*
```
switchport port-security
```

*Violation-Mode setzen*
```
switchport port-security violation <MODE>
```

*Maximum an MAC-Adressen definieren*
```
switchport port-security maximum <NUMBER>
```

*Aging definieren*
```
switchport port-security aging time <NUMBER>
```

*DHCP snooping, ip DHCP snooping trust*
```
ip dhcp snooping
ip dhcp snooping vlan <VLANID>
! auf interface wo dhcp server antworten kann
int <INT_RICHTUNG_SERVER>
  ip DHCP snooping trust
ip dhcp relay information trust-all
```

*ARP inspection*
```
ip arp inspection vlan 20
! auf interface wo kein Client
ip arp inspection trust
```

*errdisable recovery*
```
errdisable recovery cause psecure-violation
errdisable recovery interval <SECONDS>
```