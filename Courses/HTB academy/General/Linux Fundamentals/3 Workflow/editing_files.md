---
tags:
  - linux
  - shell
  - file-permissions
  - penetration-testing
  - course/htb-academy
---

# Editing Files

## Nano

Éditeur simple — idéal pour débuter.

```bash
nano notes.txt    # Ouvrir/créer un fichier
cat notes.txt     # Afficher le contenu
```

### Raccourcis Nano

| Raccourci | Action |
|---|---|
| `Ctrl+O` | Sauvegarder |
| `Ctrl+X` | Quitter |
| `Ctrl+W` | Rechercher (puis `Enter` pour occurrence suivante) |
| `Ctrl+K` | Couper une ligne |
| `Ctrl+U` | Coller |

> `^` dans l'interface Nano = touche `Ctrl`

---

## Vim

Éditeur modal puissant — courbe d'apprentissage plus élevée mais très efficace. Clone amélioré de Vi.

```bash
vim fichier.txt
vimtutor          # Tutoriel interactif intégré (~25-30 min)
```

### Les 6 modes de Vim

| Mode | Accès | Description |
|---|---|---|
| **Normal** | Démarrage par défaut | Toute saisie = commande |
| **Insert** | `i` | Saisie de texte dans le buffer |
| **Visual** | `v` | Sélection de texte |
| **Command** | `:` | Commandes sur une ligne (tri, remplacement, suppression…) |
| **Replace** | `R` | Écrase le texte existant |
| **Ex** | `Q` | Commandes multiples séquentielles |

### Commandes Vim essentielles

| Commande | Action |
|---|---|
| `:q` | Quitter |
| `:q!` | Quitter sans sauvegarder |
| `:w` | Sauvegarder |
| `:wq` | Sauvegarder et quitter |
| `i` | Passer en mode Insert |
| `Esc` | Retour en mode Normal |
| `/mot` | Rechercher |
| `dd` | Supprimer une ligne |
| `yy` | Copier une ligne |
| `p` | Coller |

---

## Fichiers sensibles — pentest

| Fichier | Contenu | Intérêt |
|---|---|---|
| `/etc/passwd` | Users, UID, GID, home dirs | Énumération utilisateurs |
| `/etc/shadow` | Hashes des mots de passe | Accès restreint — si lisible → privesc |

Mauvaises permissions sur `/etc/passwd` ou `/etc/shadow` → vecteur de **privilege escalation**.
