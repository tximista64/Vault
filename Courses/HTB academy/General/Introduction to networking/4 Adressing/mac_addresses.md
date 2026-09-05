---
tags:
  - networking
  - mac-address
  - arp
  - course/htb-academy
---

# MAC Addresses

Adresse physique de **48 bits** (6 octets) en hexadécimal, propre à chaque interface réseau (Ethernet IEEE 802.3, Bluetooth IEEE 802.15, WLAN IEEE 802.11).

```
DE:AD:BE:EF:13:37
```

## Structure

| Partie | Octets | Rôle |
|---|---|---|
| **OUI** (Organization Unique Identifier) | 1-3 | Identifie le fabricant (attribué par l'IEEE) |
| **NIC** (Network Interface Controller) | 4-6 | Identifiant unique attribué par le fabricant |

## Bits spéciaux du 1er octet

| Bit | Position | Valeur 0 | Valeur 1 |
|---|---|---|---|
| LSB (dernier bit) | bit 0 | **Unicast** (1 destinataire) | **Multicast** (groupe) |
| Avant-dernier bit | bit 1 | **Global OUI** (IEEE) | **Locally Administrated** |

## Types d'adresses MAC

- **Unicast** : paquet vers un seul hôte.
- **Multicast** : paquet vers un groupe d'hôtes (`01:00:5E:xx:xx:xx`).
- **Broadcast** : `FF:FF:FF:FF:FF:FF` — vers tous les hôtes du réseau.

## Routage et MAC

- Même subnet → livraison directe à la MAC de destination.
- Subnet différent → envoi à la MAC de la **default gateway**, qui route ensuite via IP.
- La résolution IP → MAC se fait via **ARP**.

---

## ARP (Address Resolution Protocol)

Protocole Layer 2/3 qui résout une **adresse IP** en **adresse MAC** sur un LAN.

**Fonctionnement :**
1. **ARP Request** (broadcast) : *"Who has 10.129.12.101? Tell 10.129.12.100"*
2. **ARP Reply** (unicast) : *"10.129.12.101 is at AA:AA:AA:AA:AA:AA"*

```
1  10.129.12.100 -> 10.129.12.255  ARP  Who has 10.129.12.101? Tell 10.129.12.100
2  10.129.12.101 -> 10.129.12.100  ARP  10.129.12.101 is at AA:AA:AA:AA:AA:AA
```

---

## Attack Vectors

### MAC Spoofing
Changer sa MAC pour usurper celle d'un autre hôte → accès non autorisé au réseau.

### MAC Flooding
Inonder un switch avec des milliers de MACs différentes → saturation de la MAC table → le switch se comporte comme un hub (broadcast de tout le trafic).

### MAC Address Filtering Bypass
Certains réseaux n'autorisent que des MACs whitelistées → contournement par spoofing.

### ARP Spoofing / ARP Cache Poisoning
Envoyer de faux ARP replies pour associer sa propre MAC à l'IP d'un hôte légitime (ex: la gateway) → tout le trafic destiné à cet hôte est redirigé vers l'attaquant.

Outils : **Ettercap**, **Cain & Abel**.

```
1  Attaquant -> Victime  ARP  "10.129.12.255 is at CC:CC:CC:CC:CC:CC"  (faux reply)
→  La victime envoie maintenant son trafic gateway vers l'attaquant (MITM)
```

**Contremesures** : IPSec, SSL/TLS, firewalls, IDS, segmentation réseau, **Dynamic ARP Inspection (DAI)**.
