---
tags:
  - linux
  - shell
  - penetration-testing
  - course/htb-academy
---

# Find Files and Directories

## which

Retourne le chemin d'un exécutable — vérifie si un outil est disponible sur le système.

```bash
which python    # → /usr/bin/python
which curl gcc netcat wget
```

---

## find

Recherche puissante avec filtres multiples.

```bash
# Syntaxe
find <emplacement> <options>

# Exemple complet
find / -type f -name *.conf -user root -size +20k -newermt 2020-03-03 -exec ls -al {} \; 2>/dev/null
```

### Options principales

| Option | Description |
|---|---|
| `-type f` | Fichiers uniquement (`d` pour répertoires) |
| `-name *.conf` | Nom avec wildcard |
| `-user root` | Filtrer par propriétaire |
| `-size +20k` | Taille supérieure à 20 KiB (`-` pour inférieure) |
| `-newermt 2020-03-03` | Modifié après la date spécifiée |
| `-exec ls -al {} \;` | Exécute une commande sur chaque résultat (`{}` = placeholder) |
| `2>/dev/null` | Supprime les erreurs STDERR (permission denied…) |

### Exemples utiles en pentest

```bash
# Fichiers SUID (privesc)
find / -perm -4000 -type f 2>/dev/null

# Fichiers world-writable
find / -writable -type f 2>/dev/null

# Fichiers appartenant à un utilisateur spécifique
find / -user www-data -type f 2>/dev/null

# Fichiers modifiés récemment
find /etc -newermt 2024-01-01 -type f 2>/dev/null
```

---

## locate

Recherche rapide via une base de données locale — moins de filtres que `find`.

```bash
sudo updatedb        # Mettre à jour la base de données
locate *.conf        # Recherche instantanée
```

| | `find` | `locate` |
|---|---|---|
| Vitesse | Lente (scan en temps réel) | Rapide (base de données) |
| Filtres | Nombreux | Limités |
| À jour | Toujours | Dépend de `updatedb` |
