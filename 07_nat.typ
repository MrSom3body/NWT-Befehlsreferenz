= Network Address Translation (NAT)

*Interface definieren*
```
ip nat <inside/outside>
```

*Statisches NAT definieren*
```
ip nat inside source static <INSIDE LOCAL> <INSIDE GLOBAL>
```

*Port Address Translation (PAT) konfigurieren*
```
access-list <NUMBER> permit <NETWORK> <WILDCARD>
ip nat inside source list <NUMBER> interface <INT> overload
```
