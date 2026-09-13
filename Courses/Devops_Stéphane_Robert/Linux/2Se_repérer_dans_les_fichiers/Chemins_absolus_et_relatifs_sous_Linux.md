---
title: "Chemins absolus et relatifs sous Linux"
tags:
  - linux
  - administration-systeme
  - cli
  - fichiers
  - navigation
  - chemins
  - bash
  - shell
  - sysadmin
aliases:
  - "Chemins Linux"
  - "Chemins absolus et relatifs"
---

# Chemins absolus et relatifs sous Linux

> [!summary]
> Sous Linux, toute commande qui manipule un fichier ou un répertoire doit résoudre un **chemin**. Un chemin absolu part de la racine `/`, tandis qu'un chemin relatif est interprété depuis le répertoire courant donné par `pwd`.

---

## 1. Chemin absolu

Un **chemin absolu** commence toujours par `/`.

Exemples :

```text
/etc/ssh/sshd_config
/var/log/syslog
/home/bob/Documents/rapport.txt
/usr/bin/ls
```

Il désigne toujours le même emplacement, quel que soit le répertoire courant.

```bash
cat /etc/hostname
```

fonctionnera depuis :

```text
/home/bob
/tmp
/var/log
```

### Règle à retenir

> **Un chemin qui commence par `/` est absolu.**

---

## 2. Chemin relatif

Un **chemin relatif** ne commence pas par `/`.

Il est interprété à partir du **répertoire courant**.

Exemple :

```bash
cd /etc/ssh
cat sshd_config
```

Ici :

```text
sshd_config
```

est résolu comme :

```text
/etc/ssh/sshd_config
```

Si l'on change de répertoire :

```bash
cd /tmp
cat sshd_config
```

on obtient probablement :

```text
cat: sshd_config: No such file or directory
```

car le shell cherche alors :

```text
/tmp/sshd_config
```

### Réflexe

En cas de doute :

```bash
pwd
```

---

# 3. Les raccourcis de chemin

| Symbole | Signification | Exemple |
|---|---|---|
| `.` | répertoire courant | `./script.sh` |
| `..` | répertoire parent | `cd ..` |
| `~` | répertoire personnel | `cd ~` |
| `-` | répertoire précédent avec `cd` | `cd -` |

---

## 4. `.` — le répertoire courant

Le point signifie **ici**.

### Exécuter un fichier présent dans le répertoire courant

```bash
./script.sh
```

### Copier vers le répertoire courant

```bash
cp /etc/hostname .
```

Exemple :

```bash
cd /tmp
cp /etc/hostname .
ls hostname
```

Le fichier est copié dans :

```text
/tmp/hostname
```

---

# 5. `..` — le répertoire parent

Le double point désigne le répertoire situé un niveau au-dessus.

Exemple :

```bash
pwd
```

```text
/var/log/nginx
```

Puis :

```bash
cd ..
pwd
```

donne :

```text
/var/log
```

---

## Remonter plusieurs niveaux

Les `..` peuvent être chaînés :

```bash
cd ../../etc
```

Depuis :

```text
/var/log
```

le shell résout :

```text
/var/log
→ /var
→ /
→ /etc
```

Résultat :

```text
/etc
```

---

# 6. `~` — le répertoire personnel

Le tilde représente le **home** de l'utilisateur courant.

Pour l'utilisateur `bob` :

```text
~ = /home/bob
```

Exemples :

```bash
cd ~
ls ~/.bashrc
cp fichier.txt ~/
mkdir -p ~/Projets/lab-linux
cat ~/.ssh/authorized_keys
```

Le tilde fonctionne avec de nombreuses commandes, pas seulement `cd`.

---

## Attention dans les scripts

Dans un script shell, le tilde n'est pas toujours expansé selon la manière dont il est utilisé, notamment s'il est placé entre guillemets.

Préférer :

```bash
$HOME
```

Exemple :

```bash
cp fichier "$HOME/backup/"
```

plutôt que de dépendre de :

```bash
"~/backup/"
```

---

# 7. `cd -` — revenir au répertoire précédent

Exemple :

```bash
cd /etc/ssh
cd /var/log
cd -
```

Résultat :

```text
/etc/ssh
```

Très pratique lorsque l'on alterne entre deux répertoires.

---

# 8. Absolu ou relatif : lequel choisir ?

| Situation | À préférer | Pourquoi |
|---|---|---|
| fichier système | absolu | emplacement explicite |
| configuration système | absolu | pas d'ambiguïté |
| script automatisé | absolu | indépendant du répertoire courant |
| documentation | absolu | clair pour le lecteur |
| fichiers proches | relatif | plus court |
| navigation interactive | relatif | rapide à taper |

---

# 9. Le piège des scripts

Un chemin relatif dépend du répertoire depuis lequel le script est lancé.

Fragile :

```bash
cp config.yaml /tmp/
```

Si le script est exécuté depuis un autre répertoire, `config.yaml` peut ne pas être trouvé.

Plus robuste :

```bash
cp /opt/mon-app/config.yaml /tmp/
```

> [!important]
> Pour les chemins importants utilisés dans des scripts automatisés, privilégier des chemins dont la base est explicitement maîtrisée.

---

# 10. Comment le shell résout un chemin

On peut retenir la logique suivante :

