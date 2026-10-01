---
title: "Filtrer et transformer du texte sous Linux"
tags:
  - linux
  - administration-systeme
  - cli
  - texte
  - grep
  - regex
  - cut
  - sort
  - uniq
  - wc
  - tr
  - diff
  - sed
  - awk
  - bash
  - shell
  - sysadmin
aliases:
  - "Filtrage de texte Linux"
  - "grep et expressions régulières"
  - "cut sort uniq wc tr diff"
---

# Filtrer et transformer du texte sous Linux

> [!summary]
> Pour traiter du texte sous Linux, les outils essentiels sont :
> - **`grep`** pour filtrer selon un motif ;
> - **`cut`** pour extraire des champs ;
> - **`sort`** pour trier ;
> - **`uniq`** pour compter ou supprimer les doublons consécutifs ;
> - **`wc`** pour compter ;
> - **`tr`** pour traduire ou supprimer des caractères ;
> - **`diff`** pour comparer ;
> - **`sed`** et **`awk`** pour aller plus loin.

---

# 1. `grep` — filtrer les lignes

Syntaxe :

```bash
grep 'motif' fichier
```

`grep` affiche les lignes qui correspondent au motif.

Options utiles :

```bash
grep -i 'motif' fichier   # ignorer la casse
grep -n 'motif' fichier   # numéro de ligne
grep -v 'motif' fichier   # inverser la sélection
grep -o 'motif' fichier   # seulement la partie trouvée
grep -c 'motif' fichier   # compter les lignes correspondantes
grep -w 'mot' fichier     # mot entier
```

# 2. Ancrages `^` et `$`

```text
^ → début de ligne
$ → fin de ligne
```

Exemples :

```bash
grep '^web' fichier
grep '^$' fichier
```

Pour tolérer espaces et tabulations en fin de ligne :

```bash
grep -E 'actif[[:blank:]]*$' fichier
```

Pour tolérer une indentation au début :

```bash
grep -E '^[[:blank:]]*proxy' fichier
```

# 3. Voir les caractères invisibles

```bash
cat -A fichier
```

Repères :

```text
$  → fin de ligne
^I → tabulation
```

# 4. Le point `.`

En regex :

```text
. → n’importe quel caractère
```

Donc :

```bash
grep 'proxy.conf' fichier
```

peut aussi faire correspondre `proxyXconf`.

Pour un point littéral :

```bash
grep 'proxy\.conf' fichier
```

# 5. Classes de caractères

```text
[0-9]          → chiffre
[a-z]          → lettre minuscule
[^;]           → tout sauf ;
```

Classes POSIX utiles :

| Classe | Sens |
|---|---|
| `[[:digit:]]` | chiffres |
| `[[:alpha:]]` | lettres |
| `[[:alnum:]]` | lettres + chiffres |
| `[[:blank:]]` | espace + tabulation |
| `[[:space:]]` | espaces/blancs |
| `[[:upper:]]` | majuscules |
| `[[:lower:]]` | minuscules |

# 6. BRE contre ERE

Par défaut, `grep` utilise les regex basiques.

Avec :

```bash
grep -E
```

on active les regex étendues.

| Fonction | BRE | ERE |
|---|---|---|
| un ou plusieurs | `\+` | `+` |
| zéro ou un | `\?` | `?` |
| répétition | `\{n,m\}` | `{n,m}` |
| alternance | `\|` | `|` |
| groupe | `\(...\)` | `(...)` |

> [!tip]
> Dès que le motif contient `+`, `?`, `{n,m}`, `|` ou `()`, préférer `grep -E`.

# 7. Alternance et groupes

```bash
grep -E 'ARRETE|maintenance' fichier
grep -E '^(web|db)-' fichier
```

# 8. Quantificateurs

```bash
grep -E '[0-9]+'
grep -E 'arrete?'
grep -E '[0-9]{2,4}'
grep -E ';[0-9]{4};' fichier
```

# 9. `-w` — mot entier

```bash
grep -w 'port' fichier
```

évite de trouver des sous-chaînes comme `export`.

# 10. `-o` — extraire seulement la correspondance

