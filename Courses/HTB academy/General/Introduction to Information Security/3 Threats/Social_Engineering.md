---
tags:
  - social-engineering
  - infosec-fundamentals
  - course/htb-academy
---

# Social Engineering
Le **social engineering** (ou ingénierie sociale) consiste à **manipuler psychologiquement une personne** afin d’obtenir des informations confidentielles ou de lui faire réaliser une action compromettante pour la sécurité.
Il ne s’agit pas d’une attaque technique, mais d’une **exploitation du facteur humain**, considéré comme le **maillon faible** de la cybersécurité.
---
## 🎭 Principe
Même avec les meilleurs firewalls, SIEM et segmentation réseau, **il suffit qu’un utilisateur clique sur le mauvais lien, ou donne ses identifiants**, pour qu’un attaquant contourne toutes les protections techniques.
> L’humain est souvent plus facilement "exploit" que le système.
---
## 💬 Analogie
Un inconnu en uniforme t’aborde à la gare. Il est souriant, te demande de l’aide. Tu lui prêtes ton badge ou lui donnes une info sensible. Trop tard : tu as été social engineered.
---
## 🔍 Techniques principales
Voici les 5 techniques de base les plus utilisées :
### 1. 🐟 Phishing
Ex : mail qui semble venir de ta banque → clique sur un faux lien → tu saisis tes identifiants → ils sont volés.
### 2. 🎭 Pretexting
Ex : un faux technicien IT t’appelle, prétexte un problème et te demande ton mot de passe → tu le donnes car tu crois qu’il est interne.
### 3. 🎁 Baiting
Ex : tu trouves une clé USB nommée "Salaires_2023.xls" → tu la branches → elle installe un malware.
### 4. 🚪 Tailgating
Ex : quelqu’un sans badge te demande de tenir la porte car il "a les mains prises" → tu ouvres → il entre sans autorisation.
### 5. 🤝 Quid Pro Quo
Ex : un faux support technique t’offre une "mise à jour gratuite" si tu lui donnes tes accès → tu coopères, tu es piégé.
---
## 💣 Impact potentiel
- **Data Breaches** : vol massif de données utilisateurs (ex : mots de passe, infos clients, données de santé…)
- **Pertes financières** : escroqueries, ransomwares déclenchés par erreur humaine
- **Dommages réputationnels** : perte de confiance client, presse, partenaires
- **Perturbation opérationnelle** : accès non autorisés, temps d'arrêt, compromission réseau
---
## 🧠 Pourquoi c’est si dangereux ?
Parce que le social engineering :
- cible **l'imprévisibilité humaine**
- **bypasse les protections techniques**
- peut **démonter une infrastructure complète via un seul clic**
Même des utilisateurs formés peuvent être manipulés si :
- l’attaquant est habile
- le contexte est crédible
- le facteur émotionnel (urgence, autorité, curiosité) est bien exploité
---
## ✅ Défenses
- Sensibilisation régulière et simulations d’attaques
- Culture du doute et du "zero trust"
- Politique stricte sur les accès, les USB, et l'identité visuelle (badges)
- Mise en place de procédures de vérification pour tout appel inhabituel
---
**En cybersécurité, la technologie protège les systèmes, mais seule la lucidité protège l’humain.**
