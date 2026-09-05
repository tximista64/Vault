---
tags:
  - penetration-testing
  - methodology
  - course/htb-academy
---

# Areas and Domains of Testing
Les tests d’intrusion peuvent également être classés selon le **domaine technique ciblé**. Cela permet une évaluation plus fine et spécialisée, adaptée à l’écosystème technologique concerné. Ces domaines peuvent inclure (sans s’y limiter) :
- Network Infrastructure
- Web Applications
- Mobile Applications
- Cloud Infrastructure
- Physical Security
- Wireless Security
- Software Security
## Network Infrastructure Testing
On évalue la configuration des équipements réseau (routeurs, firewalls, switches, etc.) pour détecter des failles comme des **misconfigurations**, des **firmwares obsolètes** ou des **mots de passe faibles**. On utilise souvent du **port scanning**, **service enumeration**, et l’analyse des **protocoles réseau**.
## Web Application Security Testing
On teste les sites et services web à la recherche de failles telles que **SQL injection**, **XSS**, **broken authentication**, etc. Cela inclut les **API** et la manière dont les données sont traitées côté client et serveur.
## Mobile Application Security Testing
On cible les applications mobiles Android/iOS. Objectifs : mauvaise gestion du **stockage local**, erreurs dans les communications (absence de **chiffrement**), mauvaise gestion des **certificats**, etc.
## Cloud Infrastructure Security Testing
On vérifie la sécurité des environnements **cloud** (AWS, Azure, GCP). Cela inclut les erreurs dans les **IAM**, les **security groups**, les permissions de stockage ou la configuration des **VM** et **containers**.
## Physical Security & Social Engineering
On teste la résilience humaine : **phishing**, **tailgating**, failles physiques dans les bâtiments (absence de badge, caméras inopérantes). Cela révèle le niveau de sensibilisation des employés à la cybersécurité.
## Wireless Network Security Testing
On vérifie les réseaux **Wi-Fi** : mauvaise configuration des **AP**, protocoles de **chiffrement faibles**, réseaux invités mal segmentés, **rogue AP**.
## Software Testing
Analyse des **binaires**, **firmwares**, ou **code source** via **static analysis**, **reverse engineering** ou **fuzzing**. On cherche les **buffer overflows**, erreurs de gestion mémoire, absence de filtrage d’entrée, etc.
---
Chaque domaine exige des outils et des compétences spécifiques. Un **pentest complet** combine souvent plusieurs de ces domaines afin d’obtenir une vue d’ensemble réaliste de la posture de sécurité de l’organisation.
