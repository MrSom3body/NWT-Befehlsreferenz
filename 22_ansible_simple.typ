#show raw.line: it => {
  show regex("<[A-Z][A-Z0-9-]*>"): it => highlight(
    fill: orange.lighten(60%),
    it,
  )
  it
}

= Ansible Backup - Simple für ein Gerät
== 1) Dateistruktur
```
~/ansible/
├── config.txt
├── playbook.yml
└── inventories/
    └── hosts.yml
```

== 2) Netzwerk Konfiguration
```
# /etc/network/interfaces oder einfach Rechtsklick aufs Device > Configure > Unterstes Edit
auto eth0
# DHCP
iface eth0 inet dhcp
# static
iface eth0 inet static
  address <IP>
  netmask <SUB>
  gateway <GW>
  up echo nameserver <NS> > /etc/resolv.conf
```

== 3) Cisco Collection installieren (sollte aber schon vorinstalliert sein)
```bash
ansible-galaxy collection install cisco.ios
```

== Test, ob Cisco Node mit Collection funktioniert
```ini
ansible <hostname> -i hosts -m cisco.ios.ios_facts
```

== 4) Playbook (`playbook.yml`)
```yaml
- name: Backup eines Routers
  hosts: <HOSTNAME>
  gather_facts: no
  tasks:
    - name: Get Running-Config
      ios_command:
        commands: show running-config
      register: router_config

    - name: Save Running-Config
      delegate_to: localhost
      copy:
        content: "{{ router_config.stdout[0] }}"
        dest: "./config.txt"

    - name: Upload to FTP Server
      delegate_to: localhost
      command: curl -T config.txt tftp://<TFTP-IP>/config.txt
```

== 5) Playbook (`hosts.yml`)
```yaml
routers:
  hosts:
    <HOSTNAME>:
      ansible_host: <IP>
  vars:
    ansible_user: <USER>
    ansible_password: <PASS>
    ansible_connection: network_cli
    ansible_network_os: ios
```

== 6) Playbook ausführen
```bash
ansible-playbook -i inventories/hosts.yml playbook.yml
```
