---
tags:
  - penetration-testing
  - cloud-security
  - course/htb-academy
---

# Cloud Security Testing (Résumé en français avec les termes techniques en anglais)
Le **Cloud Security Penetration Testing** est une évaluation spécialisée qui vise à identifier les vulnérabilités des infrastructures cloud. À mesure que les entreprises migrent vers le cloud, la sécurisation de ces environnements devient essentielle.
## Modèles de services Cloud
- **Infrastructure as a Service (IaaS)** : test des composants comme les machines virtuelles, réseaux et stockages.
- **Platform as a Service (PaaS)** : évaluation des plateformes, frameworks et bases de données.
- **Software as a Service (SaaS)** : test de la sécurité des applications et des mécanismes de protection des données.
## Différences avec les tests traditionnels
Le **shared responsibility model** distingue les responsabilités entre le fournisseur cloud et le client. Le testeur doit savoir précisément ce qu’il est autorisé à tester selon les politiques du fournisseur. De plus, les environnements cloud sont dynamiques, avec des ressources qui changent automatiquement.
## Compétences essentielles
- Maîtrise des plateformes : **AWS**, **Azure**, **Google Cloud Platform**
- Connaissance des outils **Infrastructure as Code (IaC)** et des technologies de conteneurisation (**Docker**, **Kubernetes**)
- Compréhension de la **sécurité des API** et des **applications web**
- Familiarité avec les failles courantes comme les **buckets** publics, les politiques **IAM** (Identity access management) excessives ou les APIs mal sécurisées
## Étapes d’un test cloud
1. **Reconnaissance** : identification des services, buckets, bases de données.
2. **Contrôle d’accès** : analyse des politiques IAM, groupes de sécurité, authentification.
3. **Configuration Assessment** : recherche de mauvaises configurations (ex. base non chiffrée).
4. **Sécurité réseau** : évaluation des configurations réseau et de la segmentation.
5. **Sécurité des données** : vérification du chiffrement, **DLP**(data loss prevention), gestion des clés.
6. **Sécurité applicative** : évaluation du code, des API et de leur interaction avec les services cloud.
## Vulnérabilités courantes
- Buckets mal configurés
- Permissions excessives IAM mal configurées ==> priviledge escalation
- API non sécurisées
- Journaux et surveillance insuffisants
- Conteneurs avec privilèges **root**
- Absence de chiffrement des données
## Outils recommandés
- Outils natifs : **AWS Inspector**, **Azure Security Center**
- Tiers : **CloudSploit**, **Scout Suite**, **Prowler**
- Conteneurs : **Clair**, **Trivy**, **Anchore**
- API : **Postman**, **Burp Suite**
- Traditionnels : **Nmap**, **Metasploit**, **Python**, **Bash**
**Conclusion** : Le cloud présente une **surface d’attaque** vaste. Mener un test de sécurité cloud rigoureux est essentiel pour détecter les failles avant les attaquants.
