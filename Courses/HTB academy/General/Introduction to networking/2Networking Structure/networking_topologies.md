---
tags:
  - networking
  - course/htb-academy
---

# Networking Topologies

Une **topology** réseau est l'arrangement physique ou logique des équipements dans un réseau.

- **Topologie physique** : câblage réel, position des nœuds.
- **Topologie logique** : façon dont les données circulent sur ce support.

## 3 composantes d'un réseau

**Connections** : coaxial, fibre optique, paires torsadées, Wi-Fi, cellulaire, satellite.

**Nodes (NICs)** : repeaters, hubs, bridges, switches, routers, gateways, firewalls.

**Classifications** : 8 topologies de base.

---

## Les 8 topologies

### Point-to-Point
Lien direct dédié entre deux hôtes uniquement. Modèle de base de la téléphonie traditionnelle. À ne pas confondre avec le P2P (Peer-to-Peer).

### Bus
Tous les hôtes partagent un même medium de transmission (ex : câble coaxial). Un seul hôte peut émettre à la fois — les autres reçoivent et filtrent.

### Star
Chaque hôte est connecté à un composant central (switch, hub, router) via un lien dédié. Tout le trafic transite par ce point central.

### Ring
Chaque nœud est connecté par deux câbles (entrée + sortie) formant un anneau. La transmission suit un sens prédéfini, souvent régulée par un **token** (pattern de bits circulant en continu). Une ring topology logique peut reposer sur une star topology physique.

### Mesh
Pas de topologie fixe — les nœuds décident eux-mêmes des connexions et du routage.
- **Fully meshed** : chaque hôte connecté à tous les autres. Haute résilience (WAN/MAN).
- **Partially meshed** : certains nœuds avec une seule connexion, d'autres avec plusieurs.

### Tree
Extension de la star topology — plusieurs niveaux hiérarchiques. Utilisée dans les grands bâtiments, les réseaux broadband et les MAN. Compatible avec le spanning tree.

### Hybrid
Combinaison de deux topologies de base différentes (ex : star networks interconnectés via un bus). Si deux topologies identiques sont reliées, ce n'est pas une hybrid — c'est toujours la même topologie.

### Daisy Chain
Les hôtes sont connectés en série, câble après câble. Utilisé notamment en **automation technology (CAN)**. Le signal passe par chaque nœud intermédiaire pour atteindre sa destination.
