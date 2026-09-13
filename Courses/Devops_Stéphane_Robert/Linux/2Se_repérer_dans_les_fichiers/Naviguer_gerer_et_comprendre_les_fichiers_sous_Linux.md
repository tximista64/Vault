---
title: "Naviguer, gérer et comprendre les fichiers sous Linux"
tags:
  - linux
  - administration-systeme
  - cli
  - fichiers
  - filesystem
  - coreutils
  - inode
  - liens-symboliques
  - liens-physiques
  - sysadmin
aliases:
  - "Gestion des fichiers Linux"
  - "Navigation et liens Linux"
---

# Naviguer, gérer et comprendre les fichiers sous Linux

> [!summary]
> Fiche de synthèse sur la navigation dans le système de fichiers Linux, la manipulation des fichiers et répertoires, l'interprétation de `ls`, l'usage de `file` et `stat`, ainsi que les liens physiques et symboliques.

## 1. Principe général

En ligne de commande, il faut toujours savoir :

1. **où l'on se trouve** ;
2. **ce que l'on manipule** ;
3. **quel sera l'effet de la commande** ;
4. **comment vérifier le résultat**.

Le réflexe central est donc :

```bash
commande
# puis vérification avec pwd, ls, stat, file, find...
```

La règle vaut particulièrement pour `cp`, `mv`, `rm` et `ln`.

---

## 2. Navigation : `pwd`, `cd`, `ls`

### `pwd` — connaître le répertoire courant

```bash
pwd
```

Affiche le répertoire dans lequel le shell travaille actuellement.

À utiliser dès qu'un chemin ou une commande devient ambigu.

---

### `cd` — changer de répertoire

```bash
cd /etc/ssh
cd ..
cd ~
cd
cd -
```

| Commande | Effet |
|---|---|
| `cd /chemin` | aller dans un répertoire |
| `cd ..` | remonter au parent |
| `cd ~` | revenir dans le home |
| `cd` | équivalent de `cd ~` |
| `cd -` | revenir au répertoire précédent |

Après un déplacement important :

```bash
pwd
```

Un fichier ne peut pas être donné à `cd` :

```text
bash: cd: fichier: Not a directory
```

---

## 3. Explorer une arborescence

### `ls`

```bash
ls
```

Affiche le contenu du répertoire courant.

Options principales :

| Option | Effet |
|---|---|
| `-l` | format long |
| `-a` | inclut les fichiers cachés |
| `-h` | tailles lisibles |
| `-t` | trie par `mtime`, récent d'abord |
| `-r` | inverse le tri |
| `-R` | récursif |
| `-S` | trie par taille décroissante |
| `-d` | décrit le répertoire lui-même |
| `-i` | affiche le numéro d'inode |

Combinaisons utiles :

```bash
ls -la
ls -lh
ls -lt
ls -ltr
ls -lah
ls -lhS
```

`-h` est surtout utile avec `-l`.

---

### `find`

`find` permet de parcourir l'arborescence sans dépendre de `tree`.

```bash
find .
find . -type f
find . -type d
find . -type l
```

Il affiche aussi les fichiers cachés.

Exemple :

```bash
find bibliotheque | sort
```

---

## 4. Comprendre `ls -l`

Exemple :

```text
-rw-r--r--  1  root  root  3,3K  mars 15 10:22  sshd_config
```

Lecture :

```text
-rw-r--r--  1  root  root  3,3K  mars 15 10:22  sshd_config
│           │  │     │     │     │                │
│           │  │     │     │     │                └─ nom
│           │  │     │     │     └─ date de modification
│           │  │     │     └─ taille
│           │  │     └─ groupe
│           │  └─ propriétaire
│           └─ nombre de liens
└─ type + permissions
```

Premier caractère :

| Caractère | Type |
|---|---|
| `-` | fichier ordinaire |
| `d` | répertoire |
| `l` | lien symbolique |

### Trois pièges de lecture

- la taille d'un **répertoire** n'est pas la somme de son contenu ;
- la taille d'un **symlink** correspond à la longueur du chemin qu'il stocke ;
- `total` dans `ls -l` représente des **blocs disque**, pas le nombre de fichiers.

---

## 5. `ls -l` ou `ls -ld` ?

```bash
ls -l repertoire
```

liste le **contenu** du répertoire.

```bash
ls -ld repertoire
```

décrit le **répertoire lui-même**.

C'est `ls -ld` qu'il faut utiliser pour vérifier ses permissions, son propriétaire ou son compteur de liens.

---

## 6. Compteur de liens d'un répertoire

Pour un répertoire classique :

