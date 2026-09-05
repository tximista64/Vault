---
tags:
  - networking
  - authentication-protocols
  - kerberos
  - cryptography
  - course/htb-academy
---

# Authentication Protocols

## Tableau des protocoles

| Protocole | Description |
|---|---|
| **Kerberos** | Authentification par tickets via un KDC (Key Distribution Center) — environnements Active Directory |
| **SRP** | Auth par mot de passe avec cryptographie — résistant aux MITM et écoutes |
| **SSL** | Protocole cryptographique pour communications sécurisées — remplacé par TLS |
| **TLS** | Successeur de SSL — chiffrement des communications sur Internet |
| **OAuth** | Autorisation tierce sans partage de mot de passe |
| **OpenID** | Auth décentralisée — une identité pour plusieurs sites (SSO) |
| **SAML** | Échange XML d'assertions d'auth entre parties — fédération d'identité |
| **PKI** | Infrastructure à clé publique/privée — chiffrement et signatures numériques |
| **SSO** | Un seul jeu de credentials pour plusieurs applications |
| **MFA / 2FA** | Auth multi-facteurs : quelque chose qu'on sait + a + est |
| **FIDO** | Standards ouverts pour auth forte (consortium) |
| **PAP** | Envoie le mot de passe en **clair** — très peu sécurisé |
| **CHAP** | Three-way handshake — n'envoie jamais le mot de passe en clair |
| **EAP** | Framework supportant plusieurs méthodes d'auth (extensible) |
| **SSH** | Accès distant chiffré, exécution de commandes, transfert de fichiers |
| **HTTPS** | HTTP + SSL/TLS — chiffrement et auth du serveur via certificat |
| **LEAP** | Auth sans fil Cisco — EAP + RC4 — **vulnérable** (dictionary attacks), obsolète |
| **PEAP** | Tunnel TLS pour auth sans fil/filaire — remplace LEAP |

---

## Comparaison LEAP vs PEAP

| | LEAP | PEAP |
|---|---|---|
| Chiffrement | **RC4** (faible) | **AES / 3DES** |
| Authentification serveur | Shared secret | **Certificat côté serveur** |
| MSCHAPv2 hash | Non chiffré | **Chiffré** |
| Vulnérabilités | Dictionary attacks | Moindres — mais remplacé par EAP-TLS |

Les deux sont considérés **obsolètes** — remplacés par **EAP-TLS**.

---

## SSH et HTTPS

Protocoles recommandés pour les connexions physiques sécurisées :
- Chiffrement robuste des données d'auth en transit.
- Support des **certificats numériques** et **PKI** pour authentifier le serveur → protection anti-MITM.
- Largement supportés sur tous les OS et équipements.
