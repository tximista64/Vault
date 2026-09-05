---
tags:
  - networking
  - ip-addressing
  - ipv6
  - course/htb-academy
---

# IPv6 Addresses

Successeur d'IPv4 — adresses de **128 bits** en notation hexadécimale. Peut coexister avec IPv4 (**Dual Stack**).

## IPv4 vs IPv6

| Caractéristique | IPv4 | IPv6 |
|---|---|---|
| Longueur | 32 bits | 128 bits |
| Représentation | Décimale | Hexadécimale |
| Plage | ~4,3 milliards | ~340 undécillions |
| Adressage dynamique | DHCP | SLAAC / DHCPv6 |
| IPsec | Optionnel | **Obligatoire** |
| Broadcast | Oui | **Non** (remplacé par multicast) |

## Avantages IPv6

- Espace d'adressage massif
- **SLAAC** : autoconfiguration sans DHCP
- Plusieurs adresses par interface
- Routage plus rapide
- Chiffrement end-to-end natif (IPsec)
- Paquets jusqu'à 4 GByte

## Types d'adresses

| Type | Description |
|---|---|
| **Unicast** | Une seule interface |
| **Anycast** | Plusieurs interfaces — une seule reçoit (la plus proche) |
| **Multicast** | Plusieurs interfaces — toutes reçoivent |

## Structure d'une adresse IPv6

128 bits → 8 blocs de 16 bits séparés par `:` :

```
Complète : fe80:0000:0000:0000:dd80:b1a9:6687:2d3b/64
Courte   : fe80::dd80:b1a9:6687:2d3b/64
```

- **Préfixe réseau** (partie réseau) : identifie le réseau/subnet.
- **Interface Identifier** (partie hôte) : dérivé de l'adresse MAC 48 bits → converti en 64 bits. Préfixe par défaut : **/64**.

## Règles de notation (RFC 5952)

- Caractères alphabétiques toujours en **minuscules**.
- Zéros non significatifs dans un bloc **omis** (`0001` → `1`).
- Blocs consécutifs de zéros remplacés par `::` — **une seule fois**, en partant de la gauche.

## Système hexadécimal

16 états par caractère (0-9, A-F) — plus compact que le binaire pour représenter les adresses.

```
192.168.12.160 → C0:A8:0C:A0  (hex)
```