```text
nombre de liens = 2 + nombre de sous-répertoires
```

Les deux liens de base correspondent à :

- son nom dans le parent ;
- son propre `.`.

Chaque sous-répertoire ajoute un `..` pointant vers lui.

Ajouter des fichiers ordinaires ne modifie donc pas ce compteur.

---

## 7. Créer des fichiers et des répertoires

### `touch`

```bash
touch fichier.txt
```

- crée un fichier vide s'il n'existe pas ;
- met à jour son horodatage s'il existe déjà.

---

### `mkdir`

```bash
mkdir dossier
mkdir -p projet/src/config
```

`-p` crée les répertoires intermédiaires manquants et évite l'erreur si l'arborescence existe déjà.

---

## 8. Copier avec `cp`

```bash
cp source destination
```

Options importantes :

| Option | Effet |
|---|---|
| `-r` | copie récursive |
| `-p` | conserve permissions, propriétaire et dates |
| `-i` | confirmation avant écrasement |
| `-v` | mode verbeux |
| `-P` | préserve les liens symboliques |
| `-a` | mode archive, conserve notamment les liens |
| `-l` | crée des liens physiques au lieu de copier les données |

Exemple de sauvegarde :

```bash
cp -rp /etc/nginx/ /tmp/nginx-backup/
```

> [!warning]
> `cp` peut écraser une destination existante sans confirmation.

Pour les fichiers importants :

```bash
cp -i source destination
```

---

## 9. Déplacer et renommer avec `mv`

Linux utilise la même commande pour déplacer et renommer :

```bash
mv ancien.conf nouveau.conf
mv fichier.txt dossier/
mv brouillon.txt ~/Documents/rapport-final.txt
```

Options :

```bash
mv -i
mv -n
mv -v
```

- `-i` : demander confirmation ;
- `-n` : ne jamais écraser ;
- `-v` : afficher l'opération.

### Même système de fichiers ou non

Sur le même système de fichiers, `mv` est essentiellement un changement d'entrée de répertoire : l'inode reste identique.

Entre deux systèmes de fichiers, il faut copier puis supprimer : un nouvel inode est créé.

---

## 10. Supprimer avec `rm` et `rmdir`

### `rm`

```bash
rm fichier
rm -r dossier
rm -ri dossier
```

Options :

| Option | Effet |
|---|---|
| `-r` | récursif |
| `-i` | confirmation |
| `-f` | force |
| `-v` | verbeux |

> [!danger]
> Il n'existe pas de corbeille en ligne de commande. `rm` est irréversible.

Avant une suppression importante :

```bash
pwd
ls chemin
```

Puis seulement :

```bash
rm -r chemin
```

Éviter les usages aveugles de :

```bash
rm -rf
```

---

### `rmdir`

```bash
rmdir dossier
```

Ne supprime que les répertoires vides.

C'est volontairement plus sûr que `rm -r`.

---

## 11. Identifier réellement un fichier : `file`

L'extension n'est pas une preuve du contenu.

```bash
file photo.png
file /bin/ls
```

`file` inspecte le contenu et peut révéler qu'un `.png` est en réalité du texte, qu'un fichier est un exécutable ELF, un lien symbolique, etc.

---

## 12. Métadonnées : `stat`

```bash
stat fichier
```

Fournit notamment :

- type ;
- taille ;
- inode ;
- nombre de liens ;
- permissions symboliques et octales ;
- UID/GID ;
- `atime` ;
- `mtime` ;
- `ctime` ;
- éventuellement `Birth`.

Sortie personnalisée :

```bash
stat -c '%n : %F, %s octets, %A (%a), %U:%G, %h lien(s)' fichier
```

---

## 13. `mtime`, `ctime`, `atime`

| Horodatage | Signification | Change lorsque |
|---|---|---|
| `mtime` | modification | le contenu change |
| `ctime` | changement d'état | contenu ou métadonnées changent |
| `atime` | accès | le fichier est lu |

`ls -l` et `ls -lt` utilisent par défaut `mtime`.

Pour trier sur `ctime` :

```bash
ls -ltr --time=ctime
```

> [!note]
> `atime` peut être retardé ou désactivé selon les options de montage (`relatime`, `noatime`). Ce n'est donc pas un journal fiable de lecture.

---

# 14. Inodes : la clé pour comprendre les liens

Un nom de fichier n'est pas le fichier lui-même.

Dans un système de fichiers, une entrée de répertoire associe un **nom** à un **inode**.

```bash
ls -li
```

Exemple :

```text
309333 -rw-r--r-- 1 user user 38 rapport.log
```

`309333` est le numéro d'inode.

