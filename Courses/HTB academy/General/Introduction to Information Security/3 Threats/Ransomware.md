---
tags:
  - ransomware
  - infosec-fundamentals
  - course/htb-academy
---

# Ransomware
Un **ransomware** est un **malware** qui chiffre les fichiers d’un système (serveur, ordinateur, réseau), les rendant inaccessibles, puis **exige une rançon**, souvent en **cryptomonnaie**, en échange d’une clé de déchiffrement.
---
## 🧠 Objectif principal
- But économique : **extorquer de l'argent**
- Cible : particuliers, entreprises, hôpitaux, administrations
- Conséquences : interruption de service, perte de données, atteinte à la réputation, mise en danger de vies humaines (ex : secteur santé)
---
## 🔐 Analogie
Tu découvres un matin que toutes tes œuvres dans ta galerie d’art sont enfermées derrière des vitrines blindées installées pendant la nuit. Une note te demande 5000 € pour les ouvrir. → C’est ça, un ransomware numérique.
---
## ⚙️ Fonctionnement
1. **Intrusion initiale**
- Hameçonnage (phishing)
- Pièce jointe ou lien malveillant
- Exploitation de vulnérabilité (ex : faille non patchée)
2. **Chiffrement**
- Fichiers critiques (docs, bases de données, photos…)
- Algorithmes complexes
- Suppression des sauvegardes locales parfois
3. **Demande de rançon**
- Message affiché
- Instructions de paiement (souvent Bitcoin/Monero)
- Délai imposé, menace de suppression des données
---
## 📌 Cas célèbre : WannaCry (2017)
- Exploitation d’une vulnérabilité Windows non patchée (EternalBlue)
- Plus de **200 000 machines infectées** dans 150+ pays
- NHS UK : hôpitaux paralysés, opérations annulées, urgences détournées
- Rançon : 300–600 $ en Bitcoin
- Dommages : plusieurs **milliards de dollars**
---
## 🎯 Impacts majeurs
- **Downtime** (arrêt d’activité)
- **Perte de données** si absence ou compromission des sauvegardes
- **Coûts directs** : rançon, récupération, sécurité post-incident
- **Coûts indirects** : image de marque, confiance client, amendes RGPD
- **Risque de récidive** : les victimes qui paient sont souvent re-ciblées
---
## 🧠 Exemples parlants
- Galerie d’art = entreprise privée
- Bibliothèque publique = services critiques pour tous
- Données chiffrées = livres enfermés à code
- Paiement exigé = prix pour réactiver l’accès
---
## 💥 Statistique
- Coût mondial estimé de la cybercriminalité en 2025 : **plusieurs trillions de dollars** par an (Cybersecurity Ventures)
---
## 📌 Conclusion
Le **ransomware** est :
- une menace **économique, technique et sociétale**
- une arme de **disruption massive**
- un levier pour **cybercriminalité organisée**, parfois étatique
Il exige une défense structurée : **patching, sauvegardes isolées, détection, sensibilisation** et **réaction rapide**.
