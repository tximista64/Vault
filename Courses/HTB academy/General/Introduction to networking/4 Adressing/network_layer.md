---
tags:
  - networking
  - osi-model
  - course/htb-academy
---

# Network Layer (OSI Layer 3)

Gère l'échange et le **routage** des paquets entre nœuds, de la source jusqu'à la destination — y compris entre subnets avec des schémas d'adressage différents.

## Fonctions principales

- **Logical Addressing** : identification des nœuds réseau
- **Routing** : construction des routing tables, acheminement paquet par paquet

Les paquets transitent de nœud en nœud (routeurs) sans remonter aux couches supérieures — chaque nœud intermédiaire leur assigne une nouvelle destination et les retransmet.

## Protocoles courants

| Protocole | Rôle |
|---|---|
| **IPv4 / IPv6** | Adressage logique et routage |
| **IPsec** | Sécurisation des communications IP |
| **ICMP** | Messages de contrôle et d'erreur |
| **IGMP** | Gestion des groupes multicast |
| **RIP** | Protocole de routage à vecteur de distance |
| **OSPF** | Protocole de routage à état de liens |
