= HSRP

```
standby version 2
standby <NUMBER> ip <IP>
standby <NUMBER> priority <NUMBER>
standby <NUMBER> preempt
standby <NUMBER> track <TRACK-NUMBER> decrement <NUMBER>

ip sla <NUMBER>
  icmp-echo <IP> source-interface <INT>
track <TRACK-NUMBER> ip sla <NUMBER>
reachability
```
