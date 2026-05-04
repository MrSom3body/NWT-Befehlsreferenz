= Routing Information Protocol (RIP)

*RIP konfigurieren*
```
router rip
  version 2
  no auto-summary
  network <NETWORK>
  passive-interface <INT>
```

*Authentication*
```
interface <INT>
  ip rip authentication key-chain <KEY-CHAIN>
```
