---
tags:
  - networking
  - ip-addressing
  - ipv4
  - course/htb-academy
---

# IP Addresses

## MAC vs IP

- **MAC address** : identifie un hôte à l'intérieur d'un même réseau (étage/appartement).
- **IPv4/IPv6** : identifie un hôte sur l'ensemble du réseau/Internet (adresse postale + quartier).

## Structure IPv4

32 bits, organisés en **4 octets** (0-255), séparés par des points — **dotted-decimal notation**.

```
Binaire :  1100 0000 . 1010 1000 . 0000 1010 . 0010 0111
Décimal :     192    .    168    .     10    .     39
```

Chaque adresse = **network part** + **host part**. Géré par l'**IANA** sur Internet.

## Classes IPv4

| Classe | Plage | Subnet mask | CIDR |
|---|---|---|---|
| A | 1.0.0.0 – 127.255.255.255 | 255.0.0.0 | /8 |
| B | 128.0.0.0 – 191.255.255.255 | 255.255.0.0 | /16 |
| C | 192.0.0.0 – 223.255.255.255 | 255.255.255.0 | /24 |
| D | 224.0.0.0 – 239.255.255.255 | Multicast | — |
| E | 240.0.0.0 – 255.255.255.255 | Réservé | — |

## Adresses réservées dans un subnet

Chaque subnet réserve **2 adresses** :
- **Network address** : première adresse (identifie le réseau).
- **Broadcast address** : dernière adresse (envoie un paquet à tous les hôtes du réseau simultanément).

La **default gateway** (routeur) prend conventionnellement la première ou la dernière adresse assignable.

## Système binaire

Chaque octet = 8 bits avec des valeurs positionnelles : `128 | 64 | 32 | 16 | 8 | 4 | 2 | 1`

Exemple — octet `192` :
```
Valeurs :  128  64  32  16  8  4  2  1
Bits :       1   1   0   0  0  0  0  0
Somme  :  128 + 64 = 192
```

## Subnet mask

Même structure qu'une IPv4 — les bits à `1` = partie réseau, les bits à `0` = partie hôte.

```
255.255.255.0 → 1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
```

## CIDR (Classless Inter-Domain Routing)

Remplace les classes fixes. Le **suffixe CIDR** = nombre de bits à `1` dans le subnet mask.

```
192.168.10.39  +  255.255.255.0  →  192.168.10.39/24
                                      (24 bits réseau)
```

Permet de découper l'espace IPv4 en subnets de taille arbitraire.
