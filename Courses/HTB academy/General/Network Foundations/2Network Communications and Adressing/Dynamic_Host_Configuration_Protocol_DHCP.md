---
tags:
  - networking
  - dhcp
  - course/htb-academy
---

# Dynamic Host Configuration Protocol (DHCP)
## Introduction
**DHCP** automatise la configuration IP des **devices** d’un **network** : attribution d’**IP address**, **subnet mask**, **default gateway**, **DNS servers**, etc. Objectifs : éviter la config manuelle, réduire les erreurs, prévenir les conflits d’IP et **recycler** les adresses libres (**lease**).
---
## Rôles
- **DHCP Server** : maintient un **pool** d’IP + paramètres, attribue des **leases**.
- **DHCP Client** : tout device qui demande une config réseau automatiquement.
**Paramètres typiques (options DHCP)** : IP, subnet mask, default gateway, DNS servers, domain/search suffix, NTP, etc.
---
## DORA (Discover → Offer → Request → Acknowledge)
1. **Discover** : le client **broadcast** un *DHCP Discover* pour trouver les serveurs.
2. **Offer** : le(s) serveur(s) répond(ent) avec un *DHCP Offer* (proposition d’IP + options + **lease time**).
3. **Request** : le client envoie un *DHCP Request* pour accepter l’offre choisie.
4. **Acknowledge** : le serveur valide via *DHCP ACK* → le client configure son interface.
```text
Client --Discover-->  (broadcast)
Server <--Offer-----  (unicast/broadcast)
Client --Request-->   (broadcast)
Server <--ACK-------  (unicast/broadcast)  → IP configurée
```
[[DORA-3.gif]]  Processus du Dora sous linux avec capture wireshark
---
## Lease & Renewal
- L’IP est délivrée pour une durée : **lease time** (ex. 24h).
- Avant expiration, le client tente un **renewal** (nouveau *DHCP Request*).
Le serveur peut **ACK** (prolonge) ou refuser (le client renégocie).
> En pratique, les stacks implémentent des timers (ex. T1/T2) pour renouveler proactivement.
---
## Scénario (exemple)
**Alice** branche son laptop au réseau du bureau :
- Laptop → *Discover* ; **DHCP Server** → *Offer* (ex. `192.168.1.10`).
- Laptop → *Request* (accepte `192.168.1.10`) ; Server → *ACK*.
- Le laptop est configuré (IP `192.168.1.10`, mask, gateway, DNS).
- À l’approche de l’expiration, le laptop envoie un *Request* pour **renew** la **lease** ; le serveur **ACK** et prolonge.
![[Pasted image 20250831160349.png]]
---
## À retenir (cheat‑sheet)
- **Pourquoi DHCP ?** Automatisation, cohérence, pas de conflits, réutilisation d’IP.
- **DORA** : Discover → Offer → Request → ACK.
- **Lease** : durée limitée + **renewal** avant expiration.
- **Server vs Client** : le serveur gère le pool + options ; le client applique la config.
- **Options clés** : IP, subnet mask, default gateway, DNS servers (au minimum).
- **Port UDP 67** → côté **serveur** (réception des requêtes)
- **Port UDP 68** → côté **client** (réception des réponses)
👉 Les messages **Discover / Request** partent du client en UDP/68 vers le serveur en UDP/67.
👉 Les messages **Offer / Acknowledge** reviennent du serveur en UDP/67 vers le client en UDP/68.
C’est justement parce que le client n’a pas encore d’IP au moment du _Discover_ que DHCP utilise du **broadcast (255.255.255.255)** pour atteindre le serveur dans le LAN.
