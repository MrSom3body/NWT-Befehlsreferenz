= Spanning Tree Protocol (STP)

*STP-Mode setzen*
```
spanning-tree mode <MODE>
```

*Priority einstellen*
```
spanning-tree vlan <ID> priority <NUMBER>
oder: spanning-tree vlan <ID> root primary/secondary
```

*STP-Security*
```
spanning-tree portfast
spanning-tree bpduguard enable
spanning-tree bpduguard
```

*MST*
```
spanning-tree mode mst
spanning-tree mst configuration
    instance 1 vlan 10
    instance 2 vlan 20
exit
spanning-tree mst 2 root primary
spanning-tree mst 1 root secondary
```
