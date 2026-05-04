= Trunking Interfaces Switch
```
int <port>
sw trunk encap dot1q
sw mode trunk
sw trunk native vlan 1
sw trunk allow vlan 10,20,30,1
```


= Etherchannel

*Port für Etherchannel*
```
int ra gig1/1, gig1/2
shut
sw trunk encap dot1q
channel-group 1 mode active
no shut
```
*Channel-Group konfigurieren*
```
int port-channel 1
sw trunk encap dot1q
sw mode trunk
sw trunk native vlan 1
sw trunk allow vlan 10,20,30,1
```
