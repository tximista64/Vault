---
tags:
  - cloud-security
  - infosec-fundamentals
  - course/htb-academy
---

# Cloud Security
La **Cloud Security** désigne l’ensemble des mesures visant à protéger les données, les applications et les services hébergés dans le cloud. Elle repose sur un modèle de **responsabilité partagée** entre le fournisseur de service cloud et le client.
---
## Analogie : garde-meuble partagé
Stocker ses biens dans un garde-meuble (le cloud) impose :
- Des **mesures collectives** : sécurité des bâtiments, caméras, personnel (fournisseur)
- Des **mesures individuelles** : verrouillage de son box, protection de la clé (client)
---
## Menaces courantes
- **Data Breach** : accès non autorisé à vos données (vol)
- **Insecure APIs** : failles dans les interfaces cloud (porte mal fermée)
- **Misconfiguration** : mauvaise configuration des droits (box laissé ouvert)
- **Account Hijacking** : vol d'identifiants (badge volé)
---
## Zones clés de la Cloud Security
### Data Protection
- Chiffrement **at rest** et **in transit**
- Politique de rétention et de sauvegarde
### IAM (Identity and Access Management)
- Contrôle précis des utilisateurs
- MFA, rôles, politiques d'accès
### Network Security
- Firewalls, VPN, segmentation
- Surveillance du trafic réseau
### Compliance & Governance
- Respect des réglementations (RGPD, ISO, SOC 2...)
- Audits, documentation, gestion des risques
---
## Responsabilités
| Acteur                       | Responsabilités |
|-----------------------------|-----------------|
| **Cloud Provider**          | Infrastructure, sécurité physique, maintenance, isolation multi-tenant |
| **Client / Administrateur** | Gestion des accès, configuration des ressources, protection des données |
| **Security Teams**          | Politiques de sécurité, analyse de risques, sensibilisation, veille |
---
## Tests & vigilance
- **Pentests cloud** : simulation d’attaques pour détecter les failles
- **Mises à jour** régulières des composants et des configurations
- **Surveillance continue** : détection d’anomalies, journaux
- **Formation des utilisateurs**
---
## Conclusion
La Cloud Security repose sur :
- une **collaboration active** entre client et fournisseur,
- une **mise à jour permanente** des mesures,
- et une **vision stratégique intégrée** dans l’organisation.
Elle est **indispensable** pour toute entreprise utilisant des services cloud, face à des menaces toujours plus évolutives.
