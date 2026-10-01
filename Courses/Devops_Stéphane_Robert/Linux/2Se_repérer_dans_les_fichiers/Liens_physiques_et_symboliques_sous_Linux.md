---
title: "Liens physiques et symboliques sous Linux"
tags:
  - linux
  - administration-systeme
  - cli
  - fichiers
  - inode
  - liens-physiques
  - liens-symboliques
  - filesystem
  - bash
  - sysadmin
aliases:
  - "Hard links et symlinks"
  - "Liens Linux"
---

# Liens physiques et symboliques sous Linux

> [!summary]
> Sous Linux, un nom de fichier n'est qu'une entrée de répertoire pointant vers un **inode**.  
> Un **lien physique** ajoute un autre nom vers le même inode ; un **lien symbolique** est un fichier distinct qui contient simplement un chemin vers une cible.

---

## 1. Un fichier n'est pas son nom

Le contenu, les permissions, les dates et le propriétaire sont associés à une structure appelée **inode**.

Le nom du fichier, lui, est stocké dans un répertoire et pointe vers cet inode.

```bash
ls -li rapport.txt
```

Exemple :

```text
8591538 -rw-r--r-- 1 user user 17 rapport.txt
```

À retenir :

- première colonne : numéro d'inode ;
- nombre après les permissions : compteur de liens ;
- le nom du fichier n'est pas l'inode lui-même.

> Deux noms peuvent donc désigner exactement le même inode.

---

# 2. Lien physique — hard link

Création :

```bash
ln rapport.txt rapport-copie.txt
```

Vérification :

```bash
ls -li rapport.txt rapport-copie.txt
```

Les deux fichiers ont :

- le même inode ;
- le même contenu ;
- les mêmes permissions ;
- le même propriétaire ;
- un compteur de liens supérieur.

Exemple conceptuel :

```text
8591538 ... 2 rapport.txt
8591538 ... 2 rapport-copie.txt
```

Il ne s'agit **pas d'une copie**.

---

## Modifier un hard link

Si l'on écrit via l'un des noms :

```bash
echo "ligne ajoutee" >> rapport-copie.txt
```

on retrouve la modification via l'autre :

```bash
cat rapport.txt
```

car les deux noms désignent le même fichier réel.

---

## Supprimer un hard link

```bash
rm rapport.txt
```

supprime uniquement **un nom**.

Le compteur de liens diminue.

Les données restent accessibles tant qu'au moins un nom référence encore l'inode.

> [!important]
> `rm` retire une entrée de répertoire. Les données ne sont réellement libérées que lorsque le compteur de liens tombe à zéro et qu'aucun processus ne garde le fichier ouvert.

---

# 3. Retrouver les différents noms d'un inode

Afficher inode et compteur :

```bash
stat -c 'liens=%h inode=%i' fichier
```

Chercher un inode précis :

```bash
find ~/lab-liens -inum 8591547
```

Chercher tous les fichiers possédant plusieurs noms :

```bash
find /home -type f -links +1
```

---

# 4. Limites des liens physiques

## Impossible vers un répertoire

```bash
ln dossier dossier-lien
```

renvoie typiquement :

```text
hard link not allowed for directory
```

Cela évite notamment la création de boucles arbitraires dans l'arborescence.

---

## Impossible entre deux systèmes de fichiers

```bash
ln ~/rapport.txt /dev/shm/essai
```

peut produire :

```text
Invalid cross-device link
```

Un numéro d'inode n'est valable qu'à l'intérieur de son propre système de fichiers.

### Conséquence

Hard link :

```text
même système de fichiers uniquement
```

Symlink :

```text
peut traverser les systèmes de fichiers
```

---

# 5. Lien symbolique — symlink

Création :

```bash
ln -s cible.txt raccourci.txt
```

Inspection :

```bash
ls -li cible.txt raccourci.txt
```

Le symlink possède :

- son propre inode ;
- le type `l` ;
- une flèche `->` dans `ls -l` ;
- comme contenu, un chemin vers la cible.

Exemple :

```text
8591540 -rw-r--r-- 1 user user 8 cible.txt
8591541 lrwxrwxrwx 1 user user 9 raccourci.txt -> cible.txt
```

---

## Taille d'un symlink

La taille affichée correspond généralement à la longueur du chemin stocké.

