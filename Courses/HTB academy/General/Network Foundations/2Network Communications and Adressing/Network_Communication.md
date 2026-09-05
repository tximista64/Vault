---
tags:
  - networking
  - ip-addressing
  - tcp-ip
  - course/htb-academy
---

# Network Communication
> Pilier de la communication réseau : **MAC addresses** (L2), **IP addresses** (L3), **ports** (L4). Ensemble, ils permettent d’acheminer la **data** entre hôtes en local (LAN) et à l’échelle d’Internet.
---
## MAC Addresses
### Définition
- **MAC address** : identifiant **48 bits** (hex) gravé sur la **NIC** (ex. `00:1A:2B:3C:4D:5E`), utilisée au **Data Link Layer (OSI L2)** pour l’acheminement local.
- Structure : **OUI** (24 bits, constructeur) + **identifiant de l’interface** (24 bits) ⇒ unicité mondiale.
[[getmac-2.gif]]  commande getmac sous windows
### Usage en communication
- Les **switches** apprennent les MAC par **port** et transmettent les **frames** vers le bon récepteur.
- **ARP** (Address Resolution Protocol) fait le lien IP ↔ MAC à l’intérieur d’un même réseau.
**Exemple (LAN)** :
A (IP `192.168.1.2`, MAC `00:1A:2B:3C:4D:5E`) veut parler à B (IP `192.168.1.5`, MAC `00:1A:2B:3C:4D:5F`).
A fait un **ARP** pour trouver la MAC de `192.168.1.5`, puis envoie la **frame** à `00:1A:2B:3C:4D:5F`. Le **switch** achemine vers le **port** de B.
![[Pasted image 20250831153954.png]]
---
## IP Addresses
### Définition
- **IP address** (OSI **L3**) : adressage logique pour le **routing** inter‑réseaux.
- **IPv4** : 32 bits (ex. `192.168.1.1`).
- **IPv6** : 128 bits (ex. `2001:db8:85a3:0000:0000:8a2e:0370:7334`).
### Usage en communication
- Les **routers** choisissent le **chemin** optimal vers la destination (forwarding par **IP**).
- IP est **dynamique** (peut changer selon la topologie/politiques), contrairement à la MAC qui est liée au matériel.
---
## Ports
### Rôle
- Les **ports** (OSI **L4**, **TCP/UDP**) multiplexent les services sur une même IP et dirigent le trafic vers la bonne **application** (client ↔ serveur).
**Exemples** :
- **HTTP** → port **80** (TCP) ; **HTTPS** → **443** (TCP).
- Un navigateur client ouvre un **ephemeral port** local et contacte `server_ip:443` pour HTTPS.
### Plages de ports
- **Well‑Known (0–1023)** : services standard **IANA** (ex. HTTP 80, HTTPS 443, FTP 20/21, SSH 22).
- **Registered (1024–49151)** : attribués à des applications (ex. MS SQL Server **1433**).
- **Dynamic/Private (49152–65535)** : **ephemeral ports** choisis par l’OS côté client (sessions temporaires).
[[tcp-ports.gif]] montre netstat sous windows
---
`Well-known ports`, numbered from 0 to 1023, are reserved for common and universally recognized services and protocols
`Registered ports`, which range from 1024 to 49151, are not as strictly regulated as `well-known ports` but are still registered and assigned to specific services by the Internet Assigned Numbers Authority (IANA)
## Parcours d’une requête Web (exemple)
1) **DNS Lookup**
Le client résout `example.com` → **IP** (ex. `93.184.216.34`).
2) **Data Encapsulation**
- L’app génère la requête **HTTP**.
- **TCP** encapsule (port **80** ou **443**).
- **IP** ajoute l’IP dest `93.184.216.34`.
- **ARP** trouve la **MAC** de la **default gateway** (router) sur le LAN.
3) **Data Transmission**
- La **frame** est envoyée à la **MAC** du router.
- Le **router** achemine le **packet IP** vers la destination.
- Les **routers intermédiaires** poursuivent le forwarding par IP.
4) **Server Processing**
- Le **server** reçoit le packet, le remet au service écoutant sur **port 80/443**.
- Il traite la requête **HTTP** et prépare la réponse.
5) **Response Transmission**
- Le server renvoie la réponse vers l’**ephemeral port** du client.
- Le chemin inverse est suivi (IP/routeurs), puis **L2** dans le LAN du client.
---
## À retenir (cheat‑sheet)
- **L2 (MAC)** : livraison locale par **switch** (frames, ARP).
- **L3 (IP)** : acheminement inter‑réseaux par **router** (packets).
- **L4 (Ports)** : **TCP/UDP** dirigent le flux vers les bons **services**/**apps**.
> **Stack gagnante** : *MAC pour qui sur le lien local ? IP pour où dans le monde ? Port pour quel service ?*
