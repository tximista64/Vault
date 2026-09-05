---
tags:
  - penetration-testing
  - mobile-security
  - course/htb-academy
---

# Mobile Security Testing
La sécurité mobile est aujourd'hui essentielle pour les entreprises, en particulier celles qui dépendent fortement des appareils mobiles dans leurs activités. Ces appareils gèrent souvent des données sensibles, des informations clients et des accès à des systèmes critiques.
## Pourquoi la sécurité mobile est-elle cruciale ?
- **BYOD (Bring Your Own Device)** : Les entreprises doivent sécuriser les appareils personnels des employés qui accèdent aux ressources internes.
- **Coûts liés aux violations de données** : Les failles entraînent des sanctions, des procès, et nuisent à la réputation.
- **Télétravail** : Plus de connexions mobiles aux réseaux d’entreprise.
- **Exigences réglementaires** : De nombreuses lois imposent la protection stricte des données.
- **Menaces avancées** : Les mobiles sont visés par des malwares, des phishing, et des exploits de sécurité récents.
## Spécificités des tests mobiles
La surface d’attaque mobile diffère de celle des applications web ou des logiciels classiques :
- Données stockées localement
- Communication avec plusieurs services backend
- Interactions avec des composants matériels
### Domaines critiques :
- Stockage local
- Communications réseau
- Inter-process communication (IPC)
- Sécurité spécifique à la plateforme
## Environnement de test
Avant de commencer :
- Dispositifs physiques et émulateurs/simulateurs
- Pour Android : appareils rootés et non-rootés
- Pour iOS : jailbreak parfois utile
### Outils essentiels :
- `adb` pour Android
- JADX, Ghidra pour le reverse engineering
- Burp Suite Mobile Assistant pour l’analyse réseau
- Frida, Objection pour les tests dynamiques
## Tests Android
### Analyse statique
- Décompilation du `.apk`
- Étude du fichier `AndroidManifest.xml`
- Détection de failles comme : identifiants codés en dur, stockage non sécurisé
**Outil :** `JADX` permet de lire le code Java décompilé
[[jadx-gui.gif]]
### Analyse dynamique
- Surveillance du comportement en temps réel
- Observation du trafic réseau, du système de fichiers, du comportement des fonctions
**Outil :** `Frida`
## Tests iOS
Les applications `.ipa` sont chiffrées par défaut → déchiffrement nécessaire.
### Points d’attention :
- Utilisation du **Keychain**
- Implémentation du **certificate pinning**
- Stockage local
- Gestion des `URL schemes`
- Usage de Touch ID / Face ID
**Outils :** `Objection`, `Frida`
## Vulnérabilités fréquentes
- **Insecure data storage** : infos sensibles non chiffrées ou mal protégées
- **Mauvaise sécurité réseau** : absence de validation TLS, pinning mal implémenté
- **Injection côté client** : SQL injection locale, JS injection dans `WebViews`
## Techniques avancées
- Analyse de code natif
- Étude des mécanismes d’authentification complexes
- Manipulation dynamique avec `Frida` : contournement de détections root, validation achats in-app, etc.
