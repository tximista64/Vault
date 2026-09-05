---
tags:
  - linux
  - regular-expressions
  - shell
  - course/htb-academy
---

# Regular Expressions (RegEx)

Séquence de caractères et **métacaractères** formant un pattern de recherche — utilisable dans `grep`, `sed`, `awk`, et la plupart des langages de programmation.

## Opérateurs de groupement

| Opérateur | Description |
|---|---|
| `(a)` | **Groupe** — traite les éléments internes ensemble |
| `[a-z]` | **Classe de caractères** — liste ou plage de caractères acceptés |
| `{1,10}` | **Quantificateur** — nombre de répétitions du pattern précédent |
| `\|` | **OR** — matche l'un ou l'autre |
| `.*` | **AND implicite** — les deux patterns doivent être présents dans cet ordre |

## Quantificateurs

| Symbole | Signification |
|---|---|
| `*` | 0 ou plusieurs |
| `+` | 1 ou plusieurs |
| `?` | 0 ou 1 |
| `{n}` | Exactement n fois |
| `{n,m}` | Entre n et m fois |

## Ancres et métacaractères courants

| Symbole | Signification |
|---|---|
| `^` | Début de ligne |
| `$` | Fin de ligne |
| `.` | N'importe quel caractère (sauf newline) |
| `\d` | Chiffre (0-9) |
| `\w` | Caractère de mot (a-z, A-Z, 0-9, _) |
| `\s` | Espace, tabulation |
| `[^...]` | Tout caractère **sauf** ceux listés |

## Exemples pratiques avec grep

```bash
# OR — lignes contenant "my" OU "false"
grep -E "(my|false)" /etc/passwd

# AND — lignes contenant "my" ET "false" (dans cet ordre)
grep -E "(my.*false)" /etc/passwd

# Equivalent AND avec deux grep
grep -E "my" /etc/passwd | grep -E "false"

# Lignes commençant par un caractère précis
grep -E "^root" /etc/passwd

# Lignes se terminant par bash
grep -E "bash$" /etc/passwd

# Ignorer les commentaires et lignes vides (utile sur sshd_config)
grep -v "^#\|^$" /etc/ssh/sshd_config
```

> `-E` active les **extended regex** (ERE) dans grep — nécessaire pour `|`, `+`, `{n}`, `()`.
> Sans `-E`, utiliser `\|`, `\+`, etc. (BRE — basic regex).
