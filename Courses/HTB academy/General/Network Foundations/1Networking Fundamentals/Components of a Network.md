---
tags:
  - networking
  - osi-model
  - course/htb-academy
---

# Components of a Network
## Vue d’ensemble
Comprendre les **components** d’un **network** est clé pour voir comment les données circulent de bout en bout. Ce module couvre : **End Devices**, **Intermediary Devices** (switches, routers, modems, access points), **Network Media & Software Components**, et les **Servers**.
## Principaux components
- **End Devices** : PCs, smartphones, tablets, IoT / smart devices.
- **Intermediary Devices** : **switches**, **routers**, **modems**, **access points**.
- **Network Media & Software Components** : câbles, **protocols**, outils de **management**, **software firewalls**.
- **Servers** : **web servers**, **file servers**, **mail servers**, **database servers**.
---
## End Devices (hosts)
Rôles : émettre/recevoir la **data** (web, mails, documents, streaming). Connexions **Ethernet** (filaire) ou **Wi‑Fi** (sans fil).
Ex. : un étudiant se connecte au Wi‑Fi de l’école pour accéder aux ressources en ligne.
## Intermediary Devices
Facilitent le flux de **packets** entre **end devices** et entre **networks** ; améliorent performance et sécurité.
- **Routers (L3/OSI)** : routage IP, choix de chemin (protocoles **OSPF**, **BGP**), **ACLs**/firewalling de base.
- **Switches (L2/OSI)** : commutation par **MAC address**, segments **LAN**, réduction de la congestion (VLANs éventuels).
- **Modems** : conversion signaux vers l’infrastructure **ISP** (ADSL/câble/fibre).
- **Access Points (APs)** : accès **Wi‑Fi** pour les clients sans fil.
## Network Interface Cards (NICs)
Carte réseau (filaire/wireless) qui interface l’appareil avec le médium : envoi/réception, **MAC address** unique (L2).
Ex. : desktop en **Ethernet** (NIC filaire) ; laptop en **Wi‑Fi** (NIC sans fil).
## Routers (détaillé)
- Lisent les **IP headers** pour décider du **forwarding** vers d’autres networks.
- Utilisent des **routing tables** et des protocoles (ex. **OSPF**, **BGP**).
- **Traffic management** + fonctions de **security** (ACLs/NAT, parfois firewall).
## Switches (détaillé)
- Connectent des devices dans un **LAN**, commutent les **frames** L2 vers le bon **port** (table MAC).
- Réduisent les collisions et segmentent le trafic ; support de **VLAN** sur modèles managés.
## Hubs (legacy)
Dispositifs L1 obsolètes : **broadcast** de tout le trafic à tous les ports ⇒ collisions, inefficaces. Remplacés par les **switches**.
## Network Media & Software Components
- **Wired media** : **twisted pair** (Ethernet), **coaxial**, **fiber optic** (backbone/high‑speed).
- **Wireless media** : **Wi‑Fi**, cellulaire, micro‑ondes (satellite), infrarouge (courte portée).
- **Software components** : **protocols** (TCP/IP, HTTP, FTP…) et **management software** (monitoring, config, sécurité).
## Cabling & Connectors
- Câbles : Cat5e/Cat6/Cat6a (Ethernet), **fiber** (SM/MM).
- Connecteurs : **RJ‑45** (Ethernet), modules **SFP/SFP+** pour la fiber.
Qualité et type impactent **débit**, **latence**, **fiabilité**.
## Network Protocols
Règles de format/traitement pour l’interopérabilité (fabricants/OS différents). Couvrent : **segmentation**, **addressing**, **routing**, **error checking**, **synchronization**.
- **TCP/IP** : socle d’Internet.
- **HTTP/HTTPS** : trafic Web.
- **FTP** : transferts de fichiers.
- **SMTP** : e‑mail.
- **TCP** : transport fiable (retransmission/ordre).
- **UDP** : transport rapide, sans garantie (streaming/temps réel).
## Network Management Software
Outils de **monitoring**, **configuration management**, **fault analysis**, **security management** (ex. SNMP/NetFlow/syslog, SIEM côté sécurité).
Objectif : performance, disponibilité, sécurité, résolution rapide des incidents.
## Software Firewalls (Host‑based)
Pare‑feu applicatifs sur hôtes individuels : filtrage **inbound/outbound**, règles par **application/service**, protection locale complémentaire au **network firewall**.
## Servers
Machines qui fournissent des **services** aux **clients** (modèle **Client‑Server**).
- **Web servers** : pages/applications web.
- **File servers** : partage/stockage de fichiers.
- **Mail servers** : e‑mails.
- **Database servers** : données structurées.
Gèrent **authentification**, **autorisations**, **centralisation** et **backups**, **security policies**.
---
## TL;DR
- **End Devices** : points d’entrée/sortie de la data.
- **Intermediary Devices** : connectivité, performance, sécurité (L2/L3).
- **Media/Software** : support physique + règles (protocols) + outils de management.
- **Servers** : services et données pour tous les clients du réseau.
