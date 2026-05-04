= Dynamic Host Configuration Protocol (DHCP)

*DHCP-Pool definieren*
```
ip dhcp pool <NAME>
  network <NETWORK> <SUBMASK>
  default-router <IP>
  dns-server <IP>
  domain-name <NAME>
```

*Adressen exkludieren*
```
ip dhcp excluded-address <IP>
```

*DHCP-Relay-Agent konfigurieren*
```
ip helper-address <IP>
```

*DHCP Identifier*
```
ip dhcp pool test #Um MAC von Client herauszufinden
debug ip dhcp server packets
no ip dhcp pool test
ip dhcp pool <NAME>
    host <IP> <SM>
    client-identifier <CLIENT-ID>
```
