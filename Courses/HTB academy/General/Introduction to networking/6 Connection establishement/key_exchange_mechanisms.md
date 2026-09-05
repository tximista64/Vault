---
tags:
  - networking
  - cryptography
  - key-exchange
  - diffie-hellman
  - course/htb-academy
---

# Key Exchange Mechanisms

Les échanges de clés permettent à deux parties de s'accorder sur une **shared secret key** via un canal non sécurisé, sans se l'être transmise directement.

## Algorithmes principaux

| Algorithme | Acronyme | Points clés |
|---|---|---|
| Diffie-Hellman | DH | Base de nombreux protocoles sécurisés (TLS…) — vulnérable aux MITM sans authentification ; plus lent qu'ECDH |
| Rivest–Shamir–Adleman | RSA | Basé sur la difficulté de factoriser de grands nombres premiers — chiffrement, signatures, authentification |
| Elliptic Curve Diffie-Hellman | ECDH | Variante DH sur courbe elliptique — plus rapide et plus sécurisé à niveau de sécurité équivalent ; supporte la **forward secrecy** |
| Elliptic Curve Digital Signature Algorithm | ECDSA | Signatures numériques sur courbe elliptique — efficacité améliorée vs RSA |

### Usages RSA
- Chiffrement et signature de messages
- SSL/TLS (protection du trafic réseau)
- Signatures numériques (intégrité/authenticité)
- Authentification Kerberos (PKINIT)

### Avantages ECDH
- Canaux sécurisés (TLS)
- **Forward secrecy** : les communications passées restent confidentielles même si les clés privées sont compromises
- Authentification dans IKE (VPN)

---

## IKE (Internet Key Exchange)

Protocole d'établissement de sessions sécurisées — composant clé des VPNs. Combine **Diffie-Hellman**, **RSA** et **AES**.

### Deux modes

| Mode | Phases | Sécurité | Performance |
|---|---|---|---|
| **Main mode** | 3 | Plus sécurisé — protection de l'identité | Plus lent |
| **Aggressive mode** | 2 | Moins sécurisé — pas de protection de l'identité | Plus rapide |

### Pre-Shared Key (PSK)
Clé secrète partagée hors-bande avant la session IKE — ajoute une couche d'authentification mutuelle.
- **Risque** : si la PSK est compromise (MITM lors de l'échange), toute la session IKE est compromise.
