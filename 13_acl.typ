= Access Control Lists
== Standard
```
ip access-list <NUMBER>
  <NUMBER> <PERMIT|DENY> <SOURCE> <WILDCARD>
  <PERMIT|DENY> <PROTOCOL> host <IP> [log]
```

== Extended
```
ip access-list <number|name>
  <NUMBER> <PERMIT|DENY> <PROTOCOL> <SOURCE> <WILDCARD> <DESTINATION> <WILDCARD> eq <PORT>
  <PERMIT|DENY> <PROTOCOL> host <IP> host <IP> eq <PORT> [log]
```

== CBAC
```
ip inspect name <NAME> <PROTOCOL>
interface <INT>
  ip inspect <NAME> out
```
