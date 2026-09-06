---
tags:
  - devops
  - agile
  - sre
  - cicd
  - platform-engineering
  - dora
  - calms
  - three-ways
---

# DevOps — Origine, définition et écosystème

## Définition

**DevOps** = culture de travail réunissant Dev (développement) et Ops (exploitation) autour d'un objectif commun : livrer des logiciels **plus vite et plus sûrement**.

Ce n'est ni un outil, ni un poste, ni une équipe isolée — c'est une combinaison de **pratiques, principes culturels et automatisation**.

| Ce que DevOps n'est PAS | Ce que DevOps est |
|---|---|
| Un titre de poste | Une culture et des pratiques |
| Un outil à acheter | Une philosophie d'organisation |
| Une équipe "DevOps" séparée | Une responsabilité partagée |
| Juste du CI/CD | Un changement culturel profond |

---

## Le problème historique — le mur Dev/Ops

### Contexte (années 80-90)
Serveurs coûteux, cycles en V de 6 à 24 mois, déploiements rares et risqués → séparation logique des équipes.

### Objectifs contradictoires

| Équipe | Objectif | Perception de l'autre |
|---|---|---|
| **Dev** | Livrer des features vite | "Les Ops bloquent tout" |
| **Ops** | Maintenir la stabilité | "Les Dev livrent du code buggé" |

### Le cycle toxique

```
Dev livre → Ops découvre des problèmes → déploiement échoue
→ Ops renforce les contrôles → Dev accumule plus de changements
→ releases plus risquées → retour case départ (avec plus de tension)
```

### Métriques DORA des organisations "traditionnelles"

| Métrique | Valeur typique |
|---|---|
| Fréquence de déploiement | 1×/mois à 1×/an |
| Lead time | 2 à 6 mois |
| Taux d'échec des changements | 30-60% |
| MTTR | Jours à semaines |

---

## Naissance du DevOps

- **2008** : Andrew Clay Shafer + Patrick Debois — concept d'"Agile Infrastructure"
- **2009** : Allspaw & Hammond — "10+ Deploys Per Day" à Velocity Conference
- **Octobre 2009** : 1er **DevOpsDays** à Gand (Belgique) — naissance officielle, hashtag #devops

---

## Timeline de l'écosystème

| Date | Événement | Impact |
|---|---|---|
| 2001 | Manifeste Agile | Itération rapide, collaboration |
| 2003 | SRE chez Google (Ben Treynor Sloss) | Formalisation de l'ingénierie de fiabilité |
| 2009 | 1er DevOpsDays | Naissance officielle |
| 2010 | *Continuous Delivery* (Humble & Farley) | Livraison continue formalisée |
| 2012 | DevSecOps (Gartner) | Sécurité intégrée au cycle |
| 2013 | *The Phoenix Project* | Popularisation grand public |
| 2013 | Docker | Révolution du packaging applicatif |
| 2014 | 1er rapport DORA + Kubernetes open-source | Métriques scientifiques + orchestration standard |
| 2017 | GitOps (Weaveworks) | Déploiements déclaratifs via Git |
| 2018 | Platform Engineering (ThoughtWorks) | Plateformes internes |
| 2024-2026 | DORA + IA générative | L'IA amplifie les pratiques existantes — bonnes comme mauvaises |

---

## Outils structurants

**Infrastructure as Code :** Terraform, Ansible, Puppet, Chef

**Conteneurisation :** Docker, Kubernetes

**CI/CD :** Jenkins, GitLab CI, GitHub Actions

**Observabilité :** Prometheus, Grafana, ELK Stack

---

## Frameworks

### Three Ways (Gene Kim)
1. **Flow** — accélérer le flux Dev → Ops → client
2. **Feedback** — boucles de retour rapides
3. **Continual Learning** — expérimentation et apprentissage continu

### CALMS
| Lettre | Pilier |
|---|---|
| **C** | Culture — collaboration et responsabilité partagée |
| **A** | Automation — automatiser tout ce qui peut l'être |
| **L** | Lean — éliminer le gaspillage |
| **M** | Measurement — mesurer pour améliorer |
| **S** | Sharing — partager connaissances et responsabilités |

---

## Lectures recommandées

- *The Phoenix Project* — Gene Kim (roman d'entrée en matière)
- *The DevOps Handbook* 2e éd. — mise en pratique des Three Ways et CALMS
