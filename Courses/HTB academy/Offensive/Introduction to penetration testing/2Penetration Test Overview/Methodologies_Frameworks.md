---
tags:
  - penetration-testing
  - methodology
  - course/htb-academy
---

# Methodologies & Frameworks
Lorsqu’on débute en penetration testing, il est essentiel de comprendre les différentes **méthodologies** et **frameworks** existants. Ces approches structurées fournissent une feuille de route permettant de mener des évaluations de sécurité de manière cohérente, exhaustive et professionnelle.
---
## Méthodologies principales en Pentest
### Penetration Testing Execution Standard (PTES)
C’est l’un des standards les plus reconnus. Il divise le processus en 7 phases :
1. Préparation et interactions initiales (Pre-engagement)
2. Collecte d’informations (Intelligence Gathering)
3. Modélisation des menaces (Threat Modeling)
4. Analyse des vulnérabilités (Vulnerability Analysis)
5. Exploitation
6. Post-Exploitation
7. Reporting
### NIST Technical Guide to Information Security Testing
Le guide du **NIST** propose une approche plus formelle, particulièrement utile pour les tests en environnement institutionnel ou gouvernemental. Il met l’accent sur :
- La planification des tests
- L'exécution structurée
- Les étapes post-test
### OWASP Testing Guide
Ce guide est centré sur les applications web. Il est structuré autour de 4 phases :
1. Information Gathering
2. Configuration & Deployment Management Testing
3. Identity Management Testing
4. Authentication Testing
Il fournit des procédures concrètes pour tester les vulnérabilités classiques des applications web (XSS, injection SQL, etc.).
### MITRE ATT&CK
Le framework MITRE ATT&CK catalogue les **tactiques** et **techniques** des attaquants observés dans le monde réel. Il est utilisé pour :
- Simuler des attaques réalistes
- Évaluer la couverture défensive
- Planifier des scenarios offensifs par étapes
---
## Choisir la bonne approche
Le choix de la méthodologie dépend du contexte :
- **Black box** : le pentester ne connaît rien de la cible
- **White box** : toutes les informations sont fournies
- **Grey box** : information partielle
En général, les pentesters expérimentés combinent plusieurs frameworks pour s’adapter aux besoins spécifiques du test.
---
## Construire sa propre méthodologie
Avec l’expérience, chaque pentester développe une méthodologie personnalisée, basée sur :
- Les frameworks existants
- L’expérience accumulée
- Les outils et scripts éprouvés
- Des checklists spécifiques (test d’app web, réseau, etc.)
### Étapes pour développer sa méthodologie personnelle
- Partir des standards comme PTES ou OWASP
- Prendre des notes lors des labs, tests réels ou CTF
- Documenter ses techniques, erreurs et réussites
- Créer ses propres scripts, les améliorer
- Mettre à jour sa méthode au fil des évolutions du secteur
Une méthodologie personnelle doit être souple, mais rigoureuse. Elle facilite le partage des connaissances, améliore la cohérence des missions et garantit des livrables professionnels.
---
> **Conclusion :** Le développement d'une méthodologie est un processus itératif. Elle s’adapte en permanence grâce à la pratique, à la veille, et aux défis rencontrés.
