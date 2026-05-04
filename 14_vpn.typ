= Virtual Private Network (VPN)

== IPsec

*ISAKMP-Policy konfigurieren*
```
crypto isakmp policy <NUMBER>
  authentication <AUTH>
  encryption <ENC>
  group <NUMBER>
  hash <HASH>
  lifetime <NUMBER>
```

*Peer konfigurieren*
```
crypto isakmp identity address
crypto isakmp key <PW> address <IP>
```

*Transform-Set konfigurieren*
```
crypto ipsec transform-set <NAME> <ENC> <HASH>
```

*Crypto-Map konfigurieren*
```
crypto map <NAME> <NUMBER> ipsec-isakmp
  set transform-set <NAME>
  match address <ACL>
  set peer <IP>
```

*Crypto-Map zuweisen (auf einem Interface)*
```
crypto map <NAME>
```

== Dynamic Multipoint VPN (DMVPN)

*Hub Config*
```
interface Tunnel0
  ip address <IP> <SUBNET>
  ip mtu 1440
  ip nhrp authentication <SHARED-SECRET>
  ip nhrp map multicast dynamic
  ip nhrp network-id 1
  tunnel source <INT>
  tunnel mode gre multipoint
  ip nhrp redirect ! Phase 3
```

*Spoke Config*
```
interface Tunnel0
  ip address <IP> <SUBNET>
  ip mtu 1440
  ip nhrp authentication <SHARED-SECRET>
  ip nhrp map <HUB-IP-TUN> <HUB-IP>
  ip nhrp map multicast <HUB-IP>
  ip nhrp nhs <HUB-IP-TUN>
  ip nhrp network-id 1
  tunnel source <INT>
  tunnel mode gre multipoint
  ip nhrp shortcut ! Phase 3
```

== DMVPN verschlüsseln mit ikev2
```
# ikev2 reingeben
crypto ikev2 keyring RING
    peer ALL
        address 0.0.0.0 0.0.0.0
        pre-shared-key cisco123!
    exit
exit

crypto ikev2 profile PROFILE
    keyring local RING
    authentication remote pre-share
    authentication local pre-share
    match identity remote address 0.0.0.0
exit

crypto ipsec profile PROFILE
    set ikev2-profile PROFILE
exit

int tunnel0
    tunnel protection ipsec profile PROFILE
exit

# DMVPN ip ospf network and priority commands
! im Tunnel Interface
ip ospf network point-to-multipoint
! nur auf Spokes wegen DR participation
ip ospf priority 0
```




== Front-Door-VRFs

VRFs bei doppelten Default-Routen. Wenn gesamter Traffic über Hauptstandort laufen soll.

```
! Anlegen eines VRFs
vrf definition FVRF
  address-family ipv4 unicast

! VRF auf Interface Richtung ISP anwenden
interface <INT>
  vrf forwarding FVRF

! Default-Route in VRF Richtung ISP anlegen
ip route vrf FVRF 0.0.0.0 0.0.0.0 1.1.1.254

! VRF auf IKEv2 Profile anwenden
crypto ikev2 profile IKEV2_PROFILE
  match fvrf FVRF

! VRF für Tunnelaufbau verwenden (Hub)
interface Virtual-Template 1 type tunnel
  tunnel vrf FVRF

! VRF für Tunnelaufbau verwenden (Spoke)
interface Tunnel 0
  tunnel vrf FVRF
```
