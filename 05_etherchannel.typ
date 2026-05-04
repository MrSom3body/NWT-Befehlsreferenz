= Etherchannel

*Port für Etherchannel*
```
interface range <INT>
shutdown
switchport trunk encapsulation dot1q
channel-group <NUMBER> mode <MODE>
no shutdown
```

*Channel-Group konfigurieren*
```
interface port-channel <NUMBER>
switchport trunk encapsulation dot1q
switchport mode trunk
switchport trunk native vlan <VLAN>
switchport trunk allow vlan <VLANS>
```
