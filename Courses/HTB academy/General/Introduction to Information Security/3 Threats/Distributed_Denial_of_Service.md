---
tags:
  - ddos
  - infosec-fundamentals
  - course/htb-academy
---

# Distributed Denial of Service
Un **DDoS (Distributed Denial of Service)** est une attaque qui vise à rendre un service en ligne indisponible en le **saturant de trafic** provenant de multiples sources.
---
## Définition
Contrairement à une attaque **DoS** classique (qui vient d’une seule machine), un **DDoS** utilise un **botnet** — un réseau de machines compromises — pour envoyer un flux massif de requêtes vers une cible (site web, serveur, application, DNS…).
---
## Analogie
Une foule énorme remplit ta boulangerie sans acheter → tes vrais clients ne peuvent plus entrer.
Les machines zombies du botnet agissent pareil : elles **occupent toutes les ressources**, empêchant les vrais utilisateurs d'accéder au service.
---
## Fonctionnement
- **Attacker** : donne les ordres
- **Botnet** : exécute l’attaque depuis des milliers d'appareils (PC, routeurs, IoT)
- **Victim** : la cible (serveur, service, site)
Résultat : surcharge → lenteur → plantage → indisponibilité.
---
## Impacts
- **Downtime** (interruption de service)
- **Perte de revenus** (surtout en e-commerce, streaming, banque)
- **Atteinte à la réputation**
- **Insatisfaction client**
- **Diversion** : souvent utilisée comme écran de fumée pour une attaque secondaire
---
## Cas célèbre : attaque contre Dyn (2016)
- Le DNS provider **Dyn** est ciblé
- Botnet utilisé : **Mirai**
- Des milliers de caméras et routeurs IoT compromis
- Résultat : Twitter, Netflix, Reddit, etc. inaccessibles pendant des heures aux US & en Europe
---
## Défenses possibles
- **Rate limiting** et filtrage IP
- **Scrubbing centers** (nettoyage du trafic en amont)
- **CDN** pour distribuer la charge
- **DDoS protection providers** (Cloudflare, Akamai…)
- **Surveillance proactive** (alertes, bascules automatiques)
---
## Conclusion
Une attaque DDoS :
- Ne vise pas à voler des données
- Mais à **perturber l’activité**
- Peut causer des **dégâts massifs**, même avec peu de sophistication technique
Elle doit être intégrée dans toute **stratégie de défense InfoSec globale**.