```bash
grep -oE '\[[^]]+\]' fichier
```

Éviter :

```bash
grep -oE '\[.*\]'
```

car `.*` est gourmand.

# 11. `-c` compte les lignes, pas les occurrences

```bash
grep -c 'redemarrage' fichier
```

Pour compter toutes les occurrences :

```bash
grep -o 'redemarrage' fichier | wc -l
```

# 12. `-v` — exclure

```bash
grep -v '^#' fichier
```

Retirer commentaires et lignes vides :

```bash
grep -vE '^[[:blank:]]*(#|$)' fichier
```

# 13. Recherche récursive

```bash
grep -r 'motif' /chemin
grep -rn 'motif' /chemin
```

`-r` ne suit pas tous les symlinks rencontrés.

`-R` les suit :

```bash
grep -Rn 'motif' .
```

> [!warning]
> `-R` peut provoquer doublons et boucles via les symlinks.

# 14. Afficher seulement les fichiers trouvés

```bash
grep -rl 'timeout' .
```

Limiter par extension :

```bash
grep -rn --include='*.conf' 'timeout' .
```

# 15. Codes de retour de `grep`

| Code | Sens |
|---|---|
| `0` | au moins une correspondance |
| `1` | aucune correspondance |
| `2` | erreur |

Avec `-q` :

```bash
grep -q 'motif' fichier
```

Exemple :

```bash
if grep -q '^bastion-01;' parc.csv; then
  echo "présent"
else
  echo "absent"
fi
```

# 16. Motifs et shell

Toujours protéger les motifs :

```bash
grep '*.conf' fichier
```

Pour une recherche strictement littérale :

```bash
grep -F '*.conf' fichier
```

> [!tip]
> Si aucune regex n’est nécessaire, utiliser `grep -F`.

# 17. Contexte autour d’une correspondance

```bash
grep -A 3 'motif' fichier
grep -B 3 'motif' fichier
grep -C 3 'motif' fichier
```

# 18. Locale et regex

Le comportement des classes dépend de la locale.

```bash
echo 'café prêt' | grep -oE '[[:alpha:]]+'
```

Avec :

```bash
LC_ALL=C
```

les accents peuvent ne plus être vus comme des lettres.

Conséquence : `LC_ALL=C` peut être plus rapide et reproductible, mais incorrect pour certains textes accentués.

# 19. `cut` — extraire des champs

```bash
cut -d: -f1 /etc/passwd
cut -d: -f1,6 /etc/passwd
```

Par caractères :

```bash
echo 'abcdefgh' | cut -c1-4
```

Limite : `cut` gère mal plusieurs espaces consécutifs comme séparateur logique. Dans ce cas, préférer `awk`.

# 20. `sort` — trier

```bash
sort fichier
sort -n fichier
sort -r fichier
sort -rn fichier
```

Sur une colonne :

```bash
sort -t',' -k2 fichier.csv
```

# 21. `uniq` — dédupliquer

`uniq` ne supprime que les doublons consécutifs.

Donc :

```bash
sort fichier | uniq
```

Compter :

```bash
sort fichier | uniq -c
```

Seulement les doublons :

```bash
sort fichier | uniq -d
```

Pipeline classique :

```bash
sort fichier | uniq -c | sort -rn
```

# 22. `wc` — compter

```bash
wc fichier
wc -l fichier
wc -w fichier
```

`wc -l` compte les retours à la ligne.

# 23. `tr` — traduire ou supprimer des caractères

```bash
echo 'HELLO WORLD' | tr 'A-Z' 'a-z'
echo 'prix: 42,50 €' | tr -d ' '
echo 'un;deux;trois' | tr ';' ','
```

`tr` transforme des caractères, pas des mots.

# 24. `diff` — comparer deux fichiers

```bash
diff fichier1 fichier2
diff -y fichier1 fichier2
diff -u fichier1 fichier2
```

Pas de sortie = fichiers identiques.

# 25. `sed` — aperçu

Première occurrence par ligne :

```bash
sed 's/ancien/nouveau/' fichier
```

Toutes :

```bash
sed 's/ancien/nouveau/g' fichier
```

