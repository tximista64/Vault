---
tags:
  - linux
  - file-permissions
  - penetration-testing
  - course/htb-academy
---

# Permission Management

## Structure des permissions

```
- rwx rw- r--   1 root root 1641 May 4 23:42 /etc/passwd
│ │   │   │
│ │   │   └─ Others (r--)
│ │   └───── Group  (rw-)
│ └───────── Owner  (rwx)
└─────────── Type : - fichier, d répertoire, l lien
```

## Les 3 types de permissions

| Permission | Fichier | Répertoire |
|---|---|---|
| `r` (read) | Lire le contenu | Lister le contenu (`ls`) |
| `w` (write) | Modifier le fichier | Créer/supprimer/renommer des fichiers |
| `x` (execute) | Exécuter le fichier | **Traverser** le répertoire (`cd`) |

> ⚠️ Sans `x` sur un répertoire → `Permission Denied` même si `r` est présent.

---

## Notation octale

| Binaire | Octal | Permission |
|---|---|---|
| 111 | 7 | rwx |
| 101 | 5 | r-x |
| 100 | 4 | r-- |
| 110 | 6 | rw- |
| 000 | 0 | --- |

```
chmod 754 fichier  →  rwxr-xr--  (owner=7, group=5, others=4)
```

---

## chmod — modifier les permissions

```bash
# Notation symbolique
chmod u+x fichier       # Ajouter execute à l'owner
chmod g-w fichier       # Retirer write au group
chmod o=r fichier       # Fixer others à read uniquement
chmod a+r fichier       # Ajouter read à tous (all)

# Notation octale
chmod 754 fichier       # rwxr-xr--
chmod 644 fichier       # rw-r--r--  (fichier standard)
chmod 755 fichier       # rwxr-xr-x  (script/binaire)
```

**Références :** `u` = owner, `g` = group, `o` = others, `a` = all

---

## chown — modifier le propriétaire

```bash
chown user:group fichier
chown root:root fichier
chown -R user:group répertoire/   # Récursif
```

---

## SUID & SGID

Bits spéciaux permettant d'exécuter un fichier avec les droits de son **propriétaire** (SUID) ou de son **groupe** (SGID) plutôt que ceux de l'utilisateur qui l'exécute.

```
-rwsr-xr-x  →  SUID (s remplace x pour l'owner)
-rwxr-sr-x  →  SGID (s remplace x pour le group)
```

```bash
chmod u+s fichier    # Ajouter SUID
chmod g+s fichier    # Ajouter SGID
chmod 4755 fichier   # SUID en octal (4 + 755)
chmod 2755 fichier   # SGID en octal (2 + 755)

# Trouver les binaires SUID sur le système
find / -perm -4000 -type f 2>/dev/null
```

> ⚠️ **Vecteur de privesc** : un binaire SUID appartenant à root s'exécute avec les droits root. Voir **GTFObins** pour les binaires exploitables (ex: `journalctl`, `vim`, `find`…).

---

## Sticky Bit

Sur un répertoire partagé, empêche les utilisateurs de supprimer ou renommer des fichiers qui ne leur appartiennent pas.

```
drwxrwxr-t  →  sticky bit + execute (t minuscule)
drwxrwxr-T  →  sticky bit SANS execute (T majuscule)
```

```bash
chmod +t répertoire     # Ajouter le sticky bit
chmod 1777 répertoire   # sticky + rwxrwxrwx (ex: /tmp)
```

| `t` (minuscule) | `T` (majuscule) |
|---|---|
| Sticky bit + `x` actif | Sticky bit + `x` absent |
| Les autres peuvent traverser | Les autres ne peuvent pas entrer |

Exemple classique : `/tmp` a `1777` — tout le monde peut écrire, mais personne ne peut supprimer les fichiers des autres.
