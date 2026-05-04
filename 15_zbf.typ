= Zone-Based Firewall

*Anlegen einer Class-Map*
```
class-map type inspect match-any <CLASSMAP-NAME>
  match access-group name <ACCESS-LIST>
```

*Erstellen einer Policy-Map unter Verwendung einer Class-Map*
```
policy-map type inspect <POLICYMAP-NAME>
  class type inspect <CLASSMAP-NAME>
    pass
  class class-default
    drop
```

*Security-Zone anlegen*
```
zone security <ZONE-NAME>
```

*Zone-Pair anlegen*
```
zone-pair security <ZONE-NAME>_to_<ZONE-NAME> source <ZONE-NAME> destination <ZONE-NAME>
  service-policy type inspect <POLICYMAP-NAME>
```

*Interface mit einer Zone assoziieren*
```
interface <INT>
  zone-member security <ZONE-NAME>
```