L'inode contient notamment :

- type ;
- droits ;
- propriétaire ;
- taille ;
- horodatages ;
- compteur de liens ;
- références vers les données.

Le **nom** est stocké dans le répertoire.

---

# 15. Lien physique — hard link

Création :

```bash
ln rapport.log journal.log
```

Les deux noms pointent vers **le même inode**.

```bash
ls -li rapport.log journal.log
```

On obtient :

- même inode ;
- même contenu ;
- mêmes permissions ;
- même propriétaire ;
- compteur de liens augmenté.

Il n'existe pas de « fichier original » et de « lien secondaire » : les deux noms ont le même statut.

### Conséquence

Modifier via un nom modifie ce que l'autre nom permet de lire :

```bash
echo "ligne" >> journal.log
cat rapport.log
```

Même chose avec les permissions :

```bash
chmod 640 journal.log
ls -l rapport.log journal.log
```

---

## 16. Suppression et compteur de liens

Supprimer un nom :

```bash
rm rapport.log
```

ne détruit pas immédiatement les données si un autre hard link existe.

Le compteur de liens diminue.

Les données ne sont libérées que lorsque plus aucun nom ne référence l'inode.

---

## 17. Limites des liens physiques

### Pas de hard link vers un répertoire

```bash
ln dossier lien
```

échoue généralement avec :

```text
hard link not allowed for directory
```

Cela évite notamment de créer des boucles arbitraires dans l'arborescence.

---

### Pas entre deux systèmes de fichiers

```text
Invalid cross-device link
```

Un inode n'a de sens qu'à l'intérieur de son système de fichiers.

Pour comparer les systèmes concernés :

```bash
df -hT
stat -c '%D %n' fichier
```

---

### La cible doit exister

```bash
ln absent.log copie.log
```

échoue.

Un hard link nécessite un inode existant.

---

### Protection du noyau

Sur un Linux moderne :

```bash
sysctl fs.protected_hardlinks
```

peut empêcher de créer un hard link vers un fichier que l'utilisateur ne possède pas.

Une erreur possible :

```text
Operation not permitted
```

---

# 18. Lien symbolique — symlink

Création :

```bash
ln -s rapport.log courant.log
```

Contrairement au hard link :

- le symlink a **son propre inode** ;
- son type est `l` ;
- il stocke un **chemin** ;
- `ls -l` affiche la cible après `->`.

Exemple :

```text
courant.log -> rapport.log
```

La taille affichée du symlink correspond à la longueur du chemin stocké.

---

## 19. Inspecter un symlink

### `readlink`

```bash
readlink courant.log
```

affiche le chemin stocké.

```bash
readlink -f courant.log
```

résout le chemin final.

---

### `stat` et `stat -L`

```bash
stat courant.log
```

décrit le lien.

```bash
stat -L courant.log
```

décrit la cible.

La plupart des commandes (`cat`, `grep`, `chmod`, etc.) suivent le lien.

---

## 20. Permissions d'un symlink

Les droits affichés comme :

```text
lrwxrwxrwx
```

ne sécurisent pas réellement le symlink.

Ce sont les permissions de la **cible** qui comptent.

```bash
chmod 600 lien
```

agit normalement sur la cible.

---

# 21. Lien symbolique pendant

Si le chemin stocké ne désigne plus rien, le symlink devient **pendant** ou cassé.

Exemple :

```bash
ln -s rapport.log courant.log
mv rapport.log rapport-2026.log
```

Le lien existe toujours, mais sa cible n'existe plus.

Tests :

```bash
test -e courant.log
test -L courant.log
```

- `-e` teste la cible ;
- `-L` teste l'existence du lien lui-même.

Un symlink cassé peut donc donner :

```text
-e faux
-L vrai
```

---

## 22. Rechercher les liens symboliques cassés

```bash
find . -type l
```

tous les liens symboliques.

```bash
find . -xtype l
```

seulement les liens pendants.

Avec affichage de la cible :

```bash
find . -xtype l -printf '%p -> %l\n'
```

---

# 23. Symlink relatif ou absolu

Lien relatif :

```bash
ln -s rapport.log courant.log
```

Lien absolu :

```bash
ln -s /home/user/projet/rapport.log courant.log
```

### Relatif

Le chemin est interprété depuis **le répertoire qui contient le lien**.

Avantage : l'ensemble lien + cible peut être déplacé ou copié ailleurs en conservant sa structure.

Inconvénient : déplacer le lien seul peut le casser.

### Absolu

Le lien continue de fonctionner si le lien seul est déplacé.

