---
tags:
  - networking
  - wireless-networks
  - wifi
  - wpa
  - wep
  - course/htb-academy
---

# Wireless Networks

Réseaux utilisant la **radiofréquence (RF)** pour transmettre des données sans câbles. Bandes : **2.4 GHz** ou **5 GHz** pour le WiFi. Standard : **IEEE 802.11**.

## Connexion WiFi — Association Request

Quand un appareil veut rejoindre un réseau, il envoie une **association request** au **WAP** (Wireless Access Point) contenant :

| Champ | Description |
|---|---|
| MAC address | Identifiant unique de l'adaptateur |
| SSID | Nom du réseau |
| Supported data rates | Débits supportés |
| Supported channels | Canaux disponibles |
| Supported security protocols | WPA2/WPA3… |

> Le **SSID** peut être masqué (pas de beacon frames) mais reste visible dans les paquets d'authentification.

---

## Protocoles de chiffrement

### WEP (obsolète)
- Clé de **40-bit** (WEP-64) ou **104-bit** (WEP-104) — algorithme **RC4**.
- **IV (Initialization Vector) de 24 bits seulement** → bruteforceable.
- CRC calculé sur le **plaintext** → permet de déchiffrer un paquet sans connaître la clé.
- Shared key pour chiffrement ET authentification → compromission totale si la clé fuite.

| Protocole | IV | Secret Key |
|---|---|---|
| WEP-40/64 | 24-bit | 40-bit |
| WEP-104 | 24-bit | 80-bit |

### WPA / WPA2 / WPA3
- Chiffrement **AES 128-bit** — résistant aux attaques connues sur WEP.
- Authentification via **PSK** (Personal) ou **serveur 802.1X** (Enterprise).
- **WPA-Personal** : réseaux domestiques/PME.
- **WPA-Enterprise** : serveur centralisé RADIUS ou TACACS+.

---

## Protocoles d'authentification

| Protocole | Mécanisme | Niveau de sécurité |
|---|---|---|
| **LEAP** | Shared key (Cisco propriétaire) | Faible — vulnérable si clé compromise |
| **PEAP** | Tunnel **TLS** + certificat numérique | Élevé |
| **EAP-TLS** | Certificats numériques + **PKI** | Très élevé |

**TACACS+** : chiffre l'intégralité du paquet d'authentification (via SSL/TLS ou IPSec) — utilisé pour authentifier les accès aux équipements réseau.

---

## Attack Vectors

### Attaque de désassociation
Envoi de **trames de désassociation** forgées pour déconnecter les clients du WAP.
- Peut se lancer depuis l'intérieur ou l'extérieur du réseau.
- Utilisé comme précurseur à une attaque **MITM** (force les clients à se reconnecter).

### WEP
- **Brute force de l'IV** (24 bits seulement).
- **CRC flaw** : déchiffrement d'un paquet sans connaître la clé.

---

## Hardening

| Mesure | Description |
|---|---|
| **Désactivation du SSID broadcast** | Le réseau n'apparaît plus dans les scans — beacon frames désactivées |
| **WPA2/WPA3** | Chiffrement et authentification robustes |
| **MAC filtering** | Whitelist d'adresses MAC autorisées |
| **EAP-TLS** | Auth par certificats numériques + PKI — protection maximale |
