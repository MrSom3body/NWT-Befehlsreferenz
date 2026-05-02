= Open Shortest Path First (OSPF)

*OSPF konfigurieren*
```
router ospf <ID>
router-id <ID>
network <NETWORK> <WILDCARD> area <AREA-ID>
passive-interface <INT>
```

*Priority konfigurieren*
```
priority <NUMBER>
ip ospf priority <NUMBER>
```

*Authentication*
```
int <INT>
  ip ospf authentication key-chain <KEY-CHAIN>
```