En revanche, il casse si l'arborescence entière change d'emplacement ou de point de montage.

---

# 24. Symlink vers un répertoire

Un symlink peut très bien viser un répertoire :

```bash
ln -s stock/archives dernier
```

Attention à la barre oblique finale.

```bash
ls -l dernier
```

décrit le lien.

```bash
ls -l dernier/
```

traverse le lien et liste la cible.

> [!important]
> `lien` et `lien/` ne sont pas toujours équivalents.

---

# 25. Chemin logique et chemin physique

Après :

```bash
cd dernier
```

le shell peut conserver le chemin logique traversé.

```bash
pwd
```

affiche le chemin logique.

```bash
pwd -P
```

affiche le chemin physique après résolution des symlinks.

Pour forcer la navigation physique :

```bash
cd -P dernier
```

Cela change notamment le comportement de `cd ..`.

---

# 26. Repointer un symlink vers un répertoire

Tentant :

```bash
ln -sf nouvelle-cible dernier
```

Mais si `dernier` pointe vers un répertoire, `ln` peut le traverser et créer le nouveau lien **dans le répertoire cible** au lieu de remplacer le symlink.

Le réflexe sûr :

```bash
ln -sfn nouvelle-cible dernier
```

`-n` / `--no-dereference` empêche de traiter le lien de destination comme le répertoire qu'il vise.

Autre méthode sûre :

```bash
rm dernier
ln -s nouvelle-cible dernier
```

---

# 27. Piège critique : supprimer un symlink vers un répertoire

Structure :

```text
lien -> cible/
```

### Correct

```bash
rm lien
```

Supprime seulement le symlink.

```bash
rm -r lien
```

Sans `/` final, GNU `rm` ne traverse pas le lien : le lien seul est supprimé.

### Sans `-r`

```bash
rm lien/
```

refuse normalement car `lien/` est considéré comme un répertoire.

### Dangereux

```bash
rm -r lien/
```

> [!danger]
> La barre oblique force la traversée du symlink. `rm -r` peut alors supprimer récursivement **le contenu de la cible**, puis terminer avec une erreur en essayant de supprimer l'entrée `lien/`.

Donc :

> **Ne jamais mettre de `/` final sur un symlink que l'on veut supprimer.**

Alternative explicite :

```bash
unlink lien
```

`unlink` supprime une entrée de répertoire mais refuse un vrai répertoire.

---

# 28. Retrouver tous les hard links d'un fichier

Les hard links ne sont pas visuellement distinguables dans `ls -l`.

Le compteur de liens indique seulement qu'il existe plusieurs noms.

Méthodes :

```bash
find ~/projet -samefile rapport.log
```

La plus pratique.

Par inode :

```bash
find ~/projet -xdev -inum 309333
```

Tous les fichiers ayant plusieurs noms :

```bash
find ~/projet -type f -links +1 -printf '%n %p\n'
```

---

# 29. Hard links et espace disque

Deux hard links ne sont pas deux copies physiques.

`du` compte normalement l'inode une seule fois.

C'est pourquoi des stratégies de sauvegarde peuvent présenter plusieurs versions d'un fichier via des hard links sans multiplier proportionnellement l'espace disque.

---

# 30. Copier des liens : comportements à connaître

Supposons :

```bash
ln -s source.txt lien.txt
```

### Copie normale

```bash
cp lien.txt clone.txt
```

Suit le symlink et copie le **contenu** dans un nouveau fichier ordinaire.

### Préserver le symlink

```bash
cp -P lien.txt clone.txt
```

ou :

```bash
cp -a lien.txt clone.txt
```

`cp -a` est le bon réflexe pour recopier une arborescence sans dénaturer ses liens.

### Créer un hard link

```bash
cp -l source.txt clone.txt
```

ne copie pas les données : le nouveau nom partage le même inode.

---

# 31. Liens présents partout dans Linux

Exemples typiques :

```bash
ls -l /etc/localtime
readlink -f /etc/localtime
ls -l /usr/bin/python3
```

Les symlinks permettent notamment :

- de sélectionner une version ;
- de présenter un chemin stable ;
- de repointer facilement une configuration.

Pour dérouler toute une chaîne de chemins et de liens :

```bash
namei -l /etc/localtime
```

Des hard links sont aussi utilisés pour donner plusieurs noms au même binaire.

---

# 32. Dépannage rapide

