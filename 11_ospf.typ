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
int <OSPF-INIT>
    priority <NUMBER>
    ip ospf priority <NUMBER>
```

*Authentication*
```
int <INT>
  ip ospf authentication key-chain <KEY-CHAIN>
```
