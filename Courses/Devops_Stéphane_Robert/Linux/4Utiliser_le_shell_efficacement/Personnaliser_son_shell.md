---
title: "Personnaliser son shell"
tags:
  - linux
  - administration-systeme
  - cli
  - bash
  - shell
  - configuration
  - bashrc
  - bash-profile
  - alias
  - ps1
  - prompt
  - sysadmin
aliases:
  - "Personnalisation Bash"
  - "Configurer Bash"
---

# Personnaliser son shell

> [!summary]
> La personnalisation de Bash repose surtout sur `~/.bashrc`, `~/.bash_profile`, les aliases, le prompt `PS1`, les exports permanents et `source`.

## 1. Fichiers de configuration Bash

| Fichier | Usage courant |
|---|---|
| `~/.bashrc` | aliases, prompt, fonctions, réglages interactifs |
| `~/.bash_profile` | login shell, variables, chargement de `.bashrc` |
| `~/.bash_login` | alternative si `.bash_profile` absent |
| `~/.profile` | alternative si les précédents sont absents |

> [!important]
> Pour un shell de login, Bash cherche généralement `~/.bash_profile`, puis `~/.bash_login`, puis `~/.profile`, et s’arrête au premier trouvé.

## 2. Centraliser dans `.bashrc`

Beaucoup de distributions font charger `~/.bashrc` depuis `~/.bash_profile` :

```bash
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
```

Cela permet de placer l’essentiel des personnalisations dans `~/.bashrc`.

## 3. Inspecter avant de modifier

```bash
cat ~/.bashrc
nl -ba ~/.bashrc
grep -n 'PS1=' ~/.bashrc
```

## 4. Créer un alias

```bash
alias ll='ls -la --color=auto'
```

Exemples utiles :

```bash
alias ll='ls -la --color=auto'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
```

## 5. Lister et supprimer les aliases

Lister :

```bash
alias
```

Afficher un alias :

```bash
alias ll
```

Supprimer temporairement :

```bash
unalias ll
```

Pour le supprimer définitivement, retirer sa ligne de `~/.bashrc`.

## 6. Rendre un alias permanent

Ajouter dans `~/.bashrc` :

```bash
# Mes aliases
alias ll='ls -la --color=auto'
alias ..='cd ..'
```

Puis :

```bash
source ~/.bashrc
```

## 7. Alias qui masque une commande

Pour voir ce que Bash résout :

```bash
type ls
type -a ls
```

Contourner un alias :

```bash
command ls
```

ou souvent :

```bash
\ls
```

## 8. Le prompt `PS1`

Afficher sa valeur :

```bash
echo "$PS1"
```

Codes principaux :

| Code | Affichage |
|---|---|
| `\u` | utilisateur |
| `\h` | hostname court |
| `\w` | chemin courant complet |
| `\W` | nom du répertoire courant |
| `\d` | date |
| `\t` | heure |
| `\$` | `$` normal, `#` root |

## 9. Prompt simple

```bash
PS1='\u@\h:\w\$ '
```

Exemple :

```text
bob@serveur:~/projets$
```

## 10. Prompt minimaliste

```bash
PS1='\W \$ '
```

## 11. Pourquoi `\$` est utile

Dans `PS1`, `\$` affiche :

```text
$ → utilisateur normal
# → root
```

C’est un bon indicateur visuel avant une commande sensible.

## 12. Ajouter de la couleur

```bash
PS1='\[\033[32m\]\u@\h\[\033[0m\]:\[\033[34m\]\w\[\033[0m\]\$ '
```

Codes courants :

| Code | Couleur |
|---:|---|
| `31` | rouge |
| `32` | vert |
| `33` | jaune |
| `34` | bleu |
| `0` | reset |

## 13. Pourquoi `\[` et `\]` sont importantes

Readline doit savoir quelles séquences n’occupent aucune colonne.

Sans ces marqueurs, le prompt peut se décaler ou mal se redessiner.

> [!important]
> Les séquences ANSI non imprimables de `PS1` doivent être entourées de `\[` et `\]`.

## 14. Réinitialiser la couleur

Toujours terminer un bloc couleur avec :

```text
\[\033[0m\]
```

Sinon la couleur peut déborder sur la commande et la sortie.

## 15. Rendre le prompt permanent

Ajouter la définition de `PS1` à la fin de `~/.bashrc`, puis :

```bash
source ~/.bashrc
```

Si rien ne change :

```bash
grep -n 'PS1=' ~/.bashrc
```

La dernière affectation exécutée gagne.

## 16. Exports permanents

Exemple :

```bash
export PATH="$HOME/scripts:$PATH"
export EDITOR="nano"
```

Puis :

```bash
source ~/.bashrc
```

## 17. Modifier `PATH` sans le casser

Bon :

