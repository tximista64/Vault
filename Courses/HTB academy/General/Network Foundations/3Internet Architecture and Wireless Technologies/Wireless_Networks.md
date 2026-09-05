---
tags:
  - networking
  - wireless-networks
  - course/htb-academy
---

# Wireless Networks
Un **wireless network** est un système de communication sophistiqué qui utilise les ondes radio (ou autres signaux sans fil) pour connecter divers appareils (ordinateurs, smartphones, objets IoT), leur permettant d’échanger des données sans câbles physiques.
---
## Avantages et Inconvénients
| Avantages               | Description                                                          |
| ----------------------- | -------------------------------------------------------------------- |
| Mobilité                | L’utilisateur peut se déplacer librement dans la zone de couverture. |
| Facilité d’installation | Pas besoin de câblage étendu.                                        |
| Scalabilité             | Ajouter de nouveaux appareils est simple.                            |
| Inconvénients          | Description                                                                                     |
| ---------------------- | ----------------------------------------------------------------------------------------------- |
| Interférences          | Les signaux peuvent être perturbés par les murs, autres appareils ou conditions atmosphériques. |
| Risques de sécurité    | Sans mesures de sécurité, les transmissions peuvent être interceptées.                          |
| Limitations de vitesse | Moins rapides que les connexions câblées équivalentes.                                          |
---
## Wireless Router
Un **router** sans fil combine :
- **Routing** : dirige les paquets de données.
- **Wireless Access Point** : fournit la couverture Wi-Fi.
**Composants principaux** :
- **WAN Port** : connexion à l’ISP.
- **LAN Ports** : connexions câblées locales.
- **Antennae** : émission/réception Wi-Fi.
- **Processeur & Mémoire** : gestion du réseau.
---
## Mobile Hotspot
Un **mobile hotspot** permet à un smartphone de partager sa connexion cellulaire via Wi-Fi.
- Utilise les réseaux 4G/5G.
- Portée limitée (quelques mètres).
- Consomme beaucoup de batterie.
- Protégé par mot de passe.
Exemple : en voyage sans Wi-Fi public, on active le hotspot du téléphone pour connecter un laptop.
---
## Cell Tower
Une **cell tower** est une structure équipée d’antennes pour créer une cellule du réseau mobile.
- Assure la couverture et connecte les téléphones via radiofréquences.
- Supervision par un **Base Station Controller (BSC)**.
- Connexion au **core network** via fibre optique ou liaisons micro-ondes.
Types de cellules :
- **Macro cells** : grandes tours couvrant plusieurs km (zones rurales).
- **Micro/Small cells** : installations compactes pour zones urbaines denses.
Exemple : en voiture, en écoutant de la musique en streaming, le téléphone bascule automatiquement d’une antenne à l’autre.
---
## Fréquences en Communications Sans Fil
| Bande de fréquence   | Caractéristiques                                                            |
| -------------------- | --------------------------------------------------------------------------- |
| **2.4 GHz**          | Bonne pénétration des murs, plus de perturbations (Bluetooth, micro-ondes). |
| **5 GHz**            | Plus rapide, portée plus courte.                                            |
| **Cellular (4G/5G)** | De 700 MHz à 28 GHz+, compromis entre portée et débit.                      |
- Les **basses fréquences** : large portée mais peu de données.
- Les **hautes fréquences** : beaucoup de données mais faible portée.
- Régulation par les gouvernements (FCC, ARCEP…).
---
## Résumé
- À la maison : Wi-Fi en **2.4 GHz** et **5 GHz** via le **router**.
- En extérieur : connexion aux **cell towers** (4G/5G).
- En voyage : activation d’un **mobile hotspot**.
👉 Les trois piliers du sans-fil sont **Wi-Fi**, **réseaux cellulaires** et **hotspots mobiles**.
