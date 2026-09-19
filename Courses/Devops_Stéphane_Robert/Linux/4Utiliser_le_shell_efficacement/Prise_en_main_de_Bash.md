---
title: "Prise en main de Bash"
tags:
  - linux
  - administration-systeme
  - cli
  - bash
  - shell
  - terminal
  - readline
  - historique
  - autocompletion
  - sysadmin
aliases:
  - "Bases de Bash"
  - "Bash prise en main"
---

# Prise en main de Bash

> [!summary]
> Bash est le shell de référence dans beaucoup d’environnements Linux.
>
> Les réflexes les plus utiles :
> - lire le prompt ;
> - utiliser `Tab` ;
> - rappeler l’historique avec `Ctrl + R` ;
> - interrompre avec `Ctrl + C` ;
> - vérifier le code retour avec `echo $?` ;
> - utiliser `type`, `help` et `man` pour comprendre une commande.

# 1. Terminal ≠ shell

Le **terminal** est l’application qui affiche et transmet les entrées/sorties.

Le **shell** est le programme qui interprète les commandes.

# 2. Comprendre le prompt

Exemple :

```text
bob@serveur:~$
```

| Élément | Signification |
|---|---|
| `bob` | utilisateur |
| `serveur` | hostname |
| `~` | répertoire personnel |
| `$` | utilisateur normal |
| `#` | root |

# 3. Vérifier le shell

```bash
echo "$SHELL"
echo "$0"
ps -p $$ -o comm=
```

`$SHELL` indique le shell de login configuré ; `echo "$0"` ou `ps -p $$` permettent de voir le shell actif.

# 4. Anatomie d’une commande

```text
commande [options] [arguments]
```

Exemple :

```bash
ls -l /etc
```

# 5. La casse compte

```text
ls ≠ LS
```

# 6. Historique Bash

```bash
history
```

Navigation :

```text
Flèche Haut → précédente
Flèche Bas  → suivante
```

# 7. Recherche dans l’historique

```text
Ctrl + R
```

Puis taper quelques caractères.

Appuyer encore sur `Ctrl + R` pour remonter plus loin.

Valider avec `Entrée`, annuler avec `Ctrl + C`.

# 8. Expansion de l’historique

```bash
!!
!42
```

> [!warning]
> Toujours vérifier ce qui va être réexécuté.

# 9. Readline

Bash utilise généralement **Readline** pour l’édition interactive.

# 10. Se déplacer dans la ligne

| Raccourci | Action |
|---|---|
| `Ctrl + A` | début de ligne |
| `Ctrl + E` | fin de ligne |
| `Alt + F` | mot suivant |
| `Alt + B` | mot précédent |

# 11. Supprimer et corriger

| Raccourci | Action |
|---|---|
| `Ctrl + U` | supprimer jusqu’au début |
| `Ctrl + K` | supprimer jusqu’à la fin |
| `Ctrl + W` | supprimer le mot précédent |
| `Alt + D` | supprimer le mot suivant |
| `Ctrl + Y` | recoller le texte supprimé |

# 12. Contrôle des commandes

| Raccourci | Action |
|---|---|
| `Ctrl + C` | interrompre |
| `Ctrl + D` | EOF / quitter si ligne vide |
| `Ctrl + L` | effacer l’écran |
| `Ctrl + Z` | suspendre |

Reprendre :

```bash
fg
```

# 13. `Ctrl + D`

Sur une ligne vide, `Ctrl + D` envoie EOF et peut fermer le shell.

Si `IGNOREEOF` est défini, utiliser :

```bash
exit
```

# 14. Autocomplétion avec `Tab`

```text
Tab
Tab Tab
```

Permet de compléter commandes, chemins, et parfois services/paquets avec `bash-completion`.

# 15. Codes de retour

| Code | Signification courante |
|---:|---|
| `0` | succès |
| `1` | erreur générique |
| `2` | mauvais usage / erreur spécifique |
| `126` | trouvé mais non exécutable |
| `127` | commande introuvable |
| `130` | interrompu par `Ctrl + C` |

