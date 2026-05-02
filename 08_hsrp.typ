= Hot Standby Router Protocol (HSRP)

*Router konfigurieren*
```
standby version 2
standby <NUMBER> ip <IP>
standby <NUMBER> priority <NUMBER>
standby <NUMBER> preempt
standby <NUMBER> track <TRACK-NUMBER> decrement <NUMBER>
```

*Tracking konfigurieren*
```
ip sla <NUMBER>
  icmp-echo <IP> source-interface <INT>
track <TRACK-NUMBER> ip sla <NUMBER> reachability
```
