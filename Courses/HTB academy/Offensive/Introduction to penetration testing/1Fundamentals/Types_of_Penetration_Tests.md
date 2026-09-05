---
tags:
  - penetration-testing
  - methodology
  - red-team
  - course/htb-academy
---

# Types of Penetration Tests
Les tests de pénétration (ou *pentests*) peuvent être classés selon différentes approches, chacune offrant une perspective particulière sur la sécurité d'une organisation. Le type de test choisi dépend du niveau d'information fourni au testeur et de la perspective adoptée. Voici les principales catégories.
## Classification selon le niveau d'information
### Black Box Testing
Le testeur n’a aucune information préalable sur le système ciblé, ce qui simule un attaquant externe. Cela permet d’identifier les vulnérabilités visibles publiquement (ex : vulnérabilités web, configuration SSL, injections SQL, etc.).
**Exemple** : Un testeur découvre une faille d'injection SQL sur une page de connexion publique d'une banque, ainsi qu’un certificat SSL expiré.
### White Box Testing
Le testeur a un accès complet : code source, schémas réseau, configurations internes. Cela permet une analyse approfondie, notamment des politiques internes de sécurité.
**Exemple** : Le testeur identifie une mauvaise configuration du pare-feu, des mots de passe faibles et des logiciels obsolètes sur les serveurs internes.
### Gray Box Testing
Le testeur a un accès partiel ou limité. Ce test simule un attaquant ayant compromis des identifiants internes ou un employé malveillant.
**Exemple** : En accédant à un réseau Wi-Fi mal sécurisé dans une succursale, le testeur compromet le réseau interne.
## Perspective du test
### External Testing
Cible les services accessibles depuis Internet : serveurs web, messagerie, DNS, etc. Il simule un attaquant distant sans accès préalable.
### Internal Testing
Réalisé depuis l’intérieur du réseau (simulateur d’attaque interne ou après compromission). Il évalue les dégâts potentiels si un attaquant est déjà à l’intérieur du périmètre.
## Tests humains et physiques
Des tests d’ingénierie sociale sont souvent inclus pour évaluer la vulnérabilité humaine : tentatives de hameçonnage, tailgating (suivre un employé pour entrer), etc.
**Exemple** : Un testeur entre dans une zone sécurisée en suivant un employé, trouve des mots de passe sur des tableaux blancs et des documents sensibles non rangés.
## Conclusion
Les différents types de *penetration tests* permettent de reproduire des scénarios variés : attaque externe sans information, menace interne avec accès partiel ou total, attaque via ingénierie sociale ou faille humaine. Cette diversité permet d’obtenir une vision complète des faiblesses d’une organisation.