Pour :

```text
cible.txt
```

la taille vaut ici 9 caractères.

Le symlink ne contient donc pas les données du fichier cible.

---

# 6. Pourquoi les symlinks sont plus courants

Ils peuvent :

- pointer vers des répertoires ;
- traverser plusieurs systèmes de fichiers ;
- être redirigés facilement ;
- fournir un chemin stable vers une version variable.

Exemple classique :

```bash
ln -sfn /opt/app-2.4.1 /opt/app-courante
```

Les scripts peuvent ensuite toujours utiliser :

```text
/opt/app-courante
```

sans connaître la version réelle.

---

# 7. Inspecter un lien symbolique

Voir la cible telle qu'elle est enregistrée :

```bash
readlink lien
```

Résoudre tous les liens jusqu'à la destination finale :

```bash
readlink -f lien
```

Bon réflexe après :

```bash
ln -s ...
```

---

# 8. Lien symbolique brisé

Si la cible est supprimée ou déplacée :

```bash
rm cible.txt
```

le symlink reste présent :

```bash
ls -l raccourci.txt
```

mais :

```bash
cat raccourci.txt
```

échoue :

```text
No such file or directory
```

Le lien est alors **brisé** ou **pendant**.

---

## Distinguer lien existant et cible existante

```bash
test -e raccourci.txt
```

teste la cible.

```bash
test -L raccourci.txt
```

teste le lien lui-même.

Pour un symlink cassé :

```text
-e → faux
-L → vrai
```

---

## Chercher les liens cassés

```bash
find /opt -xtype l
```

Très utile après :

- migration ;
- désinstallation ;
- changement de version ;
- déplacement d'arborescence.

---

# 9. Hard link ou symlink ?

| Critère | Lien physique | Lien symbolique |
|---|---|---|
| Inode | même inode que la cible | inode propre |
| Répertoire | impossible | possible |
| Autre filesystem | impossible | possible |
| Si la cible est supprimée | données survivent | lien cassé |
| Visible avec `ls -l` | ressemble à un fichier normal | `l` + `->` |
| Usage | sauvegarde, déduplication | raccourcis, versions, configuration |

En administration courante, le lien symbolique est généralement le choix le plus pratique.

---

# 10. Piège critique : `rm -r lien/`

Supposons :

```text
lien-dir -> cible-dir/
```

Commande dangereuse :

```bash
rm -r lien-dir/
```

> [!danger]
> La barre oblique finale force la traversée du lien. `rm` peut vider récursivement le répertoire cible avant d'échouer avec :
>
> ```text
> Not a directory
> ```

Le code retour peut être `1`, tout en ayant déjà supprimé les données.

---

## Comparaison

| Commande | Effet sur la cible |
|---|---|
| `rm lien-dir` | cible intacte |
| `rm -r lien-dir` | cible intacte |
| `rm lien-dir/` | refus, cible intacte |
| `rm -r lien-dir/` | **contenu de la cible supprimé** |

### Règle

> **Ne jamais mettre de `/` final sur un symlink que l'on veut supprimer.**

Pour supprimer explicitement des liens :

```bash
find /chemin -maxdepth 1 -type l -delete
```

ou :

```bash
unlink lien
```

---

# 11. Piège : `ln -sf` sur un lien vers un répertoire

Situation :

```bash
ln -s v1 courant
ln -sf v2 courant
```

On pourrait s'attendre à ce que :

```text
courant -> v2
```

Mais si `courant` pointe vers un répertoire, `ln` peut traverser le lien et créer `v2` **dans le répertoire cible**.

Le code retour peut pourtant être `0`.

---

## Forme sûre

```bash
ln -sfn v2 courant
```

`-n` signifie :

```text
--no-dereference
```

et empêche de considérer la destination comme le répertoire qu'elle vise.

> [!tip]
> Pour rediriger un symlink existant, retenir :
>
> ```bash
> ln -sfn nouvelle-cible lien
> ```

---

# 12. `chmod` sur un symlink

Les liens symboliques apparaissent généralement comme :

```text
lrwxrwxrwx
```

Sous Linux, ces permissions ne contrôlent pas l'accès à la cible.

```bash
chmod -h 600 lien
```

peut même retourner un succès sans rien changer.

