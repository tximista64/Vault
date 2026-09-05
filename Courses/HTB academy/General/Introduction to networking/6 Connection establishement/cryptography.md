---
tags:
  - networking
  - cryptography
  - aes
  - des
  - course/htb-academy
---

# Cryptography

## Symmetric vs Asymmetric Encryption

| | Symmetric | Asymmetric |
|---|---|---|
| Clés | **Une seule** (partagée) | **Paire** : clé publique + clé privée |
| Chiffrement | Clé secrète | Clé publique |
| Déchiffrement | Même clé secrète | Clé privée uniquement |
| Vitesse | Plus rapide | Plus lente |
| Risque principal | Distribution de la clé secrète | Aucune — la clé publique est partageable librement |
| Exemples | AES, DES, 3DES | RSA, ECC, PGP |
| Usage | Chiffrement de gros volumes | SSL/TLS, SSH, VPN, e-signatures, PKI |

---

## Algorithmes symétriques

### DES (obsolète)
- Clé de **64 bits** (56 bits effectifs + 8 bits checksum).
- Blocs de **64 bits**.
- **3DES** : triple passe DES (encrypt → decrypt → encrypt) avec 3 clés — plus sécurisé mais lent.

### AES (standard actuel)
- Clés de **128, 192 ou 256 bits**.
- Plus rapide que DES (traitement multi-blocs en parallèle).
- Utilisé dans : WLAN 802.11i, IPsec, SSH, VoIP, PGP, OpenSSL…

---

## Cipher Modes (modes de chiffrement par blocs)

| Mode | Usage | Notes |
|---|---|---|
| **ECB** | — | ⚠️ Déconseillé — ne masque pas les patterns, vulnérable à l'analyse statistique |
| **CBC** | Chiffrement de disque, email (TLS, SSL, VeraCrypt) | Mode par défaut d'AES |
| **CFB** | Chiffrement de flux temps réel (réseau, fichiers en transit) | PKCS, BitLocker |
| **OFB** | Chiffrement de flux temps réel | SSH, PKCS — meilleure génération du keystream que CFB |
| **CTR** | Flux temps réel, disque, réseau | IPsec, BitLocker |
| **GCM** | Confidentialité **+** intégrité simultanées | VPN, Wi-Fi, protocoles sécurisés — recommandé |
