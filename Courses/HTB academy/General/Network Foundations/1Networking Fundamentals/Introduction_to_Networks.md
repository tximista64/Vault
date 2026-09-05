---
tags:
  - networking
  - course/htb-academy
---

# Introduction to Networks
## Présentation
Module d'introduction aux bases du **networking** et à son importance. Focus sur deux types principaux :
- **Local Area Network (LAN)**
- **Wide Area Network (WAN)**
Connaître le fonctionnement des communications entre appareils, du niveau local jusqu’à l’échelle mondiale, est essentiel en **cyber security**.
## Qu'est-ce qu'un Network ?
Un **network** est un ensemble de **nodes** (ordinateurs, smartphones, imprimantes, serveurs) interconnectés via des **links** (fils ou sans fil) permettant :
- **Data Sharing** : échange de données
- Communication bidirectionnelle entre nodes
*Exemple :* des amis discutant dans une pièce = chaque personne est un node, la parole est le link, la conversation est la data.
## Importance des Networks
- **Resource Sharing** : partage de matériel/logiciel
- **Communication** : messagerie, email, visioconférence
- **Data Access** : accès fichiers et bases de données
- **Collaboration** : travail en temps réel à distance
## Types de Networks
### Local Area Network (LAN)
- Portée : petite zone (maison, école, bureau)
- Propriété : une seule entité
- Vitesse : élevée
- Support : **Ethernet** (câbles) ou **Wi-Fi**
### Wide Area Network (WAN)
- Portée : villes, pays, continents
- Propriété : partagée (FAI, organisations multiples)
- Vitesse : inférieure à LAN (distance)
- Support : fibre optique, satellite, lignes louées
**Internet** = plus grand WAN.
## Comparatif LAN vs WAN
| Aspect       | LAN                       | WAN                                |
|--------------|---------------------------|------------------------------------|
| Taille       | Zone réduite               | Zone large                         |
| Propriété    | Unique                     | Multiple entités                   |
| Vitesse      | Haute                      | Plus lente                         |
| Maintenance  | Simple, peu coûteuse       | Complexe, coûteuse                 |
| Exemple      | Réseau domestique          | Internet                           |
## Intégration LAN et WAN
- **LAN** peut se connecter à un **WAN** via un **ISP**
- **Modem** : pont entre LAN et WAN, convertit les signaux
- Permet accès aux ressources mondiales
### Exemple domestique :
- Appareils → **Router** → LAN
- Router ↔ ISP (WAN) → Internet
### Exemple entreprise :
- Plusieurs LAN reliés via WAN pour collaboration et partage d’infos entre sites.
![[Pasted image 20250811000517.png]]
