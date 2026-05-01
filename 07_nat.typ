= NAT

```
ip nat <inside/outside>
! Static NAT
ip nat inside source static <INSIDE LOCAL> <INSIDE GLOBAL>

! PAT
access-list <NUMBER> permit <NETWORK> <WILDCARD>
ip nat inside source list <NUMBER> interface <INT> overload
```
