#show raw.line: it => {
  show regex("<[A-Z][A-Z0-9-]*>"): it => highlight(
    fill: orange.lighten(60%),
    it,
  )
  it
}

= Ansible Backup - Multi Host
_Verwendet vollqualifizierte Modulnamen wie `ansible.builtin.*` und `cisco.ios.*` -> benötigt eine neuere Ansible-Version._

== Dateistruktur
```
~/ansible-backup/
├── ansible.cfg
├── hosts.ini
├── backup.yml
└── backups/
```

== Netzwerk Konfiguration
```
# /etc/network/interfaces
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

== `ansible.cfg`
```ini
[defaults]
hostfile = ./hosts.ini
host_key_checking = false
timeout = 86400
```

== `hosts.ini`
```ini
[cisco]
<HOSTNAME> ansible_host=<IP>

[cisco:vars]
ansible_user=<USER>
ansible_password=<PASS>
ansible_connection=network_cli
ansible_network_os=ios
```

== Cisco Collection installieren
```bash
ansible-galaxy collection install cisco.ios
```

== Test, ob Cisco Node mit Collection funktioniert
```
ansible <HOSTNAME> -i hosts -m cisco.ios.ios_facts
```

== Playbook (`backup.yml`)
```yaml
- name: Backup der Cisco Geraete Konfiguration und TFTP-Upload
  hosts: cisco
  gather_facts: no
  connection: network_cli
  vars:
    tftp_server: "<TFTP-IP>"
    base_path: "<PFAD>"
  tasks:
    - name: Backup Ordner lokal erstellen
      ansible.builtin.file:
        path: "{{ base_path }}"
        state: directory
        mode: '0755'
      delegate_to: localhost

    - name: Timestamp generieren
      ansible.builtin.set_fact:
        backup_timestamp: "{{ lookup('pipe', 'date +%Y%m%d-%H%M') }}"

    - name: Running Config auslesen
      ios_command:
        commands:
          - show running-config
      register: config_output

    - name: Konfiguration lokal speichern
      ansible.builtin.copy:
        content: "{{ config_output.stdout[0] }}"
        dest: "{{ base_path }}/{{ inventory_hostname }}_{{ backup_timestamp }}.cfg"
      delegate_to: localhost

    - name: Konfigurationsdatei auf den TFTP Server hochladen
      shell: "curl -T {{ base_path }}/{{ inventory_hostname }}_{{ backup_timestamp }}.cfg
              tftp://{{ tftp_server }}/{{ inventory_hostname }}_{{ backup_timestamp }}.cfg"
      delegate_to: localhost

    - name: Lokale Backup-Datei entfernen
      ansible.builtin.file:
        path: "{{ base_path }}/{{ inventory_hostname }}_{{ backup_timestamp }}.cfg"
        state: absent
      delegate_to: localhost
```

== Playbook ausführen
```bash
ansible-playbook backup.yml
```
