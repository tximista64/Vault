---
title: "Rechercher des fichiers sous Linux"
tags:
  - linux
  - administration-systeme
  - cli
  - fichiers
  - find
  - locate
  - grep
  - recherche
  - bash
  - shell
  - sysadmin
aliases:
  - "Recherche de fichiers Linux"
  - "find locate grep"
---

# Rechercher des fichiers sous Linux

> [!summary]
> Trois outils couvrent l’essentiel :
> - **`find`** cherche en temps réel dans l’arborescence et filtre sur le nom, le type, la taille, l’âge, les permissions ou le propriétaire ;
> - **`locate`** interroge un index, très rapide mais potentiellement périmé ;
> - **`grep`** cherche du texte **dans le contenu** des fichiers.

## 1. `find` — recherche en temps réel

Syntaxe générale :

```bash
find <chemin> <prédicats>
```

Exemple :

```bash
find /etc -name 'sshd_config'
```

`find` descend récursivement par défaut.

### Point de départ

Sans critère :

```bash
find /srv/inventaire
```

affiche tout ce qui est rencontré, y compris le point de départ.

L’ordre n’est pas forcément alphabétique. Pour trier :

```bash
find /srv/inventaire | sort
```

## 2. Chercher par nom

```bash
find /etc -name 'sshd_config'
find /home -iname 'readme.md'
```

`-iname` ignore la casse.

### Toujours protéger les motifs

Correct :

```bash
find . -name '*.csv'
```

À éviter :

```bash
find . -name *.csv
```

Sans guillemets, le shell peut développer `*.csv` avant que `find` ne reçoive la commande.

Erreur typique :

```text
find: paths must precede expression
```

> [!important]
> Avec `find`, prendre l’habitude de toujours écrire les motifs entre quotes.

## 3. `-name` contre `-path`

`-name` ne regarde que le dernier composant du chemin.

Pour filtrer sur tout le chemin :

```bash
find /srv/inventaire -path '*/rapports/*.csv'
```

## 4. Chercher par type

```bash
find /chemin -type f
find /chemin -type d
find /chemin -type l
```

| Valeur | Type |
|---|---|
| `f` | fichier ordinaire |
| `d` | répertoire |
| `l` | lien symbolique |

### Suivre les symlinks

Par défaut, `find` ne traverse pas les symlinks.

```bash
find -L /srv/inventaire -name '*.csv'
```

> [!warning]
> `-L` se place **avant** le chemin et peut provoquer des doublons ou des boucles.

## 5. Chercher par taille

```bash
find /var/log -size +100M
find /tmp -size -1k
```

| Suffixe | Unité |
|---|---|
| `c` | octets |
| `k` | Kio |
| `M` | Mio |
| `G` | Gio |

```text
+N  → strictement plus
-N  → strictement moins
N   → exactement
```

Exemple exact :

```bash
find . -size 2500c
```

### Piège de `-size`

Avec une unité autre que `c`, `find` raisonne par blocs arrondis vers le haut.

Pour une comparaison précise en octets :

```bash
find . -size -1048576c
```

> [!tip]
> `c` est l’unité la plus sûre quand la borne doit être précise.

### Fichiers vides

```bash
find . -type f -empty
```

## 6. Chercher par date de modification

```bash
find /home -mtime -7
find /var/log -mtime +30
```

`-mtime` travaille par tranches de 24 heures, pas par jours calendaires.

```text
-mtime -7  → âge tronqué < 7
-mtime 7   → âge tronqué = 7
-mtime +7  → âge tronqué > 7
```

Donc `-mtime -7` et `-mtime +7` ne sont pas complémentaires.

Pour le vrai complément :

```bash
find . -not -mtime -7
```

Granularité en minutes :

```bash
find . -mmin -180
```

Comparaison avec un fichier de référence :

```bash
find . -newer fichier-reference
```

## 7. Chercher par propriétaire

```bash
find /srv -user camille
find /srv -group admins
```

Fichiers orphelins :

```bash
find /srv -nouser
find /srv -nogroup
```