# 16. Lire le code retour

```bash
echo $?
```

> [!important]
> `$?` concerne uniquement la dernière commande exécutée.

# 17. `type`

```bash
type ls
type cd
type -a grep
```

`type` identifie alias, builtin, fonction ou exécutable.

# 18. `help` et `man`

Builtins Bash :

```bash
help cd
help history
help type
```

Exécutables :

```bash
man ls
man grep
```

# 19. Quelques commandes utiles

| Commande | Rôle |
|---|---|
| `whoami` | utilisateur courant |
| `pwd` | répertoire courant |
| `ls -la` | détails + cachés |
| `cd` | changer de répertoire |
| `cat /etc/os-release` | distribution |
| `head -5 /etc/passwd` | début du fichier |
| `uname -a` | noyau |
| `uptime` | uptime |
| `free -h` | mémoire |
| `df -h` | espace disque |

# 20. Erreurs typiques

| Commande | Erreur | Cause |
|---|---|---|
| `Whoami` | `command not found` | casse |
| `ls /absent` | `No such file or directory` | chemin absent |
| `cat /root/secret` | `Permission denied` | droits |
| `cd /etc/passwd` | `Not a directory` | cible = fichier |

# 21. Copier-coller dans un terminal

```text
Ctrl + Shift + C → copier
Ctrl + Shift + V → coller
```

`Ctrl + C` interrompt une commande : il ne sert pas à copier dans le shell.

# 22. Attention au collage

Du texte multi-ligne peut être exécuté immédiatement selon le terminal.

> [!warning]
> Relire avant de coller dans un shell sensible.

# 23. Quitter proprement

```bash
exit
```

# 24. Dépannage rapide

| Symptôme | Cause probable | Solution |
|---|---|---|
| `command not found` | typo / casse / PATH | vérifier avec `type` |
| commande inattendue | alias/fonction | `type -a` |
| commande passée introuvable | historique | `Ctrl + R` |
| commande bloquée | processus actif | `Ctrl + C` |
| commande suspendue | `Ctrl + Z` | `fg` |
| mauvais code retour lu | `$?` écrasé | lire immédiatement |
| complétion pauvre | `bash-completion` absent | installer/configurer |
| écran encombré | terminal | `Ctrl + L` |

# 25. Raccourcis à retenir

```text
Ctrl + A   début de ligne
Ctrl + E   fin de ligne
Alt + F    mot suivant
Alt + B    mot précédent
Ctrl + U   supprimer vers le début
Ctrl + K   supprimer vers la fin
Ctrl + W   supprimer mot précédent
Alt + D    supprimer mot suivant
Ctrl + Y   recoller
Ctrl + R   historique
Ctrl + C   interrompre
Ctrl + D   EOF
Ctrl + L   clear
Ctrl + Z   suspendre
Tab        compléter
Tab Tab    afficher les possibilités
```

# 26. Commandes à retenir

```bash
whoami
pwd
echo "$0"
ps -p $$ -o comm=
history
!!
echo $?
type commande
type -a commande
help cd
man ls
fg
exit
```

# 27. Réflexes sysadmin

1. Lire le prompt avant d’agir.
2. Vérifier si tu es root avant une commande sensible.
3. Utiliser `Tab` constamment.
4. Utiliser `Ctrl + R` au lieu de retaper.
5. Éditer la ligne avec `Ctrl + A/E`, `Ctrl + W`, `Alt + F/B`.
6. Interrompre avec `Ctrl + C`.
7. Vérifier immédiatement `echo $?`.
8. Utiliser `type` avant de supposer qu’un mot est un binaire.
9. Utiliser `help` pour les builtins et `man` pour les exécutables.
10. Lire les messages d’erreur avant de relancer au hasard.

## À retenir en une phrase

> **Être efficace dans Bash, c’est surtout maîtriser la ligne de commande elle-même : historique, autocomplétion, Readline, codes de retour et résolution des commandes.**
