---
tags:
  - networking
  - tcp-ip
  - icmp
  - voip
  - course/htb-academy
---

# Common Protocols

## TCP vs UDP

| | **TCP** | **UDP** |
|---|---|---|
| Type | Connection-oriented | Connectionless |
| Établissement | Three-Way Handshake | Aucun |
| Fiabilité | Élevée (accusés de réception) | Faible (pas de garantie) |
| Vitesse | Plus lent | Plus rapide |
| Usage | HTTP, SSH, FTP… | DNS, streaming, VoIP… |

---

## Protocoles TCP courants (ports clés)

| Protocole | Port | Usage |
|---|---|---|
| FTP | 20-21 | Transfert de fichiers |
| SSH / SCP | 22 | Accès distant sécurisé / copie sécurisée |
| Telnet | 23 | Accès distant (non chiffré) |
| SMTP | 25 | Envoi d'emails |
| DNS | 53 | Résolution de noms |
| HTTP | 80 | Web |
| HTTPS / SSL | 443 | Web sécurisé |
| Kerberos | 88 | Authentification |
| LDAP | 389 | Services d'annuaire |
| SMB | 445 | Partage de fichiers Windows |
| IMAP | 143 | Accès emails |
| POP3 | 110 | Récupération emails |
| RDP | 3389 | Bureau à distance Windows |
| RPC | 135, 137-139 | Appels de procédures distantes |
| NFS | 111, 2049 | Montage de systèmes distants |
| SNMP | 161-162 | Gestion d'équipements réseau |
| NTP | 123 | Synchronisation d'horloge |
| DHCP / BOOTP | 67-68 | Attribution d'adresses IP |
| SIP (VoIP) | 5060 | Sessions voix/vidéo |
| RADIUS | 1812-1813 | Auth/autorisation |
| OSPF | 89 | Routage |
| PPTP | 1723 | VPN |
| MS SQL | 1433 | Base de données Microsoft |
| Oracle TNS | 1521/1526 | Base de données Oracle |
| REXEC | 512 | Exécution de commandes distantes |
| RLOGIN | 513 | Shell interactif distant |
| X11 | 6000 | Interface graphique réseau |

## Protocoles UDP courants (ports clés)

| Protocole | Port | Usage |
|---|---|---|
| DNS | 53 | Résolution de noms |
| DHCP | 67 | Attribution d'adresses IP |
| TFTP | 69 | Transfert de fichiers léger |
| SNMP | 161 | Gestion réseau |
| NTP | 123 | Synchronisation d'horloge |
| RIP | 520 | Routage |
| IKE / IPsec | 500 | VPN |
| Syslog | 514 | Collecte de logs |
| NetBIOS | 137 | Résolution de noms Windows |
| VNC | 5900 | Bureau à distance graphique |
| UPnP | 1900 | Découverte d'appareils |
| IRC | 194 | Chat temps réel |
| MySQL | 3306 | Base de données |
| PostgreSQL | 5432 | Base de données |

---

## ICMP

Protocole de contrôle et diagnostic réseau — pas de port fixe (0-255).

**Requêtes courantes :**
- **Echo Request / Reply** : `ping` — teste la connectivité.
- **Timestamp Request** : heure sur un hôte distant.
- **Address Mask Request** : subnet mask d'un hôte.

**Messages d'erreur courants :**
- **Destination Unreachable** : paquet non livrable.
- **Time Exceeded** : TTL expiré.
- **Redirect** : changer de routeur.
- **Source Quench** : ralentir l'émission.

### TTL (Time-To-Live)
Décrémenté de 1 à chaque routeur — évite les boucles infinies. Permet d'**estimer la distance** et de **deviner l'OS** :

| OS | TTL par défaut |
|---|---|
| Windows | 128 |
| Linux / macOS | 64 |
| Solaris | 255 |

> Ex : TTL reçu = 122 → Windows (128) à ~6 hops.

---

## VoIP

Transmission voix/multimédia sur IP (Skype, Zoom, WhatsApp…).

- Protocole principal : **SIP** (ports TCP **5060/5061**)
- Alternative : **H.323** (port TCP 1720)

**Méthodes SIP clés :**

| Méthode | Rôle |
|---|---|
| INVITE | Initie une session |
| ACK | Confirme réception de l'INVITE |
| BYE | Termine la session |
| CANCEL | Annule un INVITE en attente |
| REGISTER | Enregistre un user agent SIP |
| OPTIONS | Interroge les capacités d'un serveur SIP |

**⚠️ Information Disclosure** : la méthode `OPTIONS` peut être utilisée pour **énumérer les utilisateurs SIP** existants — vecteur d'attaque potentiel (brute-force, reconnaissance).

Fichier `SEPxxxx.cnf` : config Cisco Unified IP Phone (modèle, firmware, réseau) — identifiable lors d'une analyse réseau.
