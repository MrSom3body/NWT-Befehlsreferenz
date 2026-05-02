= Syslog

#table(
  columns: 2,
  align: left,
  [*Level*], [*Beschreibung*],
  [0], [Emergency],
  [1], [Alert],
  [2], [Critical],
  [3], [Error],
  [4], [Warning],
  [5], [Notice],
  [6], [Informational],
  [7], [Debug],
)

*Syslog Konfiguration*
```
logging on
logging trap <LVL>
logging host <IP>
logging host <IP> transport udp port <PORT>
logging source-interface <INT>
```

*ACL-Logging*
```
ip access-list extended <name>
  deny ip any host <IP> log
```

*Linux rsyslog Server (File: /etc/rsyslog.conf)*
```
Module (load="imudp")
Input (type="imudp" port="514")
```
