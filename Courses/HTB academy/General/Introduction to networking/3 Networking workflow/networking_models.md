---
tags:
  - networking
  - osi-model
  - tcp-ip
  - course/htb-academy
---

# Networking Models

Deux modèles de référence décrivent la communication réseau entre hôtes : **OSI** et **TCP/IP**.

## OSI Model (ISO/OSI)

7 couches avec des rôles strictement séparés, publié par l'**ITU** et l'**ISO**. Modèle de référence — plus détaillé, protocole strict.

| # | Couche | PDU |
|---|---|---|
| 7 | Application | Data |
| 6 | Presentation | Data |
| 5 | Session | Data |
| 4 | Transport | Segment / Datagram |
| 3 | Network | Packet |
| 2 | Data-Link | Frame |
| 1 | Physical | Bit |

## TCP/IP Model

4 couches — modèle pratique utilisé sur Internet. Terme générique pour une famille de protocoles incluant TCP, IP, **ICMP**, **UDP**, etc.

| Couche TCP/IP | Équivalent OSI |
|---|---|
| Application | 5-6-7 |
| Transport | 4 |
| Internet | 3 |
| Link | 1-2 |

## OSI vs TCP/IP

- **TCP/IP** : moins rigide, orienté pratique — permet de comprendre rapidement comment une connexion s'établit.
- **OSI** : plus strict, orienté analyse — permet de décomposer le trafic couche par couche.

En pentest : TCP/IP pour suivre le flux global, OSI pour analyser le trafic intercepté en détail.

## Packet Transfers et Encapsulation

À l'émission, chaque couche **ajoute un header** au **PDU** (Protocol Data Unit) reçu de la couche supérieure → c'est l'**encapsulation**.

À la réception, le processus est inversé : chaque couche **retire son header** et transmet les données à la couche supérieure → **décapsulation**.

```
Sender                          Receiver
Data        →                →  Data
+ TCP header (Segment)          - TCP header
+ IP header (Packet)            - IP header
+ MAC header (Frame)            - MAC header
→ Binary transmission →
```
