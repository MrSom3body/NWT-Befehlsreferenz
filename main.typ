#import "@preview/cram-snap:0.2.2": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *

#set document(
  title: [NWT – Cheatsheet],
  description: [Cheatsheet für die NWT sRDP der 5CN],
  author: "5CN",
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (x: 0.8cm, y: 1cm),
)

#set text(font: "Atkinson Hyperlegible", size: 8pt)
#show raw: set text(font: "Iosevka")

#set par(spacing: 0.4em)

#show raw.where(block: true): block.with(breakable: false)

#show heading.where(level: 1): it => {
  v(0.2em)
  line(length: 100%, stroke: stroke(
    paint: rgb("#a9aaa9"),
    dash: "dashed",
    cap: "round",
  ))
  it
}

#show: codly-init.with()
#codly(languages: codly-languages) // number-format: none)

#show: cram-snap.with(
  title: [*NWT – Cheatsheet*],
  subtitle: [Cheatsheet für die NWT sRDP der 5CN],
  column-number: 3,
)

#include "01_basic.typ"
#include "02_stp.typ"
#include "03_vtp.typ"
#include "04_switching.typ"
#include "05_etherchannel.typ"
#include "06_portsecurity.typ"
#include "07_dhcp.typ"
#colbreak(weak: true)
#include "08_nat.typ"
#include "09_hsrp.typ"
#include "10_rip.typ"
#include "11_ospf.typ"
#colbreak(weak: true)
#include "12_authentication.typ"
#include "13_bgp.typ"
#include "14_acl.typ"
#include "15_vpn.typ"
#include "16_zbf.typ"
#include "18_show.typ"
#include "19_linux.typ"
#include "20_snmp.typ"
#include "21_syslog.typ"
#include "22_ansible.typ"
#colbreak(weak: true)
#include "23_ansible_simple.typ"
