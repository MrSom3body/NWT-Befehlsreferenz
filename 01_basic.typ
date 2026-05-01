= Basic Configuration

```
en
conf t
hostname router
no banner *
no ip domain lookup
ip domain name example.com

crypto key gen rsa usa mod 1024
ip ssh version 2

username cisco algo scry secret cisco
username cisco priv 15

line con 0
login local
logging sync
exec-timeout 0

line vty 0 924
login local
logging sync
exec-timeout 0
transport input telnet ssh
```
