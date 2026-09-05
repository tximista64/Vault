---
tags:
  - networking
  - tcp-ip
  - osi-model
  - course/htb-academy
---

# The TCP/IP Model

Modèle en 4 couches, aussi appelé **Internet Protocol Suite**. **IP** opère au niveau Network (OSI layer 3), **TCP** au niveau Transport (OSI layer 4).

## Les 4 couches

| # | Couche | Rôle |
|---|---|---|
| 4 | **Application** | Accès aux services des couches inférieures, définit les protocoles d'échange de données |
| 3 | **Transport** | Services de session (**TCP**) et de datagramme (**UDP**) pour la couche Application |
| 2 | **Internet** | Adressage, packaging et routage des paquets |
| 1 | **Link** | Pose et réception des paquets TCP/IP sur le medium réseau — indépendant du format de trame et du medium |

## Tâches principales

| Tâche | Protocole | Description |
|---|---|---|
| **Logical Addressing** | IP | Structure la topologie réseau — subnetting, network classes, CIDR |
| **Routing** | IP | Détermine le prochain nœud à chaque étape jusqu'au destinataire |
| **Error & Control Flow** | TCP | Maintient une connexion virtuelle avec échange continu de messages de contrôle |
| **Application Support** | TCP/UDP | Les ports TCP/UDP distinguent les applications et leurs flux de communication |
| **Name Resolution** | DNS | Résout les **FQDN** en adresses IP |

## TCP/IP vs OSI

TCP/IP fusionne plusieurs couches OSI — plus souple, orienté pratique. OSI reste la référence analytique pour décomposer le trafic couche par couche.