| Symptôme | Cause probable | Réflexe |
|---|---|---|
| `No such file or directory` | mauvais chemin / faute | `pwd`, `ls`, Tab |
| `Not a directory` avec `cd` | cible = fichier | `file`, `ls -ld` |
| `Permission denied` | droits insuffisants | `ls -ld`, `ls -la` |
| `cp: omitting directory` | `-r` absent | `cp -r` |
| `rm: Is a directory` | `rm` sans `-r` | vérifier puis `rm -r` |
| `rmdir: Directory not empty` | contenu présent | `ls -a` |
| fichier absent de `ls` | fichier caché | `ls -a` |
| `ls -lt` ignore un `chmod` | tri sur `mtime` | `stat`, `--time=ctime` |
| extension trompeuse | le nom ne garantit rien | `file` |
| `hard link not allowed for directory` | hard link vers dossier | utiliser symlink |
| `Invalid cross-device link` | hard link entre FS | `df`, `stat -c %D` |
| `Operation not permitted` avec `ln` | protection hardlinks | `sysctl fs.protected_hardlinks` |
| `cat` échoue mais le lien est visible | symlink pendant | `test -L`, `find -xtype l` |
| lien cassé après déplacement | symlink relatif déplacé seul | refaire le lien |
| `ln -sf` ne repointe pas un lien vers dossier | destination déréférencée | `ln -sfn` |
| copie transforme les symlinks en fichiers | `cp` les suit | `cp -a` ou `cp -P` |
| `du` semble trop petit | hard links partagés | vérifier les inodes |

---

# 33. Commandes à retenir

```bash
# Navigation
pwd
cd /chemin
cd ..
cd -
ls -lah
ls -ltr

# Inspection
ls -ld dossier
ls -li fichier
file fichier
stat fichier
readlink lien
readlink -f lien

# Création
touch fichier
mkdir -p chemin/complet

# Copie / déplacement
cp -i source destination
cp -a source destination
mv -i source destination

# Suppression
rm fichier
rm -ri dossier
rmdir dossier-vide
unlink lien

# Recherche
find . -type f
find . -type d
find . -type l
find . -xtype l
find . -samefile fichier

# Liens
ln fichier hardlink
ln -s cible symlink
ln -sfn nouvelle-cible symlink
```

---

# 34. Réflexes sysadmin

1. Faire `pwd` avant une opération sensible.
2. Vérifier avec `ls` ou `find` avant de supprimer.
3. Utiliser `ls -ld` pour examiner **un répertoire**, pas son contenu.
4. Ne jamais se fier uniquement à une extension : utiliser `file`.
5. Utiliser `stat` dès qu'il faut comprendre inode, droits ou horodatages.
6. Sauvegarder une configuration avant modification.
7. Utiliser `-i` ou `-n` quand l'écrasement serait coûteux.
8. Préférer `cp -a` pour copier une arborescence en conservant les liens.
9. Chercher les symlinks cassés avec `find ... -xtype l`.
10. Pour repointer un symlink vers un dossier : `ln -sfn`.
11. Pour supprimer un symlink : **jamais de slash final**.
12. Considérer `rm -rf` comme une commande à vérifier deux fois avant exécution.

---

# 35. Mini-lab de révision

```bash
mkdir -p /tmp/lab-fichiers/{config,backup,logs}
touch /tmp/lab-fichiers/config/app.conf
touch /tmp/lab-fichiers/config/db.conf
touch /tmp/lab-fichiers/logs/app.log

ls -R /tmp/lab-fichiers

cp -rp /tmp/lab-fichiers/config/ \
       /tmp/lab-fichiers/backup/config-2026/

mv /tmp/lab-fichiers/config/app.conf \
   /tmp/lab-fichiers/config/application.conf

rm /tmp/lab-fichiers/logs/app.log
rmdir /tmp/lab-fichiers/logs

rm -r /tmp/lab-fichiers
```

Toujours vérifier le résultat entre les étapes.

---

# 36. Mini-lab sur les liens

```bash
mkdir -p /tmp/lab-liens
cd /tmp/lab-liens

echo "contenu" > source.txt

# hard link
ln source.txt hard.txt
ls -li source.txt hard.txt

# symlink
ln -s source.txt soft.txt
ls -li source.txt soft.txt

# résolution
readlink soft.txt
readlink -f soft.txt

# métadonnées
stat soft.txt
stat -L soft.txt

# casser le symlink
mv source.txt source-old.txt
find . -xtype l

# réparer
mv source-old.txt source.txt

# nettoyage
cd ~
rm -r /tmp/lab-liens
```

---

## À retenir en une phrase

> Sous Linux, les noms vivent dans les répertoires, les métadonnées et les données sont rattachées aux inodes ; un hard link ajoute un nouveau nom au même inode, tandis qu'un symlink est un fichier distinct qui ne stocke qu'un chemin.