1. commence par `/` → chemin absolu ;
2. commence par `~` → expansion vers le home ;
3. sinon → chemin relatif au répertoire courant.

Depuis :

```text
/home/bob/Projets
```

on obtient :

| Saisie | Résolution |
|---|---|
| `/etc/hosts` | `/etc/hosts` |
| `~/Documents/note.txt` | `/home/bob/Documents/note.txt` |
| `README.md` | `/home/bob/Projets/README.md` |
| `./src/main.py` | `/home/bob/Projets/src/main.py` |
| `../Documents` | `/home/bob/Documents` |
| `../../etc` | `/etc` |

---

# 11. Lire mentalement un chemin relatif

Depuis :

```text
/home/alice/scripts/
```

le chemin :

```text
../data/2024/report.csv
```

se lit :

```text
/home/alice/scripts
        ↓ ..
/home/alice
        ↓ data
/home/alice/data
        ↓ 2024
/home/alice/data/2024
        ↓ report.csv
/home/alice/data/2024/report.csv
```

Donc :

```text
START  : /home/alice/scripts/
TARGET : /home/alice/data/2024/report.csv
```

Réponse relative :

```text
../data/2024/report.csv
```

> [!warning]
> Ajouter un `/` au début changerait complètement le sens :
>
> ```text
> /../data/2024/report.csv
> ```
>
> est interprété depuis la racine et revient en pratique à chercher sous `/data/...`, pas sous `/home/alice/...`.

---

# 12. `./script.sh` et `$PATH`

Pourquoi utilise-t-on :

```bash
./script.sh
```

et pas simplement :

```bash
script.sh
```

?

Parce que lorsqu'une commande ne contient pas `/`, le shell la recherche normalement dans les répertoires de :

```bash
$PATH
```

Le répertoire courant `.` n'y figure généralement pas.

Avec :

```bash
./script.sh
```

on indique explicitement :

> exécute le fichier `script.sh` situé dans le répertoire courant.

---

# 13. Chemin de fichier ou chemin de répertoire

`cd` ne fonctionne que sur un répertoire.

Incorrect :

```bash
cd /etc/ssh/sshd_config
```

Résultat :

```text
Not a directory
```

Pour vérifier :

```bash
ls -ld /etc/ssh/sshd_config
```

ou :

```bash
file /etc/ssh/sshd_config
```

---

# 14. Dépannage rapide

| Symptôme | Cause probable | Réflexe |
|---|---|---|
| `No such file or directory` | mauvais chemin relatif | `pwd` |
| erreur avec chemin absolu | faute de frappe | utiliser Tab |
| `Not a directory` | cible = fichier | `ls -ld` |
| `./script.sh: Permission denied` | fichier non exécutable | `chmod +x` |
| `~` non développé | usage dans une chaîne ou script | utiliser `$HOME` |
| même nom mais fichier différent | changement de répertoire courant | vérifier `pwd` |

---

# 15. Commandes à retenir

```bash
# Où suis-je ?
pwd

# Aller à un emplacement absolu
cd /var/log

# Remonter
cd ..

# Remonter plusieurs niveaux
cd ../..

# Retour au home
cd ~

# Répertoire précédent
cd -

# Exécuter depuis le répertoire courant
./script.sh

# Copier vers ici
cp /etc/hostname .

# Utiliser le home
ls ~/.ssh
mkdir -p ~/Projets/lab-linux
```

---

# 16. Mini-lab

```bash
# Vérifier la position
pwd

# Navigation absolue
cd /var/log
pwd

# Navigation relative
cd ../../etc
pwd

# Home
cd ~
pwd

# Deux copies du même fichier
cp /etc/hostname /tmp/hostname-absolu

cd /etc
cp hostname /tmp/hostname-relatif

# Vérification
diff /tmp/hostname-absolu /tmp/hostname-relatif
```

Si `diff` ne produit aucune sortie, les fichiers sont identiques.

---

# 17. Test rapide

Depuis :

```text
/home/alice/scripts/
```

vers :

```text
/home/alice/data/2024/report.csv
```

le chemin relatif est :

```text
../data/2024/report.csv
```

Depuis :

```text
/home/alice/scripts/tools/
```

vers le même fichier :

```text
../../data/2024/report.csv
```

Depuis :

```text
/home/alice/
```

vers :

```text
/home/alice/data/2024/report.csv
```

le chemin relatif est :

```text
data/2024/report.csv
```

---

# 18. Réflexes sysadmin

1. Utiliser `pwd` avant toute opération sensible.
2. Lire un chemin de gauche à droite.
3. Un `/` initial signifie **racine**, pas « commence le chemin ».
4. Sans `/` initial, penser **répertoire courant**.
5. Utiliser Tab pour éviter les fautes de frappe.
6. Préférer un chemin explicite dans les scripts.
7. Utiliser `$HOME` lorsque l'expansion de `~` pourrait être ambiguë.
8. Vérifier qu'une cible est bien un répertoire avant `cd`.
9. Ne pas confondre `.` avec `..`.
10. Toujours vérifier le résultat d'une commande importante.

---

## À retenir en une phrase

> Un chemin absolu indique **où se trouve la cible depuis `/`** ; un chemin relatif indique **comment rejoindre la cible depuis l'endroit où l'on se trouve actuellement**.
