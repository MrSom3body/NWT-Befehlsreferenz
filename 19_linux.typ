= Linux

== Networking

*Auflisten der IP-Adressen*
```
ip addr [show <interface>]
```

*Auflisten des Routing-Tables*
```
ip r
```

== Linux Netplan

Die Netplan Konfiguration befindet sich unter `/etc/netplan` in einem `.yaml` File.

*Anwenden einer Netplan Konfiguration*
```
netplan apply
```

*Netplan Konfiguration mit den wichtigsten Parametern*
```yaml
network:
  version: 2
  ethernets:
    <interfacename>:
      dhcp4: false
# falls DHCP an ist -> hier aufhören
      addresses:
        - <Adresse>/<Subnet>
      nameservers:
        addresses:
          - <DNS Server>
      routes:
        - to: default # Gateway
          via: 192.168.1.1
```
