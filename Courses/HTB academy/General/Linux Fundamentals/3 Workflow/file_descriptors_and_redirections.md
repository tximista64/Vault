---
tags:
  - linux
  - shell
  - course/htb-academy
---

# File Descriptors and Redirections

## File Descriptors (FD)

Identifiants gérés par le kernel pour les ressources I/O ouvertes.

| FD | Nom | Description |
|---|---|---|
| **0** | STDIN | Entrée standard |
| **1** | STDOUT | Sortie standard |
| **2** | STDERR | Sortie d'erreur |

---

## Redirections

| Opérateur | Action |
|---|---|
| `>` | Redirige STDOUT vers un fichier (écrase) |
| `>>` | Redirige STDOUT vers un fichier (append) |
| `2>` | Redirige STDERR vers un fichier |
| `2>/dev/null` | Supprime les erreurs |
| `1>` | Redirige STDOUT explicitement |
| `<` | Utilise un fichier comme STDIN |
| `<<EOF` | Heredoc — saisie multi-ligne jusqu'à `EOF` |
| `\|` | Pipe — passe le STDOUT d'une commande en STDIN de la suivante |

### Exemples

```bash
# Supprimer les erreurs
find /etc/ -name shadow 2>/dev/null

# Rediriger STDOUT vers un fichier
find /etc/ -name shadow 2>/dev/null > results.txt

# Séparer STDOUT et STDERR dans deux fichiers
find /etc/ -name shadow 1> stdout.txt 2> stderr.txt

# Utiliser un fichier comme STDIN
cat < stdout.txt

# Append (ne pas écraser)
find /etc/ -name passwd >> stdout.txt 2>/dev/null

# Heredoc vers un fichier
cat << EOF > stream.txt
Hack The Box
EOF
```

---

## Pipes

Enchaîne les commandes — le STDOUT de l'une devient le STDIN de la suivante.

```bash
# Filtrer les .conf systemd
find /etc/ -name *.conf 2>/dev/null | grep systemd

# Compter les résultats
find /etc/ -name *.conf 2>/dev/null | grep systemd | wc -l
```

### Outils courants avec les pipes

| Outil | Rôle |
|---|---|
| `grep <pattern>` | Filtrer les lignes contenant un pattern |
| `wc -l` | Compter le nombre de lignes |
| `sort` | Trier |
| `uniq` | Dédupliquer |
| `cut -d: -f1` | Extraire un champ délimité |
| `awk '{print $1}'` | Extraire une colonne |
| `head -n 10` | Afficher les 10 premières lignes |
| `tail -n 10` | Afficher les 10 dernières lignes |

---

## Encart — `dpkg -l | grep '^ii'`

`dpkg -l` liste tous les packages Debian/Ubuntu avec leur statut.

Le préfixe `ii` signifie **installed** (souhaité = install, état = installé).

```bash
# Lister tous les packages installés
dpkg -l | grep '^ii'

# Exemple de sortie
ii  curl    7.68.0-1ubuntu2  amd64  command line tool for transferring data
ii  vim     2:8.1.2269-1     amd64  Vi IMproved - enhanced vi editor
```

### Usages pratiques via pipes

```bash
# Compter les packages installés
dpkg -l | grep '^ii' | wc -l

# Chercher un package spécifique
dpkg -l | grep '^ii' | grep python

# Extraire uniquement les noms de packages
dpkg -l | grep '^ii' | awk '{print $2}'

# Lister les packages installés triés alphabétiquement
dpkg -l | grep '^ii' | awk '{print $2}' | sort

# Chercher si un outil est installé (ex: netcat)
dpkg -l | grep '^ii' | grep -i netcat
```

> En pentest, `dpkg -l | grep '^ii'` est utile pour **inventorier les outils disponibles** sur un système compromis, notamment identifier des langages (python, perl, ruby), des outils réseau (netcat, curl, wget) ou des serveurs (apache2, nginx, openssh-server).
