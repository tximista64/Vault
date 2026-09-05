---
tags:
  - networking
  - osi-model
  - course/htb-academy
---

# The OSI Model

Modèle de référence en 7 couches pour standardiser la communication entre systèmes hétérogènes. Les couches **2-4** sont orientées **transport**, les couches **5-7** sont orientées **application**.

Chaque couche offre ses services à la couche du dessus et utilise ceux de la couche du dessous.

## Les 7 couches

| # | Couche | Rôle |
|---|---|---|
| 7 | **Application** | Contrôle les entrées/sorties de données, fournit les fonctions applicatives |
| 6 | **Presentation** | Convertit les données dans un format indépendant de l'application |
| 5 | **Session** | Gère la connexion logique entre deux systèmes, évite les interruptions |
| 4 | **Transport** | Contrôle end-to-end du transfert, gère la congestion et la segmentation |
| 3 | **Network** | Établit les connexions et achemine les paquets sur l'ensemble du réseau |
| 2 | **Data Link** | Assure des transmissions fiables et sans erreur — divise le bitstream en frames |
| 1 | **Physical** | Transmission physique via signaux électriques, optiques ou ondes radio (câblé ou sans fil) |

## Flux de transmission

- **Émetteur** : traitement couche 7 → couche 1 (encapsulation)
- **Récepteur** : traitement couche 1 → couche 7 (décapsulation)

Le modèle est parcouru **au moins deux fois** pour chaque communication (une fois côté émetteur, une fois côté récepteur).