## 8. Chercher par permissions

Trois syntaxes :

```bash
-perm 644
-perm -644
-perm /644
```

| Syntaxe | Sens |
|---|---|
| `-perm 644` | mode exactement égal à 644 |
| `-perm -644` | tous les bits de 644 sont présents |
| `-perm /644` | au moins un des bits est présent |

World-writable :

```bash
find /srv -type f -perm -002
```

SUID :

```bash
find /usr/bin -type f -perm -4000
```

Notation symbolique :

```bash
find . -perm -u=x
find . -perm -g=w
```

## 9. Combiner les critères

Deux tests successifs sont reliés par un **ET implicite**.

```bash
find /var/log -type f -name '*.log' -size +10M
```

### OU logique

```bash
find . -type f \( -name '*.csv' -o -name '*.sh' \)
```

Les parenthèses sont importantes.

### Négation

```bash
find . -type f -not -name '*.csv'
```

ou :

```bash
find . -type f ! -name '*.csv'
```

## 10. Limiter la profondeur

```bash
find /srv -maxdepth 1 -type f
find /srv -mindepth 2
```

> [!tip]
> Mettre les options globales comme `-maxdepth` avant les tests.

## 11. Exclure une branche avec `-prune`

```bash
find /srv/inventaire \
  -path /srv/inventaire/sauvegardes -prune \
  -o -type f -print
```

Le `-print` final est nécessaire ici.

## 12. Masquer les erreurs de permission

```bash
find /etc -name 'shadow' 2>/dev/null
```

`2>` redirige la sortie d’erreur.

## 13. Agir sur les résultats avec `-exec`

Une commande par fichier :

```bash
find . -type f -name '*.csv' -exec wc -c {} \;
```

Plusieurs fichiers passés d’un coup :

```bash
find . -type f -name '*.csv' -exec wc -c {} +
```

| Terminaison | Comportement |
|---|---|
| `\;` | une commande par résultat |
| `+` | regroupe plusieurs chemins dans une commande |

Préférer `+` quand la commande accepte plusieurs arguments.

## 14. Espaces dans les noms de fichiers

À éviter :

```bash
for f in $(find . -type f); do
  echo "$f"
done
```

Forme robuste :

```bash
find . -type f -print0 | xargs -0 ...
```

Encore mieux lorsque possible :

```bash
find . -type f -exec commande {} +
```

## 15. Affichage personnalisé

```bash
find . -type f -printf '%8s  %TY-%Tm-%Td  %m  %-8u  %p\n'
```

| Format | Valeur |
|---|---|
| `%s` | taille |
| `%m` | mode octal |
| `%u` | propriétaire |
| `%p` | chemin |
| `%TY-%Tm-%Td` | date de modification |

Affichage détaillé intégré :

```bash
find . -type f -name '*.bak' -ls
```

## 16. Supprimer avec `find`

Toujours procéder en deux temps.

D’abord vérifier :

```bash
find /tmp/bac -type f -name '*.tmp'
```

Puis seulement :

```bash
find /tmp/bac -type f -name '*.tmp' -delete
```

### Piège critique : ordre de `-delete`

Correct :

```bash
find /tmp/bac -type f -name '*.tmp' -delete
```

Dangereux :

```bash
find /tmp/bac -delete -name '*.tmp'
```

> [!danger]
> `find` évalue de gauche à droite.  
> **`-delete` se place toujours en dernier.**

Avec confirmation :

```bash
find . -type f -name '*.tmp' -ok rm {} \;
```

## 17. `locate` — recherche instantanée

```bash
locate sshd_config
locate -i readme
```

Installation typique :

```bash
sudo apt install plocate
```

ou :

```bash
sudo dnf install plocate
```

Mise à jour :

```bash
sudo updatedb
```

Un fichier récent peut ne pas apparaître tant que l’index n’est pas mis à jour.

> [!important]
> Si la fraîcheur compte, utiliser `find`.

## 18. `grep` — chercher dans le contenu

