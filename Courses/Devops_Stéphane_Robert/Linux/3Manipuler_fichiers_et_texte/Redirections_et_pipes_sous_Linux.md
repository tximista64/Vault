---
title: "Redirections et pipes sous Linux"
tags:
  - linux
  - administration-systeme
  - cli
  - shell
  - bash
  - redirections
  - pipes
  - stdout
  - stderr
  - stdin
  - tee
  - dev-null
  - sysadmin
aliases:
  - "Flux shell Linux"
  - "stdin stdout stderr"
  - "Redirections shell"
---

# Redirections et pipes sous Linux

> [!summary]
> Chaque commande travaille avec trois flux :
> - **stdin** (`0`) : entrée standard ;
> - **stdout** (`1`) : sortie standard ;
> - **stderr** (`2`) : sortie d’erreur.
>
> Les redirections changent leur destination et les pipes relient la sortie d’une commande à l’entrée d’une autre.

## 1. Les trois flux

| Flux | Numéro | Nom | Rôle |
|---|---:|---|---|
| entrée standard | `0` | stdin | ce que la commande lit |
| sortie standard | `1` | stdout | résultat normal |
| sortie d’erreur | `2` | stderr | erreurs |

Par défaut :

```text
stdin  → clavier
stdout → terminal
stderr → terminal
```

> [!important]
> La redirection est gérée par le **shell**, pas par la commande elle-même.

## 2. `>` — rediriger stdout en écrasant

```bash
ls /etc > liste.txt
```

Si le fichier existe, il est tronqué avant l’exécution de la commande.

## 3. `>>` — ajouter

```bash
echo 'fin' >> liste.txt
```

Ajoute à la fin sans effacer le contenu existant.

## 4. Piège critique : `>` tronque avant l’exécution

```bash
commande-inexistante > important.txt
```

Même si la commande échoue, `important.txt` peut déjà être vide.

> [!danger]
> Une simple faute de frappe peut donc détruire le contenu d’un fichier existant.

Tronquer explicitement :

```bash
> fichier
```

## 5. `noclobber`

```bash
set -o noclobber
```

Empêche `>` d’écraser un fichier existant.

Forcer :

```bash
echo test >| fichier
```

Désactiver :

```bash
set +o noclobber
```

## 6. `<` — rediriger stdin

```bash
wc -l < fichier.txt
```

Différence :

```bash
wc -l fichier.txt
```

peut afficher le nombre **et** le nom, alors que :

```bash
wc -l < fichier.txt
```

n’affiche que le nombre.

## 7. `2>` — rediriger stderr

```bash
find /etc -name '*.conf' 2> erreurs.log
```

Ajouter :

```bash
commande 2>> erreurs.log
```

## 8. `/dev/null`

Ignorer stderr :

```bash
commande 2>/dev/null
```

Ignorer stdout :

```bash
commande > /dev/null
```

Ignorer les deux :

```bash
commande > /dev/null 2>&1
```

## 9. Fusionner stdout et stderr

Forme portable :

```bash
commande > tout.log 2>&1
```

Le shell traite les redirections de gauche à droite.

## 10. L’ordre de `2>&1` compte

Correct :

```bash
commande > tout.log 2>&1
```

Piégé :

```bash
commande 2>&1 > tout.log
```

Dans ce second cas :

```text
stdout → fichier
stderr → terminal
```

> [!important]
> Les redirections sont traitées **de gauche à droite**.

## 11. `&>` et `&>>`

En Bash :

```bash
commande &> tout.log
commande &>> tout.log
```

équivalent respectivement à :

```bash
commande > tout.log 2>&1
commande >> tout.log 2>&1
```

## 12. Ne jamais écrire `> f 2> f`

Dangereux :

```bash
commande > sortie.log 2> sortie.log
```

Les deux flux ouvrent le même fichier séparément et peuvent s’écraser.

Correct :

```bash
commande > sortie.log 2>&1
```

ou :

```bash
commande &> sortie.log
```

## 13. Le pipe `|`

```bash
commande1 | commande2
```

Connecte :

```text
stdout de commande1
        ↓
stdin de commande2
```

Exemple :

```bash
ls /etc | head -n 5
```

## 14. Un pipe ne transporte que stdout

```bash
commande | grep motif
```

`grep` ne reçoit que stdout.

Pour inclure stderr :

```bash
commande 2>&1 | grep motif
```

En Bash :

```bash
commande |& grep motif
```

## 15. Chaîner plusieurs commandes

```bash
cut -d' ' -f2 fichier | sort | uniq -c
```

Chaque maillon fait une tâche précise.

## 16. Code de retour d’un pipe

Par défaut, le code de retour d’un pipeline est celui de la **dernière commande**.

```bash
commande-inexistante | wc -l
echo $?
```

peut afficher `0` si `wc` a réussi.

## 17. `PIPESTATUS`

```bash
commande1 | commande2 | commande3
echo "${PIPESTATUS[@]}"
```

Exemple :

```text
127 0 0
```

> [!warning]
> `PIPESTATUS` doit être lu immédiatement.

## 18. `pipefail`

```bash
set -o pipefail
```

Permet au pipeline de retourner un échec si un maillon échoue.

Très courant dans les scripts :

```bash
set -euo pipefail
```

## 19. `tee` — afficher et enregistrer

```bash
commande | tee fichier.log
```

Affiche à l’écran et écrit dans le fichier.

