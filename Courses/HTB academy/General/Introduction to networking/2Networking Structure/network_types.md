---
tags:
  - networking
  - vpn
  - ip-addressing
  - course/htb-academy
---

# Network Types

## Termes courants

| Type | Définition |
|---|---|
| **WAN** (Wide Area Network) | Internet / ensemble de LAN interconnectés |
| **LAN** (Local Area Network) | Réseau local (domicile, bureau) |
| **WLAN** (Wireless Local Area Network) | LAN via Wi-Fi — même principe, sans câble |
| **VPN** (Virtual Private Network) | Donne l'illusion d'être connecté à un réseau distant |

### WAN
Identifiable par l'usage du protocole **BGP** et des adresses **hors RFC 1918**. Les grandes entreprises peuvent avoir un WAN interne (intranet / airgap network).

### LAN / WLAN
Utilisent des adresses **RFC 1918** (`10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`). La seule différence LAN/WLAN est le support physique (câble vs Wi-Fi).

### VPN — 3 types

**Site-To-Site VPN** : relie deux réseaux entiers via Internet (routeur ↔ routeur ou firewall ↔ firewall). Typique des entreprises multi-sites.

**Remote Access VPN** : crée une interface virtuelle (**TUN adapter**) sur le poste client. HTB utilise OpenVPN.
- **Split-Tunnel VPN** : seul le trafic vers le réseau cible passe par le VPN — le reste sort directement par Internet. Pratique pour HTB, risqué en entreprise (malware non détecté par les outils de détection réseau).

**SSL VPN** : s'exécute dans le navigateur web, diffuse des applications ou des sessions desktop. Exemple : Pwnbox de HTB.

---

## Book Terms

| Type | Définition |
|---|---|
| **GAN** (Global Area Network) | Réseau mondial — Internet, câbles sous-marins, satellites |
| **MAN** (Metropolitan Area Network) | Réseau régional reliant plusieurs LAN via fibre optique |
| **PAN / WPAN** (Wireless Personal Area Network) | Réseau personnel — quelques mètres (USB / Bluetooth / Piconet) |

### WPAN et IoT
Protocoles dédiés aux réseaux domotiques et **IoT** : **Insteon**, **Z-Wave**, **ZigBee**.
