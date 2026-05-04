#import "@preview/cram-snap:0.2.2": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages) // number-format: none)

#set page(
  paper: "a4",
  flipped: false,
  margin: (x: 0.8cm, y: 1cm),
)

#set text(font: "Atkinson Hyperlegible", size: 8pt)
#show raw: set text(font: "Iosevka")

#set par(spacing: 0.4em)

#show heading.where(level: 1): it => {
  v(0.2em)
  line(length: 100%, stroke: stroke(
    paint: rgb("#a9aaa9"),
    dash: "dashed",
    cap: "round",
  ))
  it
}

#set document(
  title: [NWT – Cheatsheet],
  description: [Cheatsheet für die NWT sRDP der 5CN],
  author: "5CN",
)

#show: cram-snap.with(
  title: [*NWT – Cheatsheet*],
  subtitle: [Cheatsheet für die NWT sRDP der 5CN],
  column-number: 3,
)

#include "01_basic.typ"
#include "02_stp.typ"
#include "03_vtp.typ"
#include "04_etherchannel.typ"
#include "05_portsecurity.typ"
#include "06_dhcp.typ"
#include "07_nat.typ"
#include "08_hsrp.typ"
#include "09_rip.typ"
#include "10_ospf.typ"
#include "11_authentication.typ"
#include "12_bgp.typ"
#include "13_acl.typ"
#include "14_vpn.typ"
#include "15_zbf.typ"
#include "16_vrf.typ"
#include "17_show.typ"
#include "18_linux.typ"
#include "19_snmp.typ"
#include "20_syslog.typ"
#include "21_ansible.typ"
#include "22_ansible_simple.typ"
