---
tags:
  - penetration-testing
  - reporting
  - career
  - course/htb-academy
---

# Utilization of Penetration Testing Results
En tant que penetration testers, la découverte de vulnérabilités représente seulement le début de notre mission. Identifier des failles est important, mais cela constitue principalement le socle de notre véritable valeur ajoutée : accompagner le client dans la remédiation systématique des findings identifiés. Notre rôle dépasse l’identification : il inclut un support complet tout au long du cycle de remédiation.
## Comprendre le contexte client
Avant de proposer des recommandations, il est crucial de comprendre l’environnement du client, ses contraintes et ses capacités. Chaque organisation dispose de ressources, compétences techniques et priorités métiers différentes. Ce qui fonctionne pour une grande entreprise n’est pas forcément applicable à une PME. Il faut se renseigner sur l’équipe IT, les contraintes budgétaires, les contrôles de sécurité déjà en place et les opérations métiers. Ce contexte permet d’apporter des recommandations réalistes et applicables.
## Communication des vulnérabilités
La manière de communiquer les vulnérabilités a un impact significatif sur leur compréhension et leur traitement. Commencez toujours par un executive summary qui présente les findings les plus critiques en termes de risques métier. Évitez le jargon technique auprès des non-techniciens. Privilégiez l’explication de l’impact métier et du risque. Pour les équipes techniques, fournissez des détails techniques complets avec des étapes de reproduction claires.
### À inclure pour chaque finding :
1. **Description claire et détails techniques**
Expliquez en détail chaque vulnérabilité : comment elle a été trouvée, sa nature technique. Ajoutez des captures d’écran, des étapes de reproduction. Cela aide les équipes techniques à comprendre et valider.
2. **Analyse d’impact métier**
Traduisez la vulnérabilité en conséquences business : ex. « SQL injection » ➜ fuite de données clients, perte financière, non-conformité réglementaire.
3. **Évaluation du risque et priorisation**
Attribuez un niveau de risque (basé sur la probabilité et l’impact). Utilisez des frameworks standards comme le **CVSS**. Classez les findings pour prioriser la remédiation.
_Exemple :_
**Finding : LLMNR/NBT-NS spoofing**
**Gravité : Haute**
**Références : CWE-522 / CVSS 9.5**
**Impact : Compromission possible d’identifiants réseau internes**
## Développement de plans de remédiation pratiques
Une fois les vulnérabilités communiquées, il faut fournir des recommandations pratiques. Chaque entreprise doit équilibrer sécurité, contraintes opérationnelles et ressources. Proposez des solutions **court terme** (quick wins) et **long terme** (résolution à la racine). Exemples :
- Court terme : désactiver un service vulnérable
- Long terme : migration vers une architecture plus sécurisée
Incluez des instructions précises : pas seulement « patcher », mais **quel patch**, **où le trouver**, **quelles options configurer**. Lien vers des docs éditeurs ou best practices bienvenu.
## Accompagnement à la remédiation
Le rôle du pentester ne s’arrête pas au rapport. Il faut :
- Répondre aux questions techniques
- Guider les équipes sur les implémentations
- Proposer des compensating controls si besoin
- Aider à prioriser les correctifs
- Vérifier les correctifs via un retest
## Vérification et suivi
Prévoir un processus clair de **vérification** post-remédiation. Cela implique souvent un **retest** des vulnérabilités corrigées. Documentez les méthodologies utilisées. Pour les gros projets, une vérification par lot est conseillée (phased retesting).
## Construire une sécurité à long terme
Au-delà des vulnérabilités ponctuelles, aidez à améliorer durablement la posture sécurité :
- Formations de sensibilisation à la sécurité
- Création de politiques internes
- Plans de réponse à incident
- Monitoring continu
- Secure development practices
## Gérer les obstacles
Pendant la remédiation, obstacles fréquents :
- Budget limité
- Systèmes legacy
- Résistance au changement
Proposez des alternatives ou des solutions compensatoires. La sécurité parfaite n’existe pas. Le but est un niveau de risque acceptable adapté au contexte métier et aux ressources disponibles.
