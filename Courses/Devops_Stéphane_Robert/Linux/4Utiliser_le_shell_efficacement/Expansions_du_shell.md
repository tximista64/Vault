---
title: "Expansions du shell"
tags:
  - linux
  - administration-systeme
  - cli
  - bash
  - shell
  - expansions
  - globbing
  - quoting
  - substitution-commande
  - arithmetique
  - sysadmin
aliases:
  - "Expansions Bash"
  - "Globbing et quoting"
---

# Expansions du shell

> [!summary]
> Avant d’exécuter une commande, le shell transforme ce que tu as tapé.
>
> Les expansions principales :
> - globbing : `*`, `?`, `[...]`
> - accolades : `{a,b}`, `{1..5}`
> - tilde : `~`
> - substitution de commande : `$(...)`
> - calcul entier : `$((...))`
> - expansion de variables : `$VAR`
>
> Le choix des guillemets détermine ce que le shell a le droit d’interpréter.

## 1. Le principe

Quand tu tapes :

```bash
ls *.txt
```

`ls` ne reçoit pas littéralement `*.txt`.

Le shell développe d’abord le motif en liste de fichiers, puis lance `ls`.

Exemple mental :

```text
ls *.txt
```

peut devenir :

```text
ls notes.txt rapport.txt todo.txt
```

> [!important]
> Beaucoup d’erreurs attribuées à une commande viennent en réalité d’une expansion effectuée avant son lancement.

## 2. Globbing avec `*`

`*` correspond à zéro ou plusieurs caractères.

```bash
ls *.txt
ls rapport*
```

## 3. Globbing avec `?`

`?` correspond à exactement un caractère.

```bash
ls fichier?.txt
```

Correspond à `fichier1.txt`, `fichierA.txt`, mais pas `fichier12.txt`.

## 4. Globbing avec `[...]`

```bash
ls fichier[123].txt
ls fichier[a-z].txt
```

## 5. Combiner les motifs

```bash
ls /var/log/*.log
ls /etc/*.d/
ls *.{txt,md}
```

## 6. Les fichiers cachés

Par défaut, `*` ne correspond pas aux noms commençant par `.`.

```bash
ls .*
ls .* *
```

## 7. Tester une expansion sans risque

Avant une commande destructive :

```bash
echo *.txt
```

au lieu de :

```bash
rm *.txt
```

## 8. Brace expansion : `{...}`

```bash
echo {rouge,vert,bleu}
```

Résultat :

```text
rouge vert bleu
```

## 9. Créer plusieurs répertoires

```bash
mkdir -p projet/{src,docs,tests}
```

## 10. Séquence numérique

```bash
echo {1..5}
touch fichier{01..10}.txt
```

## 11. Séquence alphabétique

```bash
echo {a..f}
```

## 12. Globbing vs accolades

```text
globbing   → trouve ce qui existe déjà
accolades  → génèrent des chaînes, même si rien n’existe
```

## 13. Pièges des accolades

Correct :

```bash
echo {a,b,c}
```

Piégé :

```bash
echo '{a,b,c}'
```

Les guillemets simples bloquent l’expansion.

## 14. Tilde expansion

```bash
echo ~
```

donne typiquement :

```text
/home/bob
```

Et :

```bash
~/Documents
```

équivaut à `/home/bob/Documents`.

## 15. `~utilisateur`

```bash
echo ~alice
```

peut devenir `/home/alice` si le compte existe.

## 16. Substitution de commande `$()`

```bash
echo "Nous sommes le $(date +%d/%m/%Y)"
```

Le shell exécute `date`, capture sa sortie, puis remplace `$(...)`.

## 17. Stocker le résultat d’une commande

```bash
NB_FICHIERS=$(ls | wc -l)
echo "$NB_FICHIERS"
```

> [!warning]
> `ls | wc -l` est pédagogique mais pas toujours robuste pour compter des fichiers arbitraires. Ici, retiens surtout le mécanisme `$(...)`.

## 18. Préférer `$()` aux backticks

Préférer :

```bash
RESULTAT=$(commande)
```

à :

```bash
RESULTAT=`commande`
```

car `$()` est plus lisible et plus simple à imbriquer.

## 19. Imbrication

```bash
echo "$(basename "$(pwd)")"
```

## 20. Arithmétique avec `$(( ))`

```bash
echo $((3 + 7))
```

Résultat :

```text
10
```

