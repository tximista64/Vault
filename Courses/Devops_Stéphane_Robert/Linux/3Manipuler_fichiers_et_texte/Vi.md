---
title: "Vi sous Linux : modes, commandes essentielles et comment sortir"
tags:
  - linux
  - administration-systeme
  - cli
  - edition
  - vi
  - shell
  - fichiers
  - configuration
  - sysadmin
aliases:
  - "Vi sous Linux"
  - "Commandes essentielles vi"
---

# Vi sous Linux : modes, commandes essentielles et comment sortir

> [!summary]
> `vi` est l’éditeur minimaliste qu’on retrouve presque partout : serveur en rescue, conteneur Alpine/BusyBox, SSH sur un équipement minimal.
>
> Le réflexe de base :
>
> ```text
> i → écrire → Esc → :wq
> ```
>
> Et pour sortir sans rien sauvegarder :
>
> ```text
> Esc → :q!
> ```

## 1. Ouvrir un fichier

```bash
vi fichier
```

À l’ouverture, `vi` démarre en **mode commande**.

## 2. Le cycle essentiel

```text
i      → insertion
Esc    → retour commande
:wq    → sauvegarder et quitter
:q!    → quitter sans sauvegarder
```

## 3. Sortir de vi

| Situation | Commande |
|---|---|
| sauvegarder et quitter | `:wq` |
| quitter sans sauvegarder | `:q!` |
| sauvegarder | `:w` |
| quitter si rien n’a changé | `:q` |
| raccourci sauvegarde + quitter | `ZZ` |
| enregistrer sous un autre nom | `:w nouveau_nom` |
| quitter tous les fichiers sans sauvegarder | `:qa!` |

> [!tip]
> Si tu ne sais plus dans quel mode tu es : `Esc` deux ou trois fois, puis `:q!` si tu veux sortir sans rien écrire.

## 4. Les trois modes

| Mode | Entrée | Rôle | Sortie |
|---|---|---|---|
| commande | ouverture / `Esc` | naviguer, supprimer, copier | `i`, `a`, `o`, `:` |
| insertion | `i`, `a`, `o`, `O` | écrire du texte | `Esc` |
| Ex | `:` | commandes longues | `Entrée` ou `Esc` |

Le **mode commande** est le point central.

## 5. Reconnaître le mode actif

```text
-- INSERT --   → insertion
-- REPLACE --  → remplacement
rien           → commande
:texte         → mode Ex
```

Sur certaines implémentations strictes de vi, les indicateurs peuvent être absents.

## 6. Entrer en insertion

| Touche | Action |
|---|---|
| `i` | insérer avant le curseur |
| `a` | insérer après le curseur |
| `I` | début de ligne |
| `A` | fin de ligne |
| `o` | nouvelle ligne dessous |
| `O` | nouvelle ligne dessus |

## 7. Déplacements de base

```text
     k
     ↑
h ←     → l
     ↓
     j
```

| Touche | Direction |
|---|---|
| `h` | gauche |
| `j` | bas |
| `k` | haut |
| `l` | droite |

Les préfixes numériques fonctionnent :

```text
10j → descendre de 10 lignes
5l  → avancer de 5 caractères
```

## 8. Naviguer par mots

| Touche | Action |
|---|---|
| `w` | début du mot suivant |
| `e` | fin du mot courant |
| `b` | début du mot précédent |
| `W` | mot suivant séparé par espaces |
| `E` | fin du mot « large » |
| `B` | mot précédent « large » |

## 9. Naviguer dans une ligne

| Touche | Action |
|---|---|
| `0` | colonne 1 |
| `^` | premier caractère non blanc |
| `$` | fin de ligne |

Pour un fichier indenté, `^` est souvent plus utile que `0`.

## 10. Aller à une ligne précise

```text
:42
42G
gg
G
```

- `:42` / `42G` → ligne 42
- `gg` → début
- `G` → fin

## 11. Naviguer dans l’écran

| Touche | Action |
|---|---|
| `H` | haut de l’écran |
| `M` | milieu de l’écran |
| `L` | bas de l’écran |
| `Ctrl + f` | page suivante |
| `Ctrl + b` | page précédente |

## 12. Marques

