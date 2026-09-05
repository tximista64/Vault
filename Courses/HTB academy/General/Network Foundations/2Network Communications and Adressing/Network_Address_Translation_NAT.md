---
tags:
  - networking
  - nat
  - ip-addressing
  - course/htb-academy
---

# Network Address Translation (NAT)
## Introduction
L’Internet repose sur un système d’adresses numériques, appelées **IP addresses**, pour router les données entre les appareils.
Le schéma initial, **IPv4**, offre environ 4,3 milliards d’adresses IP, un nombre qui est rapidement devenu insuffisant avec la croissance d’Internet.
**Network Address Translation (NAT)** est une solution qui permet à plusieurs appareils d’un réseau privé de partager une seule **public IP address**.
Cela permet non seulement d’économiser le nombre limité d’adresses publiques, mais aussi d’ajouter une couche de sécurité en masquant la structure interne du réseau.
---
## Private vs Public IP Addresses
- **Public IP addresses** : uniques au niveau mondial, attribuées par les **ISPs** (Internet Service Providers).
Exemple : `8.8.8.8` (serveur DNS de Google).
Ces adresses permettent aux appareils d’être accessibles partout sur Internet.
- **Private IP addresses** : réservées à un usage interne (RFC 1918). Non routables sur Internet.
Plages courantes :
- `10.0.0.0 – 10.255.255.255`
- `172.16.0.0 – 172.31.255.255`
- `192.168.0.0 – 192.168.255.255`
Avec le NAT, un réseau interne utilise des **private IPs** tout en partageant une **public IP**, ce qui limite l’exposition directe des appareils internes à Internet.
---
## Qu’est-ce que le NAT ?
Le **NAT** est un processus réalisé par un **router** ou un dispositif similaire qui modifie les adresses IP source ou destination dans les en-têtes des paquets IP.
- Les appareils internes utilisent **private IPs**.
- Le **router NAT** traduit ces adresses privées en une seule **public IP**.
- Une table de traduction garde la correspondance entre connexions internes et externes.
---
## Exemple de fonctionnement
Un réseau domestique contient :
- Laptop : `192.168.1.10`
- Smartphone : `192.168.1.11`
- Console : `192.168.1.12`
Le routeur :
- Interface LAN : `192.168.1.1`
- Interface WAN (ISP) : `203.0.113.50`
Quand le laptop envoie une requête vers **www.google.com** :
1. Le paquet sort avec l’IP source `192.168.1.10`.
2. Le routeur traduit en `203.0.113.50`.
3. Le serveur Google répond à `203.0.113.50`.
4. Le routeur utilise sa **NAT table** pour savoir que cette réponse doit être renvoyée vers `192.168.1.10`.
![[Pasted image 20250831163500.png]]
---
## Types de NAT
| Type | Description |
|------|-------------|
| **Static NAT** | Association 1:1 entre une private IP et une public IP. |
| **Dynamic NAT** | Attribution d’une public IP depuis un pool, selon la demande. |
| **PAT (Port Address Translation)** | Aussi appelé *NAT Overload*. Plusieurs private IPs partagent une seule public IP grâce aux ports. C’est le plus courant dans les réseaux domestiques. |
---
## Avantages et Inconvénients
### ✅ Avantages
- Économise les adresses **IPv4**.
- Ajoute une couche de sécurité (les IP internes ne sont pas exposées).
- Flexible pour l’adressage interne.
### ⚠️ Inconvénients
- La mise en place de services publics (ex : serveur web interne) demande des règles spéciales (**port forwarding**).
- Peut poser problème pour certains protocoles nécessitant une communication de bout en bout.
---
