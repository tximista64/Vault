---
tags:
  - apt
  - threat-actors
  - incident-response
  - course/htb-academy
---

# Advanced Persistent Threats (APT)
Un **APT** est une cyberattaque **avancée, furtive et prolongée** menée par un groupe disposant de **ressources importantes**.
Contrairement aux attaques classiques, un APT **reste longtemps caché dans le système**, avec pour objectif un **accès durable** à des informations sensibles ou des infrastructures critiques.
---
## 🧠 Objectif d’un APT
- **Vol de propriété intellectuelle** (R&D, brevets, secrets industriels)
- **Espionnage étatique** (données gouvernementales, diplomatie, défense)
- **Sabotage stratégique** (réseaux électriques, santé, finance)
- **Influence géopolitique ou économique**
> Il ne s’agit pas de faire de l’argent vite, mais d’**obtenir un avantage stratégique** sur le long terme.
---
## 🖼️ Analogie
Un musée ultra-sécurisé subit une attaque discrète :
pas de braquage spectaculaire, mais des “employés infiltrés” volent une œuvre après l’autre,
sans que personne ne s’en rende compte.
C’est l’esprit d’un APT : **long, discret, efficace.**
---
## 🕵️‍♂️ Les étapes d’un APT (Kill Chain)
1. **Reconnaissance**
Renseignement sur les cibles, services, employés…
2. **Initial Access**
Phishing ciblé (spear-phishing), exploitation de vulnérabilités
3. **Installation**
Implants, malwares, backdoors silencieuses
4. **Lateral Movement**
Escalade de privilèges, déplacement interne vers cibles sensibles
5. **Data Exfiltration**
Extraction discrète de données (via tunnels chiffrés, DNS, steganographie…)
6. **Persistence**
Mécanismes de retour : comptes dormants, TTP redondants, implants cachés
---
## 🔥 Exemple marquant : **SolarWinds (2020)**
- Attaque par la chaîne d’approvisionnement logicielle (supply chain)
- Infiltration de SolarWinds → malware injecté dans mise à jour Orion
- Propagation chez les clients (US Gov, Fortune 500)
- Espionnage massif **non détecté pendant plusieurs mois**
---
## 💣 Impacts
- **💸 Coûts énormes** : réponse à incident, remédiation, pertes de données
- **📉 Réputation détruite** : perte de confiance des clients, partenaires, investisseurs
- **⚖️ Risques juridiques** : amendes, violations de conformité (RGPD, NIS2, etc.)
- **🧠 Espionnage industriel** : perte d’avantage technologique
- **🛰️ Risques étatiques** : crise diplomatique, tensions géopolitiques
- **🔁 Persistances** : même après détection, des portes peuvent rester ouvertes
---
## 🛡️ Défenses contre les APT
- Threat Intelligence (IOC, TTP, profils APT connus)
- Segmentation réseau & principe du moindre privilège
- Détection comportementale (UEBA, EDR, SIEM avancé)
- Monitoring des accès internes & revues régulières
- Gestion rigoureuse des patchs & mise à jour logicielle
- Tests de résilience & Red Teaming
---
> **Un APT ne cherche pas à te casser la porte…
> Il veut une copie de ta clé, ton plan d’évacuation, et ta confiance.**
