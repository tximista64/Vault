---
tags:
  - networking
  - blue-team
  - course/htb-academy
---

# Network Security
En **networking**, la sécurité désigne l’ensemble des mesures prises pour protéger les données, applications, appareils et systèmes contre tout accès non autorisé ou dommage. L’objectif repose sur le **CIA triad** :
| Principe         | Description |
|------------------|-------------|
| Confidentiality  | Seuls les utilisateurs autorisés peuvent voir les données. |
| Integrity        | Les données restent exactes et non altérées. |
| Availability     | Les ressources réseau doivent rester accessibles quand nécessaire. |
Deux éléments centraux de la sécurité réseau : **Firewalls** et **IDS/IPS**.
---
## Firewalls
Un **Firewall** est un dispositif matériel, logiciel, ou hybride qui filtre le trafic réseau entrant et sortant selon des règles définies (**ACL – Access Control Lists**).
On peut l’imaginer comme un vigile à l’entrée d’un bâtiment.
[[pfsense.gif]]
### Types de Firewalls :
1. **Packet Filtering Firewall**
- Travaille sur les couches 3 (Network) et 4 (Transport).
- Exemple : ACL d’un routeur n’autorisant que HTTP (80) et HTTPS (443).
2. **Stateful Inspection Firewall**
- Suit l’état des connexions.
- Exemple : n’autorise une réponse entrante que si elle correspond à une requête sortante valide.
3. **Application Layer Firewall (Proxy)**
- Fonctionne jusqu’à la couche 7 (Application).
- Exemple : un proxy web bloquant des requêtes HTTP malveillantes.
4. **Next-Generation Firewall (NGFW)**
- Combine l’inspection avec des fonctions avancées : DPI (Deep Packet Inspection), IDS/IPS, contrôle applicatif.
- Exemple : bloque IPs malveillantes, inspecte trafic chiffré, applique des politiques spécifiques.
![[Pasted image 20250831225945.png]]
---
## IDS / IPS
- **IDS (Intrusion Detection System)** : détecte et alerte sur un comportement suspect.
- **IPS (Intrusion Prevention System)** : détecte et bloque activement en temps réel.
### Techniques :
| Méthode                   | Description                                                       |
| ------------------------- | ----------------------------------------------------------------- |
| Signature-based detection | Compare le trafic à une base d’exploits connus.                   |
| Anomaly-based detection   | Détecte tout comportement anormal par rapport au trafic habituel. |
### Types :
1. **Network-Based IDS/IPS (NIDS/NIPS)**
Analyse le trafic au niveau réseau (capteurs placés dans des points stratégiques).
2. **Host-Based IDS/IPS (HIDS/HIPS)**
Fonctionne sur une machine hôte, surveillant ses logs et son trafic local.
### Placement courant :
- Derrière un firewall.
- Dans une **DMZ** (serveurs exposés à Internet).
- Directement sur les **endpoints** (serveurs, workstations).
![[Pasted image 20250831230305.png]]
---
## Bonnes pratiques
| Pratique              | Description |
|-----------------------|-------------|
| Define Clear Policies | Appliquer le principe du moindre privilège. |
| Regular Updates       | Maintenir Firewalls, IDS/IPS et OS à jour. |
| Monitor & Log Events  | Analyser régulièrement les journaux et alertes. |
| Layered Security      | Défense en profondeur : Firewalls + IDS/IPS + antivirus + EDR. |
| Penetration Testing   | Tester périodiquement la robustesse via des attaques simulées. |