```bash
export PATH="$HOME/scripts:$PATH"
```

Mauvais :

```bash
export PATH="$HOME/scripts"
```

Le second écrase les chemins système existants.

## 18. Éditeur par défaut

```bash
export EDITOR="vi"
export VISUAL="$EDITOR"
```

## 19. `source`

```bash
source ~/.bashrc
```

Équivalent :

```bash
. ~/.bashrc
```

Le fichier est exécuté dans le shell courant.

## 20. Pourquoi recharger

Modifier `~/.bashrc` ne change pas automatiquement le shell déjà ouvert.

Il faut soit :

```bash
source ~/.bashrc
```

soit ouvrir un nouveau shell.

## 21. Tester temporairement

Avant de rendre un réglage permanent :

```bash
alias ll='ls -la'
PS1='\u@\h:\w\$ '
export EDITOR="vi"
```

Si le résultat convient, l’ajouter ensuite à `~/.bashrc`.

## 22. Sauvegarder avant modification

```bash
cp -a ~/.bashrc ~/.bashrc.bak
```

## 23. Vérifier la syntaxe

```bash
bash -n ~/.bashrc
```

Aucune sortie signifie que Bash n’a pas détecté d’erreur de syntaxe.

## 24. Tester sans perdre sa session

```bash
bash -n ~/.bashrc
bash
```

Pour tester un login shell :

```bash
bash -l
```

Si le résultat est mauvais :

```bash
exit
```

> [!danger]
> Ne jamais fermer sa dernière session SSH fonctionnelle avant d’avoir vérifié qu’une nouvelle connexion fonctionne.

## 25. `.bashrc` et SSH

Une connexion SSH interactive peut passer par un login shell qui charge `~/.bash_profile`.

On trouve souvent dans celui-ci :

```bash
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
```

## 26. Commandes SSH non interactives

```bash
ssh serveur 'uptime'
```

n’est pas équivalent à une session SSH interactive.

Les fichiers chargés dépendent du contexte exact du shell et de la distribution.

> [!important]
> Tester les variables et personnalisations dans le contexte réel d’automatisation.

## 27. Éviter les sorties parasites

Éviter par exemple :

```bash
echo "Bienvenue"
```

dans un fichier susceptible d’être lu en non-interactif.

Cela peut casser :

```text
scp
sftp
rsync via SSH
outils d’automatisation
```

## 28. Ne pas mettre `exit` dans `.bashrc`

Un `exit` mal placé peut interrompre :

- commandes SSH ;
- transferts ;
- shells distants ;
- automatisations.

## 29. Dépannage

| Symptôme | Cause probable | Solution |
|---|---|---|
| alias disparu | seulement défini en session | ajouter à `.bashrc` |
| alias non pris en compte | `.bashrc` non rechargé | `source ~/.bashrc` |
| erreur au `source` | syntaxe invalide | `bash -n ~/.bashrc` |
| prompt bizarre | ANSI mal encadré | vérifier `\[` / `\]` |
| couleur déborde | reset absent | ajouter `\033[0m` |
| `PS1` ne change pas | affectation plus bas | `grep -n 'PS1='` |
| variable absente | mauvais fichier de démarrage | vérifier type de shell |
| mauvaise commande exécutée | alias/fonction | `type -a commande` |
| SSH/scp étrange | sortie parasite dans profils | retirer les `echo` |
| shell cassé après modif | `.bashrc` invalide | restaurer `.bashrc.bak` |

## 30. Commandes à retenir

```bash
cat ~/.bashrc
grep -n 'PS1=' ~/.bashrc

alias
alias ll='ls -la --color=auto'
unalias ll

echo "$PS1"
PS1='\u@\h:\w\$ '

export PATH="$HOME/scripts:$PATH"
export EDITOR="vi"

source ~/.bashrc
. ~/.bashrc

bash -n ~/.bashrc
cp -a ~/.bashrc ~/.bashrc.bak

type ls
type -a ls
```

## 31. Réflexes sysadmin

1. Lire le `.bashrc` avant de l’éditer.
2. Sauvegarder avant une grosse modification.
3. Tester temporairement avant de rendre permanent.
4. Recharger avec `source ~/.bashrc`.
5. Vérifier avec `bash -n ~/.bashrc`.
6. Utiliser `type -a` si un alias masque une commande.
7. Encadrer correctement les séquences couleur de `PS1`.
8. Toujours réinitialiser la couleur.
9. Garder les fichiers de démarrage silencieux en non-interactif.
10. Garder une session SSH saine pendant les modifications.

## À retenir en une phrase

> **Personnaliser Bash revient surtout à maîtriser `.bashrc`, les aliases, `PS1`, les exports et `source`, tout en gardant une configuration simple et sûre pour SSH et l’automatisation.**
