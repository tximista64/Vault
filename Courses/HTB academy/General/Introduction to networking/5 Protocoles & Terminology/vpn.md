---
tags:
  - networking
  - vpn
  - ipsec
  - course/htb-academy
---

# Virtual Private Networks (VPN)

Tunnel chiffré entre un réseau privé et un appareil distant — permet l'accès sécurisé aux ressources internes via Internet.

**Ports courants :**
- `TCP/1723` → PPTP
- `UDP/500` → IKEv1/IKEv2

## Composants requis

| Composant | Rôle |
|---|---|
| **VPN Client** | Établit et maintient la connexion (ex: OpenVPN client) |
| **VPN Server** | Accepte les connexions, route le trafic vers le réseau privé |
| **Encryption** | AES, IPsec… — chiffre les données en transit |
| **Authentication** | Shared secret, certificat… — vérifie l'identité des deux parties |

---

## IPsec

Protocole de sécurité réseau combinant **chiffrement** et **authentification** au niveau IP.

### Deux protocoles internes

| Protocole | Rôle |
|---|---|
| **AH** (Authentication Header) | Intégrité + authenticité — **pas de chiffrement** |
| **ESP** (Encapsulating Security Payload) | Chiffrement + authentification optionnelle |

### Deux modes

| Mode | Description |
|---|---|
| **Transport Mode** | Chiffre uniquement le payload — communication host-to-host |
| **Tunnel Mode** | Chiffre l'IP packet complet (header inclus) — VPN réseau-à-réseau |

### Ports à ouvrir sur le firewall

| Protocole | Port | Rôle |
|---|---|---|
| ESP | IP proto 50 (ou UDP/4500 via NAT-T) | Chiffrement du trafic VPN |
| AH | IP proto 51 | Authentification |
| IKE | UDP/500 | Négociation des clés (Diffie-Hellman) |

---

## PPTP (obsolète)

Extension du protocole PPP — supporté nativement par la plupart des OS mais **vulnérable**.

- Authentification via **MSCHAPv2** + chiffrement **DES** → crackable avec du hardware spécialisé.
- En déclin depuis **2012**, remplacé par **L2TP/IPsec**, **IPsec/IKEv2**, **OpenVPN**.