```text
ma   → poser la marque a
'a   → revenir à la ligne marquée
`a   → revenir à la position exacte
```

## 13. Supprimer

Logique générale :

```text
d + mouvement
```

| Commande | Action |
|---|---|
| `x` | caractère sous le curseur |
| `X` | caractère précédent |
| `dw` | jusqu’au mot suivant |
| `dd` | ligne entière |
| `d$` | jusqu’à la fin de ligne |
| `d0` | jusqu’au début de ligne |
| `3dd` | supprimer 3 lignes |

## 14. Supprimer = couper

Dans vi, ce qui est supprimé va dans un registre.

Après :

```text
dd
```

on peut recoller avec :

```text
p
```

Et annuler avec :

```text
u
```

## 15. Modifier un caractère

```text
r
```

Puis taper le nouveau caractère.

## 16. Mode remplacement

```text
R
```

Le texte tapé écrase les caractères existants.

Sortir avec :

```text
Esc
```

## 17. `c` — changer

| Commande | Action |
|---|---|
| `cw` | changer un mot |
| `cc` | changer une ligne |
| `c$` | changer jusqu’à la fin |

## 18. Annuler et répéter

| Commande | Action |
|---|---|
| `u` | annuler |
| `U` | annuler les modifications de la ligne |
| `.` | répéter la dernière modification |

> [!tip]
> `.` rejoue la dernière modification à l’endroit courant.

## 19. Copier : yank

| Commande | Action |
|---|---|
| `yy` | copier la ligne |
| `yw` | copier un mot |
| `y$` | copier jusqu’à la fin |
| `3yy` | copier 3 lignes |

## 20. Couper

| Commande | Action |
|---|---|
| `dd` | couper une ligne |
| `dw` | couper un mot |
| `d3w` | couper 3 mots |

## 21. Coller

| Commande | Action |
|---|---|
| `p` | coller après / dessous |
| `P` | coller avant / dessus |

## 22. Registres nommés

```text
"ayy   → copier la ligne dans a
"byy   → copier dans b
"ap    → coller a
"bp    → coller b
"Ayy   → ajouter au registre a
```

## 23. Rechercher

Vers le bas :

```text
/motif
```

Vers le haut :

```text
?motif
```

Occurrence suivante / précédente :

```text
n
N
```

## 24. Regex simples dans la recherche

| Motif | Sens |
|---|---|
| `.` | n’importe quel caractère |
| `*` | zéro ou plusieurs du précédent |
| `^` | début de ligne |
| `$` | fin de ligne |

Pour un point littéral :

```text
/version\.1
```

## 25. Remplacer

Ligne courante :

```text
:s/ancien/nouveau/
```

Toutes les occurrences de la ligne :

```text
:s/ancien/nouveau/g
```

Tout le fichier :

```text
:%s/ancien/nouveau/g
```

Avec confirmation :

```text
:%s/ancien/nouveau/gc
```

## 26. Options utiles

```text
:set number
:set nonumber
:set ignorecase
:set noignorecase
:set autoindent
:set noautoindent
:set tabstop=4
:set showmode
```

Plusieurs options :

```text
:set number autoindent tabstop=4
```

## 27. Collage et autoindent

Si le texte collé part en escalier :

```text
:set noautoindent
```

Puis réactiver si nécessaire :

```text
:set autoindent
```

## 28. Lecture seule et permissions

Erreur typique :

```text
E212: Can't open file for writing
```

Solution :

```bash
sudo vi fichier
```

## 29. `E45: readonly option is set`

Si les droits système le permettent :

```text
:w!
```

> [!warning]
> `!` force la commande vi, mais ne donne pas de nouveaux droits système.

## 30. Dépannage rapide

| Symptôme | Cause | Solution |
|---|---|---|
| rien ne s’écrit | mode commande | `i` |
| des commandes partent quand tu tapes | mode commande | `i`, `a` ou `o` |
| impossible de quitter | modifications non sauvegardées | `:wq` ou `:q!` |
| texte écrase ce qui existe | mode remplacement | `Esc` |
| mauvaise manipulation | édition accidentelle | `u` ou `:q!` |
| `E212` | droits insuffisants | `sudo vi fichier` |
| `E45` | lecture seule | `:w!` si droits suffisants |
| perdu dans les modes | mauvais état interne | `Esc` plusieurs fois |

## 31. Commandes à retenir

```text
i      insertion
Esc    retour commande
:w     sauvegarder
:q     quitter
:wq    sauvegarder + quitter
:q!    quitter sans sauvegarder

hjkl   déplacer
w/e/b  navigation mots
0/^/$  ligne
gg/G   début/fin fichier
:42    ligne 42

dd     couper ligne
yy     copier ligne
p      coller
u      annuler
.      répéter

/mot   rechercher
n/N    suivant/précédent

:%s/ancien/nouveau/g
:set number
```

## 32. Réflexes sysadmin

1. En cas de doute : `Esc`.
2. Mémoriser `i → Esc → :wq`.
3. Mémoriser `:q!` comme sortie de secours.
4. Utiliser `:ligne` pour atteindre directement une erreur signalée.
5. `dd`, `yy`, `p`, `u` couvrent déjà énormément de besoins.
6. Rechercher avec `/motif` plutôt que scroller.
7. Utiliser `:%s/.../.../g` pour une substitution globale.
8. Activer `:set number` en dépannage.
9. Se rappeler que suppression = coupe.
10. Rien n’est écrit sur disque tant qu’on n’a pas fait `:w`.

## À retenir en une phrase

> **Avec vi, le mode commande est le centre du monde : `i` pour écrire, `Esc` pour revenir, `:wq` pour sauvegarder et sortir, `:q!` pour tout abandonner.**
