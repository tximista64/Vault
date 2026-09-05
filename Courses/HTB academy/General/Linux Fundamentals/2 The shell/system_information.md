---
tags:
  - linux
  - shell
  - penetration-testing
  - course/htb-academy
---

# System Information

## Connexion SSH

```bash
ssh htb-student@<IP>
```

## Commandes d'information système

| Commande | Description | Utilité pentest |
|---|---|---|
| `whoami` | Nom d'utilisateur courant | Identifier le contexte d'exécution après un shell |
| `id` | UID, GID et groupes de l'utilisateur | Détecter des droits élevés (sudo, adm…) |
| `hostname` | Nom de la machine | Reconnaissance |
| `uname -a` | Infos kernel complètes | Chercher des kernel exploits |
| `uname -r` | Version du kernel uniquement | `uname -r` → recherche "4.15.0-99-generic exploit" |
| `pwd` | Répertoire courant | Navigation |
| `ifconfig` | Config interfaces réseau | Reconnaissance réseau |
| `ip` | Routage, interfaces, tunnels | Reconnaissance réseau |
| `netstat` | Statut réseau | Connexions actives, ports ouverts |
| `ss` | Investigation des sockets | Alternative moderne à netstat |
| `ps` | Processus en cours | Identifier services/processus actifs |
| `who` | Utilisateurs connectés | Awareness post-compromission |
| `env` | Variables d'environnement | Credentials, paths, configs |
| `lsblk` | Périphériques bloc (disques) | Inventaire stockage |
| `lsusb` | Périphériques USB | Inventaire matériel |
| `lsof` | Fichiers ouverts | Connexions, fichiers en cours d'usage |
| `lspci` | Périphériques PCI | Inventaire matériel |

## Points clés

### `id` — groupes à surveiller
- **sudo** → peut exécuter des commandes en root → vecteur de privesc
- **adm** → lecture des logs dans `/var/log` → accès à des infos sensibles
- Groupes non standards → à investiguer

### `uname -r` — kernel exploits
```bash
uname -r
# → 4.15.0-99-generic
# Rechercher : "4.15.0-99-generic exploit"
```
