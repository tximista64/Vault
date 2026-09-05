---
tags:
  - iot-security
  - infosec-fundamentals
  - course/htb-academy
---

# Internet of Things Security (IoT Security)
L’**IoT Security** désigne l’ensemble des mesures visant à protéger les objets connectés et les réseaux sur lesquels ils fonctionnent contre les accès non autorisés, les vols de données et les cyberattaques.
---
## Analogie : maison connectée
Ta maison est équipée de :
- Thermostat intelligent
- Réfrigérateur qui t’avertit des courses
- Serrure connectée…
🔐 Ces objets communiquent entre eux, mais aussi avec Internet. Sans sécurité, ils deviennent des **portes numériques ouvertes** aux intrus.
---
## Objectif
- Sécuriser les **appareils**
- Protéger les **données échangées**
- Garantir l’**intégrité fonctionnelle** du système
- Éviter les compromissions de réseau via un seul appareil vulnérable
---
## Défis de la sécurité IoT
- Faibles capacités de calcul → sécurité difficile à implémenter
- Grande diversité d’environnements (domestiques, industriels)
- Nombre massif d’appareils = **surface d’attaque énorme**
- Mises à jour souvent absentes ou difficiles
---
## Exemple concret
Un thermostat piraté → accès au **réseau domestique complet**
Dans l’industrie : compromission d’un capteur → arrêt de chaîne → pertes financières → risques humains
---
## Acteurs & responsabilités
| Acteur                  | Rôle |
|--------------------------|------|
| **Device Manufacturers** | Conception sécurisée, MAJ régulières |
| **Network Admins**       | Segmentation réseau, IDS, surveillance |
| **App Developers**       | Authentification, chiffrement, gestion des permissions |
| **CISO / IoT Sec Manager** | Stratégie, politique de sécurité globale |
---
## Techniques de défense
- **Secure by Design** : sécurité dès la conception
- **Firmware updates** régulières
- **Segmentation réseau** pour limiter la propagation
- **Authentification forte** pour accéder aux interfaces
- **Chiffrement** des communications
- **Surveillance continue** : détection des comportements anormaux
---
## Étude de cas : chaîne de magasins
- HVAC connectés non sécurisés
- → Accès réseau central via ces équipements
- → Vol massif de données CB client
---
## Conclusion
L’IoT étend les possibilités mais aussi les **vulnérabilités** :
- Chaque appareil est une **porte potentielle** d’entrée pour les attaquants
- La sécurité doit être **globale**, **intégrée**, **évolutive**
L’**IoT Security** est devenue **indispensable** à toute stratégie InfoSec moderne, aussi bien en environnement personnel qu’industriel.