```bash
grep 'Port' /etc/ssh/sshd_config
grep -i 'port' fichier
grep -n 'PermitRootLogin' /etc/ssh/sshd_config
grep 'error' /var/log/*.log
grep -r 'AllowUsers' /etc/ssh/
```

Inverser la sélection :

```bash
grep -v '^#' fichier
```

Retirer commentaires et lignes vides :

```bash
grep -v '^#' fichier | grep -v '^$'
```

Afficher seulement les fichiers correspondants :

```bash
grep -l 'motif' *.conf
```

## 19. Combiner `find` et `grep`

```bash
find /srv -type f -name '*.sh' \
  -exec grep -Hn 'echo' {} +
```

`find` filtre sur les propriétés système, `grep` sur le contenu.

## 20. Quelle commande choisir ?

| Besoin | Commande |
|---|---|
| fichier par nom, résultat à jour | `find` |
| fichier par nom, très rapide | `locate` |
| filtrer par taille/type/date/droits/proprio | `find` |
| chercher du texte | `grep` |
| texte dans une arborescence | `grep -r` |
| critères système + contenu | `find ... -exec grep ...` |

## 21. Dépannage rapide

| Symptôme | Cause probable | Solution |
|---|---|---|
| `paths must precede expression` | glob non quoté | quotes autour du motif |
| rien avec `-name` contenant `/` | mauvais prédicat | utiliser `-path` |
| résultat surprenant avec `-size` | arrondi de bloc | utiliser `c` |
| trou entre `-mtime -N` et `+N` | tranche `N` | tester `-mtime N` |
| `-perm` renvoie trop peu | mode exact | `-perm -mode` |
| `-perm` renvoie trop | `/mode` trop large | `-perm -mode` |
| `-type f` semble ignoré | `-o` sans parenthèses | grouper avec `\(...\)` |
| beaucoup de `Permission denied` | droits insuffisants | `2>/dev/null` |
| espaces cassés dans une boucle | mauvaise séparation | `-print0` / `xargs -0` |
| symlink absent de `-type f` | normal | `-type l` ou `-L` |
| `-prune` n’affiche rien | `-print` manquant | ajouter `-print` |
| `locate` ne voit pas un fichier récent | index ancien | `updatedb` ou `find` |
| trop de résultats | recherche trop large | préciser le chemin ou `-maxdepth` |

## 22. Commandes à retenir

```bash
find /etc -name 'sshd_config'
find /home -iname 'readme.md'

find . -type f
find . -type d
find . -type l

find . -path '*/rapports/*.csv'

find . -size +100M
find . -size -1048576c
find . -empty

find . -mtime -7
find . -mmin -180
find . -newer reference

find . -user user
find . -nouser

find . -perm -002
find /usr/bin -perm -4000

find . -type f \( -name '*.csv' -o -name '*.sh' \)

find . -path './cache' -prune -o -type f -print

find . -type f -name '*.tmp' -delete
find . -type f -exec wc -c {} +

find . -type f -print0 | xargs -0 ...

locate fichier
sudo updatedb

grep -in 'motif' fichier
grep -r 'motif' /chemin
```

## 23. Réflexes sysadmin

1. Quoter systématiquement les motifs de `find`.
2. Utiliser `-path` dès que le motif concerne plusieurs niveaux.
3. Préférer `c` pour les comparaisons de taille exactes.
4. Se souvenir que `-mtime` raisonne en blocs de 24 h.
5. Grouper les expressions avec `\(...\)` autour de `-o`.
6. Mettre les options globales avant les tests.
7. Préférer `-exec ... +` à `\;` quand possible.
8. Éviter `$(find ...)` pour les noms contenant des espaces.
9. Tester une recherche avant d’ajouter une action destructive.
10. Toujours mettre `-delete` **en dernier**.
11. Utiliser `find` quand la fraîcheur du résultat est critique.
12. Utiliser `grep` lorsque le critère porte sur le contenu, pas sur le nom.

## À retenir en une phrase

> **`find` cherche ce qu’est un fichier et où il se trouve, `locate` cherche vite dans un index, et `grep` cherche ce qu’un fichier contient.**