Ce qui compte réellement :

- permissions de la cible ;
- permissions du répertoire contenant le lien.

---

# 13. `cp` suit les symlinks par défaut

Commande :

```bash
cp lien.txt copie.txt
```

crée généralement un **fichier normal** contenant les données de la cible.

Tester :

```bash
test -L copie.txt
```

retournera faux.

---

## Préserver le lien

```bash
cp -d lien.txt copie.txt
```

ou :

```bash
cp -a lien.txt copie.txt
```

Pour une arborescence complète, préférer :

```bash
cp -a source destination
```

afin de préserver les liens.

---

# 14. Sécurité noyau

Linux possède notamment :

```bash
sysctl fs.protected_hardlinks
sysctl fs.protected_symlinks
```

Sur les distributions modernes :

```text
fs.protected_hardlinks = 1
fs.protected_symlinks = 1
```

Ces mécanismes protègent notamment les répertoires partagés comme `/tmp`.

---

## `fs.protected_hardlinks`

Empêche notamment de créer un hard link vers un fichier :

- appartenant à un autre utilisateur ;
- et pour lequel on ne possède pas les droits requis.

Erreur possible :

```text
Operation not permitted
```

### Réflexe

Vérifier :

```bash
ls -l cible
sysctl fs.protected_hardlinks
```

> [!warning]
> Ne pas désactiver ces protections juste pour contourner une erreur de `ln`.

---

# 15. Inspecter les liens dans une arborescence

Tous les symlinks :

```bash
find /opt -type l
```

Symlinks cassés :

```bash
find /opt -xtype l
```

Fichiers avec plusieurs hard links :

```bash
find /home -type f -links +1
```

Suivre les symlinks :

```bash
find -L /opt -type f
```

> [!important]
> `-L` est une option globale de `find` et doit être placée **avant le chemin**.

Incorrect :

```bash
find /opt -L -type f
```

Correct :

```bash
find -L /opt -type f
```

---

# 16. Dépannage rapide

| Symptôme | Cause probable | Solution |
|---|---|---|
| `No such file or directory` mais le lien apparaît | lien cassé | `readlink -f` |
| lien cassé après déplacement | chemin relatif devenu invalide | recréer le lien |
| `hard link not allowed for directory` | hard link vers dossier | `ln -s` |
| `Invalid cross-device link` | hard link entre filesystems | `ln -s` |
| `Operation not permitted` avec `ln` | protection hardlinks | vérifier propriétaire et sysctl |
| `ln -sf` retourne 0 mais ne change rien | symlink vers dossier | `ln -sfn` |
| contenu d'un dossier disparu | `rm -r lien/` | restaurer la sauvegarde |
| `chmod` ne change rien sur un symlink | permissions du lien ignorées | modifier la cible |
| copie beaucoup plus grosse | symlinks suivis | `cp -a` ou `cp -d` |

---

# 17. Commandes à retenir

```bash
# Inodes
ls -li fichier
stat -c 'liens=%h inode=%i' fichier

# Hard link
ln fichier nouveau-nom

# Symlink
ln -s cible lien

# Rediriger un symlink
ln -sfn nouvelle-cible lien

# Inspecter
readlink lien
readlink -f lien

# Liens cassés
find /opt -xtype l

# Tous les symlinks
find /opt -type l

# Hard links multiples
find /home -type f -links +1

# Préserver les symlinks à la copie
cp -a source destination

# Supprimer un symlink
unlink lien
```

---

# 18. Réflexes sysadmin

1. Vérifier un lien avec `ls -li`.
2. Utiliser `readlink` juste après `ln -s`.
3. Chercher les liens cassés avec `find -xtype l`.
4. Utiliser `ln -sfn` pour repointer un symlink.
5. Ne jamais écrire `rm -r lien/`.
6. Préférer `cp -a` pour conserver les liens.
7. Ne pas tenter de protéger un symlink via ses permissions.
8. Ne pas désactiver `fs.protected_hardlinks`.
9. Penser « inode » dès qu'un fichier semble avoir plusieurs noms.
10. Penser « chemin stocké » dès qu'un symlink casse après déplacement.

---

## À retenir en une phrase

> Un **hard link** est un autre nom pour le même inode ; un **symlink** est un fichier distinct qui contient un chemin vers une cible.