Modification directe :

```bash
sed -i 's/ancien/nouveau/g' fichier
```

> [!danger]
> Toujours tester sans `-i` avant.

# 26. `awk` — aperçu

Premier champ :

```bash
awk '{print $1}' fichier
```

Avec séparateur :

```bash
awk -F: '{print $1, $6}' /etc/passwd
```

Avec condition :

```bash
awk -F: '$3 >= 1000 {print $1}' /etc/passwd
```

# 27. Pipelines utiles

Utilisateurs triés :

```bash
cut -d: -f1 /etc/passwd | sort
```

Commandes les plus utilisées :

```bash
history | awk '{print $2}' | sort | uniq -c | sort -rn | head -n 5
```

Compter les lignes contenant `error` :

```bash
grep -c 'error' /var/log/syslog
```

ou :

```bash
grep 'error' /var/log/syslog | wc -l
```

# 28. Dépannage rapide

| Symptôme | Cause probable | Solution |
|---|---|---|
| `grep` ne trouve rien | casse différente | `-i` |
| motif avec `+`, `?`, `{}`, `()` ou `|` ne marche pas | ERE utilisée en BRE | `grep -E` |
| `$` fait perdre une ligne | espaces finaux | `cat -A`, `[[:blank:]]*$` |
| `^` ne trouve pas | indentation | `^[[:blank:]]*` |
| trop de résultats avec `.` | `.` = n’importe quoi | `\.` |
| faux positif sur une sous-chaîne | recherche partielle | `-w` |
| `-o` capture trop | `.*` gourmand | classe négative |
| `-c` compte trop peu | compte les lignes | `-o | wc -l` |
| regex interprétée par le shell | motif mal quoté | quotes simples / `-F` |
| accents mal reconnus | locale | vérifier `LC_ALL` |
| liens ignorés en récursif | comportement de `-r` | `-R` si voulu |
| `cut` découpe mal | mauvais séparateur | vérifier `-d` |
| nombres mal triés | tri texte | `sort -n` |
| `uniq` ne retire rien | doublons non adjacents | `sort` avant |
| `sed -i` a cassé le fichier | substitution incorrecte | tester sans `-i` |
| `diff` ne sort rien | fichiers identiques | comportement normal |

# 29. Commandes à retenir

```bash
# grep
grep -in 'motif' fichier
grep -E 'regex' fichier
grep -w 'mot' fichier
grep -oE 'regex' fichier
grep -vE 'regex' fichier
grep -rn 'motif' /chemin
grep -rl 'motif' /chemin
grep -q 'motif' fichier
grep -F 'texte littéral' fichier
grep -C2 'motif' fichier

# cut
cut -d: -f1 /etc/passwd

# sort / uniq
sort fichier
sort -n fichier
sort fichier | uniq -c | sort -rn

# wc
wc -l fichier

# tr
tr 'A-Z' 'a-z'
tr -d ' '

# diff
diff -u fichier1 fichier2

# sed
sed 's/ancien/nouveau/g' fichier

# awk
awk -F: '{print $1}' /etc/passwd
```

# 30. Réflexes sysadmin

1. Commencer simple avec `grep`, puis préciser avec regex.
2. Utiliser `-E` dès qu’il y a quantificateurs, alternance ou groupes.
3. Protéger les motifs du shell avec des quotes.
4. Utiliser `-F` pour une recherche purement littérale.
5. Vérifier les blancs invisibles avec `cat -A`.
6. Ne pas confondre `grep -c` et nombre d’occurrences.
7. Préférer `-r` à `-R`.
8. Utiliser `cut` seulement si le séparateur est propre.
9. Toujours `sort` avant `uniq` si les doublons ne sont pas déjà regroupés.
10. Utiliser `sort -n` pour les nombres.
11. Tester `sed` sans `-i` avant toute modification.
12. Penser `awk` dès que le traitement porte sur des colonnes complexes.

## À retenir en une phrase

> **`grep` filtre, `cut` extrait, `sort` trie, `uniq` regroupe, `wc` compte, `tr` transforme, `diff` compare, `sed` remplace et `awk` traite les champs.**
