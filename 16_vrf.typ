= Virtual Routing and Forwarding (VRF)

== VRF Lite

*VRF anlegen*
```
ip vrf <VRF-NAME>
  rd <RD-WERT>
  route-target both <RT-WERT>
```

*Interface einem VRF zuweisen*
```
interface <INTERFACE>
  ip vrf forwarding <VRF-NAME>
```

*Route-Leaking (Statische Routen für VRF und globale Tabelle)*
```
ip route vrf <VRF-NAME> 0.0.0.0 0.0.0.0 <NEXT-HOP> global
ip route <NETZ> <NETZMASKE> <INTERFACE | NEXT-HOP>
```

== MPLS Overlay VPN

*BGP VPNv4 aktivieren*
```
router bgp <EIGENES-AS>
  address-family vpnv4
    neighbor <PE-ODER-P-ROUTER-IP> activate
  address-family ipv4
    no neighbor <GLEICHE-IP> activate
```

*BGP-Konfiguration für ein VRF*
```
address-family ipv4 vrf <VRF-NAME>
  neighbor <CE-IP> remote-as <CE-AS>
  neighbor <CE-IP> next-hop-self
  neighbor <CE-IP> update-source <INTERFACE>
  neighbor <CE-IP> activate
```
