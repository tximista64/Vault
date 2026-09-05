---
tags:
  - linux
  - shell
  - course/htb-academy
---

# Navigation

## Commandes essentielles

| Commande | Description |
|---|---|
| `pwd` | Affiche le répertoire courant |
| `ls` | Liste le contenu d'un répertoire |
| `ls -l` | Liste détaillée (permissions, propriétaire, taille, date) |
| `ls -la` | Liste détaillée **+ fichiers cachés** (préfixés par `.`) |
| `ls -l /var/` | Liste un répertoire sans s'y déplacer |
| `cd /chemin` | Navigue vers un répertoire (chemin absolu ou relatif) |
| `cd -` | Retourne au répertoire précédent |
| `cd ..` | Remonte au répertoire parent |
| `clear` / `Ctrl+L` | Vide le terminal |

## Lecture de `ls -l`

```
drwxr-xr-x  2  cry0l1t3  htbacademy  4096  Nov 13 17:37  Desktop
│            │  │         │           │     │             │
│            │  │         │           │     │             └─ Nom
│            │  │         │           │     └─ Date/heure
│            │  │         │           └─ Taille (octets)
│            │  │         └─ Groupe propriétaire
│            │  └─ Propriétaire
│            └─ Nombre de hard links
└─ Type + permissions (d=répertoire, -=fichier)
```

## Entrées spéciales

- `.` → répertoire courant
- `..` → répertoire parent

## Raccourcis utiles

| Raccourci | Action |
|---|---|
| `TAB` (×2) | Autocomplétion |
| `↑` / `↓` | Historique des commandes |
| `Ctrl+R` | Recherche dans l'historique |
| `Ctrl+L` | Vide le terminal |

---

## Aparté — Inodes

Un **inode** est une structure de données du filesystem qui stocke les **métadonnées** d'un fichier ou répertoire (permissions, propriétaire, timestamps, taille, localisation des blocs sur le disque) — mais **pas** son nom ni son contenu.

Le nom du fichier est stocké dans le répertoire qui pointe vers l'inode via son **numéro d'inode**.

### Ce que contient un inode

- Type de fichier
- Permissions (rwx)
- UID / GID propriétaire
- Taille
- Timestamps : `atime` (accès), `mtime` (modification contenu), `ctime` (modification inode)
- Nombre de hard links
- Pointeurs vers les blocs de données

### Commandes utiles

```bash
# Afficher le numéro d'inode de chaque fichier
ls -i

# Exemple de sortie
131073 Desktop   131074 Documents   131075 Downloads

# Afficher les infos complètes d'un inode
stat fichier.txt

# Exemple de sortie
  File: fichier.txt
  Size: 1234      Blocks: 8      IO Block: 4096  regular file
Device: 802h      Inode: 131073  Links: 1
Access: (0644/-rw-r--r--)  Uid: (1000/cry0l1t3)  Gid: (1000/cry0l1t3)
Access: 2024-01-01 10:00:00
Modify: 2024-01-01 09:00:00
Change: 2024-01-01 09:00:00

# Utilisation des inodes du filesystem
df -i

# Exemple de sortie
Filesystem      Inodes  IUsed   IFree IUse% Mounted on
/dev/sda1      1000000  12345  987655    2% /

# Trouver un fichier par son numéro d'inode
find / -inum 131073 2>/dev/null
```

### Hard links vs Soft links

- **Hard link** : deux noms pointant vers le **même inode** — le fichier n'est supprimé que quand tous les hard links sont supprimés (compteur Links > 1).
- **Soft link (symlink)** : fichier qui pointe vers un **chemin** — si la cible est supprimée, le lien est cassé.

```bash
# Créer un hard link
ln fichier.txt lien_hard.txt

# Créer un symlink
ln -s fichier.txt lien_soft.txt

# Vérifier les liens
ls -li fichier.txt lien_hard.txt lien_soft.txt
```

### Pertinence en pentest

- Un filesystem **saturé en inodes** (`IUse% = 100%`) empêche la création de nouveaux fichiers même si de l'espace disque est disponible → peut bloquer des services.
- Des fichiers avec un **nombre de hard links élevé** ou un **inode partagé inattendu** peuvent signaler des manipulations.
- `find -inum` permet de retrouver tous les noms associés à un inode — utile pour détecter des hard links cachés.
