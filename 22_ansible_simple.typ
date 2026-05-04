#show raw.line: it => {
  show regex("<[A-Z][A-Z0-9-]*>"): it => highlight(
    fill: orange.lighten(60%),
    it,
  )
  it
}

= Ansible Backup - Simple
_Verwendet Kurznamen wie `ios_command` und `copy` statt vollqualifizierten Modulnamen -> funktioniert dadurch besser mit älteren Ansible-Versionen als die erweiterte Version._

== Dateistruktur
```
~/ansible/
├── config.txt
├── playbook.yml
└── inventories/
    └── hosts.yml
```

== Netzwerk Konfiguration
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

== Cisco Collection installieren (sollte aber schon vorinstalliert sein)
```bash
ansible-galaxy collection install cisco.ios
```

== Playbook (`playbook.yml`)
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

== Playbook (`hosts.yml`)
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

== Playbook ausführen
```bash
ansible-playbook -i inventories/hosts.yml playbook.yml
```
