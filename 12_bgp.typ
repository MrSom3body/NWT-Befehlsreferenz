#colbreak()
= Border Gateway Protocol (BGP)

*AS konfigurieren*
```
router bgp <AS>
  bgp log-neighbor-changes
  network <NETWORK> mask <SUBMASK>
  neighbor <IP> remote-as <AS>
  neighbor <IP> update-source <INT>
  neighbor <IP> route-reflector-client
  neighbor <IP> next-hop-self
  neighbor <IP> default-originate
  neighbor <IP> ebgp-multihop <AS>
```

*BGP Peer Groups*
```
router bgp <AS>
  neighbor <PEER-GROUP> peer-group
  neighbor <PEER-GROUP> description <DESCRIPTION>
  neighbor <IP> peer-group <PEER-GROUP>
  neighbor <PEER-GROUP> remote-as <AS>
  neighbor <PEER-GROUP> update-source <INT>
  neighbor <PEER-GROUP> version 4
  neighbor <PEER-GROUP> next-hop-self
  neighbor <PEER-GROUP> route-map <MAP-NAME> in/out
```

*BGP-IPv4*
```
router bgp <AS>
  address-family ipv4
    network <NETWORK>
    neighbor <IP> remote-as <AS> ...
    neighbor <IP> activate
```

*BGP-IPv6*
```
ipv6 unicast-routing
router bgp <AS>
  address-family ipv6
    network <NETWORK>
    neighbor <IP> remote-as <AS> ...
    neighbor <IP> activate
```

== BGP Communities

*Customer Config*
```
ip prefix-list <NAME> seq <NUMBER> permit <NETWORK>
route-map <NAME> permit <NUMBER>
  match ip address prefix-list <NAME>
  match community <COMMUNITY LIST NUMBER>
  set community <NUMBER>
route-map <NAME> permit <NUMBER>
! Explizites Permit-Statement angeben, sonst implizites Deny

router bgp <AS>
  neighbor <IP> route-map <NAME> out
  neighbor <IP> send-community
```

*ISP Config*
```
router bgp <AS>
  neighbor <IP> send-community
  neighbor <IP> route-map <NAME> out
  neighbor <IP> route-map <NAME> in

ip community-list <NUMBER> permit <NUMBER:NUMBER>

route-map <NAME> permit <NUMBER>
  match community <NUMBER>
  set <ATTRIBUTE MANIPULATION>
route-map <NAME> permit <NUMBER>
! Explizites Permit-Statement angeben, sonst implizites Deny
```

== BGP Manipulation

*Route-Map*
```
router bgp <AS>
  neighbor <IP> route-map <MAP-NAME> in
  neighbor <IP> route-map <MAP-NAME> out
```

*Setting Local Preference*
```
route-map <MAP-NAME> permit <NUMBER>
  set local-preference <VALUE>
```

*AS-Path Prepending*
```
route-map <MAP-NAME> permit <NUMBER>
  set as-path prepend <AS> <AS> <AS>
```

*MED (Multi-Exit Discriminator)*
```
route-map <MAP-NAME> permit <NUMBER>
  set metric <VALUE>
```

*Weight Attribute*
```
route-map <MAP-NAME> permit <NUMBER>
  set weight <VALUE>
```

*BGP-Filter*
```
router bgp <AS>
  neighbor <IP> prefix-list <NAME> in
  neighbor <IP> prefix-list <NAME> out
  neighbor <IP> route-map <MAP-NAME> in
  neighbor <IP> route-map <MAP-NAME> out
  neighbor <IP> filter-list <AS-PATH-LIST> in
  neighbor <IP> filter-list <AS-PATH-LIST> out
```

*Prefix-List Example*
```
ip prefix-list <NAME> seq <NUMBER> permit <NETWORK> <ge/le> <MASKLEN> <ge/le> <MASKLEN>
ip prefix-list <NAME> seq <NUMBER> deny <NETWORK>
ip prefix-list preflist permit 192.168.0.0/16 ge 24 le 28
```

*AS Path Filter*
```
ip as-path access-list <NUMBER> permit/deny <REGEX>
ip as-path access-list <NUMBER> permit ^<AS>$
ip as-path access-list <NUMBER> deny .*
```

*Route Map Example*
```
route-map <NAME> permit/deny <NUMBER>
  match <CONDITION>
  set <ATTRIBUTE MANIPULATION>
route-map <NAME> permit <NUMBER>
! Explizites Permit-Statement angeben, sonst implizites Deny
```

*Blacklist*
```
route-map <NAME> deny <NUMBER>
  match <CONDITION>
route-map <NAME> permit <NUMBER>
```

*BGP Confederations*
```
router bgp <AS>
  bgp confederation identifier <CONFED-AS>
  bgp confederation peers <PEER-AS>
  neighbor <IP> remote-as <PEER-AS>
  neighbor <IP> remote-as <LOCAL-AS>
```

*BGP Multipath*
```
router bgp <AS>
  maximum-paths <NUMBER> # ebgp
  bgp bestpath as-path multipath-relax # ebgp
  maximum-paths ibgp <NUMBER> # ibgp
```

*Soft Reconfiguration*
```
router bgp <AS>
  neighbor <IP> soft-reconfiguration inbound
  clear ip bgp <IP> soft in
  clear ip bgp <IP> soft out
```

*Route Reflectors*
```
router bgp <AS>
  neighbor <IP> route-reflector-client
```

*Dampening*
```
router bgp <AS>
  bgp dampening <HALF-LIFE> <REUSE> <SUPPRESS> <MAX-SUPPRESS>
```

*Auto Summary*
```
router bgp <AS>
  auto-summary
```
