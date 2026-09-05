---
tags:
  - linux
  - shell
  - penetration-testing
  - course/htb-academy
---

# Prompt Description

## Format du prompt Bash

```
<username>@<hostname>[<current_directory>]$
```

| Symbole | Signification |
|---|---|
| `~` | Home directory de l'utilisateur |
| `$` | Utilisateur standard |
| `#` | Root |

En cas de shell obtenu sur une cible (reverse/bind shell), le prompt peut être minimal si la variable **PS1** n'est pas configurée :
- `$` → shell non privilégié
- `#` → shell root

## Variable PS1

Contrôle l'apparence du prompt — définie dans **`~/.bashrc`**.

### Caractères spéciaux utiles

| Caractère | Description |
|---|---|
| `\u` | Nom d'utilisateur |
| `\h` | Hostname (court) |
| `\H` | Hostname complet |
| `\w` | Chemin complet du répertoire courant |
| `\d` | Date (ex: Mon Feb 6) |
| `\D{%Y-%m-%d}` | Date format YYYY-MM-DD |
| `\t` | Heure 24h (HH:MM:SS) |
| `\T` | Heure 12h |
| `\j` | Nombre de jobs en cours |
| `\s` | Nom du shell |
| `\n` | Nouvelle ligne |

## Utilité en pentest

Personnaliser le prompt pour afficher :
- IP de la cible
- Date/heure
- Chemin complet
- Succès/échec de la dernière commande

Combiné avec `script` ou `~/.bash_history` → traçabilité complète des commandes pour la documentation.