Ajouter :

```bash
commande | tee -a fichier.log
```

## 20. `tee` et stderr

```bash
commande | tee journal.log
```

n’enregistre que stdout.

Pour inclure stderr :

```bash
commande 2>&1 | tee journal.log
```

ou :

```bash
commande |& tee journal.log
```

## 21. `sudo` et redirection

Ceci peut échouer :

```bash
sudo echo 'test' > /etc/demo.conf
```

car `>` est traité par le shell courant, pas par `sudo`.

Forme correcte avec `tee` :

```bash
echo 'test' | sudo tee /etc/demo.conf
```

Sans doublon à l’écran :

```bash
echo 'test' | sudo tee /etc/demo.conf > /dev/null
```

Ajouter :

```bash
echo 'test' | sudo tee -a /etc/demo.conf > /dev/null
```

Alternative :

```bash
sudo sh -c 'echo "test" > /etc/demo.conf'
```

## 22. Jeter seulement le bon flux

Jeter les erreurs :

```bash
commande 2>/dev/null
```

Jeter le résultat :

```bash
commande > /dev/null
```

Tout jeter :

```bash
commande > /dev/null 2>&1
```

> [!warning]
> Pendant un diagnostic, mieux vaut souvent journaliser stderr que le masquer :
>
> ```bash
> commande 2> /tmp/erreurs.log
> ```

## 23. Tableau récapitulatif

| Syntaxe | Effet |
|---|---|
| `cmd > f` | stdout dans `f`, écrase |
| `cmd >> f` | stdout ajouté dans `f` |
| `> f` | vide/crée `f` |
| `cmd < f` | `f` devient stdin |
| `cmd 2> f` | stderr dans `f` |
| `cmd 2>> f` | stderr ajouté dans `f` |
| `cmd > f 2>&1` | stdout + stderr dans `f` |
| `cmd &> f` | idem, syntaxe Bash |
| `cmd &>> f` | stdout + stderr ajoutés |
| `cmd 2>&1 > f` | piège : stderr reste sur l’ancienne stdout |
| `cmd > f 2> f` | piège : écritures concurrentes |
| `cmd | autre` | stdout de `cmd` → stdin de `autre` |
| `cmd 2>&1 | autre` | stdout + stderr dans le pipe |
| `cmd |& autre` | raccourci Bash |
| `cmd | tee f` | afficher + enregistrer |
| `cmd | tee -a f` | afficher + ajouter |
| `cmd 2>/dev/null` | jeter stderr |
| `cmd > /dev/null` | jeter stdout |
| `cmd > /dev/null 2>&1` | jeter les deux |

## 24. Dépannage rapide

| Symptôme | Cause probable | Solution |
|---|---|---|
| fichier vide après erreur | `>` a tronqué avant lancement | fichier temporaire puis `mv` |
| ancien contenu disparu | `>` au lieu de `>>` | utiliser `>>` |
| stderr reste à l’écran | ordre de `2>&1` incorrect | mettre `2>&1` après `>` |
| sortie fusionnée corrompue | `> f 2> f` | `> f 2>&1` |
| `grep` ne voit pas une erreur | pipe transporte seulement stdout | `2>&1 |` ou `|&` |
| pipeline retourne succès malgré erreur | code = dernière commande | `PIPESTATUS` / `pipefail` |
| `sudo ... > fichier` échoue | redirection faite par shell non root | `sudo tee` / `sudo sh -c` |
| `tee` écrase le fichier | pas de `-a` | `tee -a` |
| `cannot overwrite existing file` | `noclobber` actif | `>|` ou `set +o noclobber` |
| sortie silencieuse | tout redirigé | vérifier les flux séparément |

## 25. Commandes à retenir

```bash
# stdout
commande > fichier
commande >> fichier

# stdin
commande < fichier

# stderr
commande 2> erreurs.log
commande 2>> erreurs.log

# stdout + stderr
commande > tout.log 2>&1
commande &> tout.log

# Pipes
commande1 | commande2
commande1 |& commande2

# Codes de pipeline
echo "${PIPESTATUS[@]}"
set -o pipefail

# Tee
commande | tee fichier.log
commande | tee -a fichier.log

# Null
commande 2>/dev/null
commande > /dev/null 2>&1

# Écriture root
echo 'valeur' | sudo tee /etc/fichier > /dev/null
sudo sh -c 'echo valeur > /etc/fichier'
```

## 26. Réflexes sysadmin

1. Savoir quel flux on manipule : `0`, `1` ou `2`.
2. Se rappeler que `>` tronque **avant** l’exécution.
3. Utiliser `>>` quand le contenu existant doit rester.
4. Lire les redirections de gauche à droite.
5. Toujours préférer `> f 2>&1` à `> f 2> f`.
6. Ne pas oublier que `|` transporte seulement stdout.
7. Utiliser `|&` si stderr doit entrer dans le tube.
8. Activer `pipefail` dans les scripts sérieux.
9. Lire `PIPESTATUS` immédiatement si nécessaire.
10. Utiliser `tee` pour voir et journaliser en même temps.
11. Ne pas croire que `sudo` s’applique au `>`.
12. Éviter de masquer les erreurs avec `/dev/null` pendant un diagnostic.

## À retenir en une phrase

> **Les redirections déplacent les flux, les pipes relient stdout à stdin, et l’ordre des opérateurs détermine exactement où vont les données.**
