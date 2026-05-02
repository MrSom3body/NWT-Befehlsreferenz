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
