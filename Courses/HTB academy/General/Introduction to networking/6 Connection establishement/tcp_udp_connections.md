---
tags:
  - networking
  - tcp-ip
  - ip-addressing
  - course/htb-academy
---

# TCP/UDP Connections

## TCP vs UDP — rappel

| | TCP | UDP |
|---|---|---|
| Type | Connection-oriented | Connectionless |
| Fiabilité | Élevée (retransmission si erreur) | Aucune garantie |
| Vitesse | Plus lent | Plus rapide |
| Usage | Web, email, données critiques | Streaming, gaming, VoIP |

---

## IP Packet

Structure : **header** + **payload** (données réelles).

### Champs clés du header IP

| Champ | Rôle |
|---|---|
| **Version** | IPv4 ou IPv6 |
| **TTL** | Durée de vie — décrémenté à chaque routeur |
| **Protocol** | TCP (6), UDP (17), ICMP… |
| **Source / Destination** | Adresses IP émetteur et récepteur |
| **ID (Identification)** | Identifie les fragments — 16 bits (0–65535) |
| **Flags / Fragment Offset** | Gestion de la fragmentation |
| **Checksum** | Détection d'erreurs dans le header |
| **Options / Padding** | Infos de routage optionnelles |

### IP ID — fingerprinting multi-IP
Les paquets d'un même hôte ont des IP ID consécutifs même s'ils proviennent d'IPs différentes → permet d'identifier qu'une seule machine se cache derrière plusieurs adresses.

```
IP 10.129.1.100 > 10.129.1.1  id 1337
IP 10.129.1.100 > 10.129.1.1  id 1338
IP 10.129.2.200 > 10.129.1.1  id 1339  ← même hôte
```

### IP Record-Route Field
Enregistre les adresses IP de tous les routeurs traversés :

```bash
ping -c 1 -R 10.129.143.158
```

### Traceroute
Trace le chemin vers une destination en exploitant le TTL :
1. Envoi d'un TCP SYN avec TTL=1 → le premier routeur renvoie un **ICMP Time-Exceeded**.
2. TTL incrémenté à chaque itération jusqu'à atteindre la cible.
3. La cible répond avec **TCP SYN/ACK** ou **TCP RST** → route complète tracée.

Sur Unix, `traceroute` utilise **UDP** → la cible répond avec **Destination/Port Unreachable**.

---

## TCP Segment — champs clés

| Champ | Rôle |
|---|---|
| Source / Destination Port | Ports émetteur et récepteur |
| Sequence Number | Ordre des données |
| Acknowledgment Number | Confirmation de réception |
| Control Flags | SYN, ACK, FIN, RST… |
| Window Size | Quantité de données acceptables par le récepteur |
| Checksum | Détection d'erreurs |
| Urgent Pointer | Signale des données urgentes dans le payload |

---

## Blind Spoofing

Manipulation du header IP pour falsifier les adresses source/destination **sans voir les réponses** de la cible.

Vecteurs :
- Faux **ISN** (Initial Sequence Number) dans le header TCP → forcer l'établissement d'une connexion.
- Perturbation ou interruption de connexions réseau.
- Interception / surveillance du trafic.
