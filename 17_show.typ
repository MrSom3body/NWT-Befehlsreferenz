= Show-Befehle

*Allgemein*
```
show ip interface [brief]
show vlan [brief]
show cdp neighbor
show lldp
show ip route
```

*STP*
```
show spanning-tree vlan <VLAN ID>
```

*Etherchannel*
```
show etherchannel
show etherchannel summary
show etherchannel port-channel
```

*DHCP*
```
show ip dhcp bindings
```

*NAT*
```
show ip nat translations
```

*HSRP*
```
show standby neighbors
```

*ACL*
```
show access-lists
```

*OSPF*
```
show ip ospf database
show ip ospf neighbor
```

*RIP*
```
show ip rip database
show ip rip neighbor
```

*VPN*
```
show crypto isakmp sa
show crypto ipsec sa
show crypto ikev2 sa
show dmvpn
show ip nhrp
```

*Logging*
```
show logging
show vrf
```

*ZBF*
```
show zone security <ZONE>
show zone-pair security <ZONE-PAIR>
```

*BGP*
```
show ip bgp
show ip bgp neighbors
show ip bgp summary
show ip bgp community
show ip bgp route-map
show ip bgp filter-list
show ip bgp prefix-list
show ip bgp ipv4
show ip bgp ipv6
```

*VRF*
```
show ip route vrf CUSTOMER_A
show vrf
```

*SNMP*
```
show snmp
show snmp user <USER_NAME>
show snmp group
show snmp sessions brief
show snmp pending
```

*Debugging*
```
debug ip dhcp server packet
undebug all
```
