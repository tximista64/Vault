---
tags:
  - networking
  - cloud-security
  - course/htb-academy
---

# Internet Architecture
Internet Architecture décrit comment les données sont organisées, transmises et gérées à travers les réseaux. Différents modèles architecturaux répondent à des besoins spécifiques : certains reposent sur un modèle **client-server** classique, d’autres sur un modèle **Peer-to-Peer (P2P)** plus distribué, ou encore des combinaisons hybrides. Chaque architecture présente des avantages et des inconvénients en termes de **scalabilité**, **performance**, **sécurité** et **manageability**.
---
## Peer-to-Peer (P2P) Architecture
- Chaque **node** agit à la fois comme **client** et **server**.
- Permet le partage direct de **fichiers, puissance de calcul, bande passante** sans serveur central.
- Peut être totalement décentralisé ou partiellement centralisé.
**Exemple :**
- Partage de photos entre amis via un logiciel P2P.
- Torrenting (BitTorrent) : les *seeders* envoient les fichiers à plusieurs *peers* simultanément.
**Avantages :**
- **Scalabilité** : plus de nodes = plus de ressources.
- **Résilience** : si un node tombe, les autres continuent.
- **Coût distribué** : bande passante et stockage répartis.
**Inconvénients :**
- **Complexité de gestion** : sécurité et mises à jour difficiles.
- **Fiabilité variable** : dépend de la disponibilité des peers.
- **Sécurité** : exposition directe des nodes.
![[Pasted image 20250831212119.png]]
---
## Client-Server Architecture
- Les **clients** envoient des requêtes, les **servers** y répondent.
- Données et applications centralisées sur des **servers** accessibles via Internet.
**Exemple :**
- Consulter la météo sur un site web (*weatherexample.com*).
Le **browser (client)** envoie une requête → le **web server** traite et renvoie la page.
### Modèles par couches (tiers) :
- **Single-Tier** : client, serveur et base de données sur la même machine (rare, peu scalable).
- **Two-Tier** : client = présentation, serveur = base de données.
- **Three-Tier** : client (UI), application server (business logic), database server (données).
- **N-Tier** : plusieurs couches applicatives distribuées.
**Avantages :**
- **Contrôle centralisé**.
- **Sécurité renforcée** via des politiques centralisées.
- **Performance optimisée** (serveurs dédiés).
**Inconvénients :**
- **Single point of failure** : si le serveur tombe, tout s’arrête.
- **Coûts élevés** (infrastructure + maintenance).
- **Congestion réseau** possible avec trop de clients.
![[Pasted image 20250831213608.png]]
---
## Hybrid Architecture
- Combine **P2P** et **Client-Server**.
- Un serveur central gère **authentification et coordination**, mais les échanges se font directement entre peers.
**Exemple :**
- Applications de **visioconférence** : le serveur central gère la connexion, mais l’audio/vidéo circule en P2P.
**Avantages :**
- **Efficacité** : soulage le serveur.
- **Contrôle** : le serveur central garde un rôle clé.
**Inconvénients :**
- **Complexité d’implémentation**.
- **Point de défaillance potentiel** : si le serveur central tombe.
![[Pasted image 20250831213936.png]]
---
## Cloud Architecture
- Hébergée par des **providers tiers** (AWS, Azure, Google Cloud).
- Basée sur un modèle **client-server** virtualisé.
- Propose des services à la demande : serveurs, stockage, bases de données, SaaS.
**Caractéristiques essentielles :**
1. **On-demand self-service**.
2. **Broad network access**.
3. **Resource pooling**.
4. **Rapid elasticity**.
5. **Measured service**.
**Exemples :**
- Google Drive, Dropbox (SaaS).
**Avantages :**
- **Scalabilité** rapide.
- **Moins de coûts et maintenance** (gérés par le fournisseur).
- **Flexibilité** : accessible partout.
**Inconvénients :**
- **Vendor lock-in** : migration difficile entre providers.
- **Sécurité/Conformité** dépendante du fournisseur.
- **Connectivité Internet** indispensable.
---
## Software-Defined Networking (SDN)
- Sépare le **control plane** (décision) du **data plane** (transmission).
- Le contrôle est centralisé dans un **SDN Controller**.
- Les routeurs/switches exécutent les instructions du contrôleur.
**Exemples d’usage :**
- Datacenters et cloud providers ajustant la bande passante en temps réel.
**Avantages :**
- **Contrôle centralisé** et simplifié.
- **Programmabilité** et **automation** réseau.
- **Scalabilité** et meilleure utilisation des ressources.
**Inconvénients :**
- **Vulnérabilité du contrôleur central**.
- **Implémentation complexe**.
![[Pasted image 20250831214652.png]]
---
## Comparaison des architectures
| Architecture | Centralisation | Scalabilité | Facilité de gestion | Cas d’usage typiques |
|--------------|---------------|-------------|---------------------|----------------------|
| **P2P** | Décentralisée | Haute | Complexe | File-sharing, blockchain |
| **Client-Server** | Centralisée | Modérée | Facile | Sites web, email |
| **Hybrid** | Partielle | Haute | Complexe | Chat apps, visioconférence |
| **Cloud** | Provider centralisé | Haute | Facile (outsourcé) | SaaS, PaaS, stockage |
| **SDN** | Contrôleur central | Haute | Moyenne (outils spéciaux) | Datacenters, entreprises |
---
## Conclusion
Chaque architecture présente des avantages et contraintes.
En pratique, elles sont souvent **combinées** pour équilibrer **performance**, **scalabilité** et **coût**.
Bien comprendre ces distinctions est essentiel pour concevoir ou améliorer un système réseau.
