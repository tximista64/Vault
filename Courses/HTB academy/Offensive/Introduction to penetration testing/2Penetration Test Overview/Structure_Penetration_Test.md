---
tags:
  - penetration-testing
  - methodology
  - reporting
  - course/htb-academy
---

# Structure d’un test d’intrusion (Penetration Test)
Un test d’intrusion suit une méthode rigoureuse et structurée visant à identifier les vulnérabilités au sein des systèmes, des réseaux et des applications. Le processus est documenté étape par étape afin de fournir au client des résultats exploitables et détaillés.
---
## 1. Phase de pré-engagement (Pre-Engagement Phase)
- **Objectif** : Définir le périmètre du test, les attentes du client et les modalités d’intervention.
- **Documents produits** :
- **Rules of Engagement (RoE)** : activités autorisées, contacts, procédures d’urgence.
- **NDA (Non-Disclosure Agreement)** et contrat de service.
---
## 2. Collecte d’informations (Information Gathering Phase)
- **Reconnaissance passive** : recherche d’infos publiques (site web, réseaux sociaux, OSINT…).
- **Reconnaissance active** : interaction directe avec la cible (port scanning, banner grabbing, etc.).
[[nmap-recon.gif]]
---
## 3. Évaluation des vulnérabilités (Vulnerability Assessment Phase)
- Utilisation d’outils automatisés et d’analyses manuelles.
- Objectif : repérer les faiblesses (CVE, configurations, logiques d’application).
- Suppression des faux positifs, analyse de la gravité et des combinaisons possibles.
---
## 4. Exploitation (Exploitation Phase)
- Tentatives contrôlées d’exploitation des vulnérabilités trouvées.
- Objectif : démontrer l’impact réel et les risques potentiels.
- Respect strict des **Rules of Engagement**.
---
## 5. Post-Exploitation
- Activités après accès initial : escalade de privilèges, persistance, tests d’exfiltration.
- Observation du comportement d’un attaquant après une brèche réussie.
---
## 6. Mouvement latéral (Lateral Movement Phase)
- Déplacement dans le réseau : récolte d’identifiants, **pass-the-hash**, exploitation des relations de confiance.
- Objectif : simuler la propagation d’un attaquant interne.
---
## 7. Preuve de concept (Proof of Concept)
- Documentation des vulnérabilités exploitées.
- Fourniture de **scripts**, **payloads**, ou d’exemples reproductibles.
---
## 8. Post-engagement (Post-Engagement Phase)
- Rédaction du rapport :
- **Résumé exécutif** pour la direction.
- **Détails techniques** pour les équipes IT.
- **Captures**, **logs**, évaluation du **risque** et recommandations précises.
---
## 9. Suivi et retest (Remediation Support & Retesting)
- Accompagnement pour corriger les failles.
- **Retest** pour valider l’efficacité des remédiations.
- Objectif : s’assurer de l’amélioration réelle de la posture de sécurité.
---
Ce processus structuré garantit un test réaliste, rigoureux et orienté amélioration continue.
