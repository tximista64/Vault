---
tags:
  - threat-actors
  - apt
  - course/htb-academy
---

# Threat Actors
Un **Threat Actor** (ou acteur de la menace) est un individu ou un groupe organisé ayant l’intention et les compétences pour **mener des cyberattaques**.
Ils ne sont pas là pour défendre, mais pour **exploiter, infiltrer, voler ou saboter**.
Ils peuvent être motivés par l'argent, l'espionnage, l'idéologie ou la vengeance.
---
## 🧠 Threat Actor Team : structure type
Un groupe structuré dispose de rôles spécialisés :
- **👨‍💻 Programmers** : développement de malwares sur mesure
- **🌐 Network Specialists** : cartographie, contournement de défenses réseau
- **🗣️ Social Engineers** : manipulation psychologique des humains
- **🔍 Data Analysts** : exploitation des données volées
- **🧠 Team Leader** : coordination, planification, stratégie
---
## 🧍‍♂️ Lone Threat Actor
Certains agissent seuls (souvent appelés *lone wolves*),
capables de créer, lancer, et dissimuler une attaque complète par eux-mêmes.
- Motivations possibles : **gain personnel, idéologie, revanche**
- Risque : souvent plus **discrets** et **imprévisibles** qu’un groupe organisé
---
## 🖼️ Analogie : braquage en équipe
Comme un **casse de banque organisé**, chaque membre a un rôle :
- 🕵️ Scout = reconnaissance → OSINT, scan réseau
- 🧰 Lockpicker = intrusion → exploits, rootkits, scripts custom
- 🚗 Getaway driver = exfiltration → VPN, chiffrement, stego, obfuscation
- 🎧 Leader = coordination radio → stratégie, évitement des outils trop "bruyants"
> Ils évitent les attaques bruyantes (brute force, malware détectable), et privilégient les techniques **"low & slow"**.
---
## 🎯 Motivations des Threat Actors
| Objectif      | Description |
|---------------|-------------|
| 💰 Financier   | Vol de données, ransomwares, fraudes bancaires |
| 🕵️ Espionnage | Renseignement étatique ou industriel |
| 💥 Disruption | Sabotage, chaos, arrêt de services critiques |
| 🧠 Idéologique | Cyberactivisme (hacktivisme), cyberjihadisme |
| 😡 Revanche    | Ex-employé, concurrent, cyberharcèlement ciblé |
---
## 🧱 Menace réelle
Un Threat Actor, c’est **l’ennemi actif**.
Il connaît :
- tes défenses
- tes angles morts
- ta surface d’attaque humaine et technique
Et il **ne joue pas selon les règles**.
---
## 🛡️ Défense ?
- Threat Intelligence : comprendre leurs TTP (MITRE ATT&CK)
- Segmentation réseau, monitoring comportemental
- Simulation d’attaque (Red Team vs Blue Team)
- Détection de "low and slow" (UEBA, SIEM, hunting manuel)
---
> **La vraie question n’est pas : “Est-ce qu’on est visé ?”
> Mais plutôt : “Combien de temps ont-ils déjà passé chez nous sans qu’on le sache ?”**
