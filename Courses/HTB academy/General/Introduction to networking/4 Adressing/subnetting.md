---
tags:
  - networking
  - subnetting
  - ip-addressing
  - course/htb-academy
---

# Subnetting

Le subnetting divise une plage d'adresses IPv4 en sous-réseaux plus petits. Le **subnet mask** définit la frontière entre la partie réseau (bits fixes) et la partie hôte (bits variables).

## Calculer les adresses d'un subnet

Exemple : `192.168.12.160/26` → subnet mask `255.255.255.192`

| Adresse | Valeur | Règle |
|---|---|---|
| **Network address** | `192.168.12.128` | Tous les bits host à `0` |
| **First host** | `192.168.12.129` | Network + 1 |
| **Last host** | `192.168.12.190` | Broadcast - 1 |
| **Broadcast address** | `192.168.12.191` | Tous les bits host à `1` |
| **Hosts utilisables** | 62 | 2^6 - 2 = 62 |

## Diviser un subnet en sous-subnets

Pour diviser un subnet en **N** sous-subnets, N doit être une puissance de 2 — on étend le subnet mask d'autant de bits que l'exposant.

Exemple : `/26` (64 hôtes) → 4 subnets → 4 = 2² → étendre de **2 bits** → `/28`

| Subnet | Network | First host | Last host | Broadcast | CIDR |
|---|---|---|---|---|---|
| 1 | 192.168.12.128 | .129 | .142 | .143 | /28 |
| 2 | 192.168.12.144 | .145 | .158 | .159 | /28 |
| 3 | 192.168.12.160 | .161 | .174 | .175 | /28 |
| 4 | 192.168.12.176 | .177 | .190 | .191 | /28 |

## Mental Subnetting

**Étape 1 — Quel octet change ?**

| /8 | /16 | /24 | /32 |
|---|---|---|---|
| 1er octet | 2e octet | 3e octet | 4e octet |

Ex : `/25` → seul le 4e octet change.

**Étape 2 — Taille du subnet via Modulo**

`CIDR % 8` = remainder → taille = `2^(8 - remainder)`

| Remainder | Taille subnet |
|---|---|
| 0 | 256 |
| 1 | 128 |
| 2 | 64 |
| 3 | 32 |
| 4 | 16 |
| 5 | 8 |
| 6 | 4 |
| 7 | 2 |

Ex : `/25` → `25 % 8 = 1` → `2^7 = 128` adresses par subnet.

**Étape 3 — Plages**

Avec `/25` et 128 adresses :
- 1er subnet : `192.168.1.0–127` → hosts utilisables : `.1–.126`
- 2e subnet : `192.168.1.128–255` → hosts utilisables : `.129–.254`

> `0` est une adresse réseau valide en networking — ne pas confondre avec "null".