## 21. Opérateurs arithmétiques

```text
+   addition
-   soustraction
*   multiplication
/   division entière
%   modulo
```

Exemple :

```bash
TOTAL=$((512 * 1024))
```

## 22. Division entière

```bash
echo $((7 / 2))
```

Résultat :

```text
3
```

Pour du décimal, préférer `bc` ou `awk`.

## 23. `$()` vs `$(( ))`

```bash
$(commande)
$((expression))
```

Exemple :

```bash
echo "$(date)"
echo "$((2 + 3))"
```

## 24. Guillemets doubles

```bash
NOM="Alice"
echo "Bonjour $NOM"
```

Dans `"..."`, Bash interprète notamment `$VAR`, `$(commande)` et `$((calcul))`.

## 25. Guillemets simples

```bash
echo 'Bonjour $NOM'
```

Résultat :

```text
Bonjour $NOM
```

Tout reste littéral.

## 26. Quand utiliser simples ou doubles

| Besoin | Choix |
|---|---|
| texte avec expansion de variable | `"..."` |
| texte littéral | `'...'` |
| chemin contenant des espaces | `"..."` |
| regex destinée à grep/sed | souvent `'...'` |
| mot de passe contenant `$` | souvent `'...'` |

## 27. Toujours quoter les variables

Préférer :

```bash
rm -- "$FICHIER"
```

à :

```bash
rm $FICHIER
```

Si :

```bash
FICHIER="rapport final.txt"
```

sans quotes, le shell peut transmettre deux arguments.

## 28. Expansion non quotée

```bash
VAR="un deux"
printf '<%s>\n' $VAR
```

peut produire :

```text
<un>
<deux>
```

Avec :

```bash
printf '<%s>\n' "$VAR"
```

on obtient :

```text
<un deux>
```

## 29. Globbing après expansion de variable

```bash
VAR='*.txt'
echo $VAR
```

peut afficher les fichiers correspondants.

Avec :

```bash
echo "$VAR"
```

le texte reste `*.txt`.

## 30. Modèle mental d’expansion

Retenir surtout :

```text
texte saisi
→ expansions du shell
→ découpage en arguments
→ globbing
→ commande exécutée
```

## 31. `echo` comme microscope

```bash
echo *.log
echo "$VAR"
echo {1..5}
echo "$(date)"
echo $((4 * 8))
```

## 32. Dépannage rapide

| Symptôme | Cause probable | Solution |
|---|---|---|
| `*.txt` ne matche rien | aucun fichier correspondant | vérifier avec `echo *.txt` |
| `{a,b,c}` reste littéral | quoting ou syntaxe incorrecte | retirer quotes / espaces |
| `$NOM` reste littéral | simples quotes | utiliser `"..."` |
| `$(commande)` ne marche pas | syntaxe ou commande invalide | tester la commande seule |
| calcul faux | division entière | utiliser `bc`/`awk` si décimal |
| valeur avec espaces éclatée | variable non quotée | utiliser `"$VAR"` |
| `*` contenu dans variable se développe | variable non quotée | utiliser `"$VAR"` |
| `~user` ne marche pas | compte inexistant | vérifier le compte |
| commande destructive cible trop large | glob mal compris | tester avec `echo` avant |

## 33. Formes à retenir

```bash
*.txt
fichier?.txt
fichier[0-9].txt

{a,b,c}
{1..10}
{01..10}
{a..f}

~
~/Documents
~alice

"$VAR"

$(commande)

$((2 + 3))

echo *.txt
```

## 34. Réflexes sysadmin

1. Se rappeler que le shell transforme la ligne avant l’exécution.
2. Tester un glob avec `echo` avant une commande destructive.
3. Utiliser les accolades pour générer des noms, pas pour chercher des fichiers existants.
4. Quoter les variables presque systématiquement avec `"..."`.
5. Utiliser `'...'` quand tu veux du littéral.
6. Préférer `$()` aux backticks.
7. Ne pas confondre `$()` et `$(( ))`.
8. Se rappeler que l’arithmétique Bash est entière.
9. Vérifier les chemins contenant des espaces.
10. En cas de comportement étrange, inspecter ce que le shell a réellement développé.

## À retenir en une phrase

> **Les expansions sont la phase où Bash transforme ta ligne avant d’exécuter la commande ; maîtriser globbing, quoting, `$()` et `$(( ))` évite énormément de surprises.**
