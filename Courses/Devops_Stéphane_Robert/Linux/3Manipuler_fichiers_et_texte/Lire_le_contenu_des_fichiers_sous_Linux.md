---
title: "Lire le contenu des fichiers sous Linux"
tags:
  - linux
  - administration-systeme
  - cli
  - fichiers
  - logs
  - bash
  - shell
  - sysadmin
  - cat
  - less
  - head
  - tail
aliases:
  - "Lecture de fichiers Linux"
  - "cat less head tail"
---

# Lire le contenu des fichiers sous Linux

> [!summary]
> Quatre commandes couvrent l'essentiel de la lecture de fichiers sous Linux :
> **`cat`** pour afficher, **`less`** pour parcourir, **`head`** pour lire le début et **`tail`** pour lire la fin.  
> Pour suivre un log en temps réel, utiliser **`tail -f`**.

---

# 1. `cat` — afficher un fichier entier

`cat` affiche directement tout le contenu d'un fichier.

```bash
cat /etc/hostname
```

Exemple :

```text
srv-debian
```

À privilégier pour les fichiers courts.

---

## Numéroter les lignes

```bash
cat -n /etc/ssh/sshd_config
```

Exemple :

```text
     1  # This is the sshd server system-wide configuration file.
     2  #
     3  Include /etc/ssh/sshd_config.d/*.conf
     4  #Port 22
```

Utile pour :

- se repérer dans une configuration ;
- citer une ligne ;
- comparer rapidement un fichier.

---

## Concaténer plusieurs fichiers

```bash
cat fichier1.txt fichier2.txt
```

`cat` affiche les contenus à la suite.

Son nom vient de **concatenate**.

---

## Quand éviter `cat`

Pour un fichier de plusieurs centaines ou milliers de lignes :

```bash
cat gros-fichier.log
```

peut noyer le terminal.

Préférer :

```bash
less gros-fichier.log
```

---

# 2. `less` — parcourir un fichier long

```bash
less /var/log/syslog
```

`less` ouvre le fichier dans un afficheur interactif.

Il est adapté aux :

- logs ;
- grosses configurations ;
- fichiers très longs ;
- fichiers de plusieurs Go.

---

## Touches utiles dans `less`

| Touche | Action |
|---|---|
| `Espace` | page suivante |
| `f` | page suivante |
| `b` | page précédente |
| `g` | début du fichier |
| `G` | fin du fichier |
| `/mot` | chercher vers le bas |
| `?mot` | chercher vers le haut |
| `n` | occurrence suivante |
| `q` | quitter |

Exemple de recherche :

```text
/error
```

puis :

```text
n
```

pour passer à l'occurrence suivante.

---

## Pourquoi `less` est adapté aux gros fichiers

`less` ne charge pas nécessairement l'intégralité du fichier en mémoire avant l'affichage.

Il peut donc ouvrir rapidement des fichiers volumineux.

> [!tip]
> En cas de doute sur la taille d'un fichier, commencer par :
>
> ```bash
> less fichier
> ```

---

# 3. `more` — l'ancien outil

```bash
more fichier
```

`more` remplit un rôle proche de `less`, mais avec moins de possibilités de navigation.

En pratique :

> **Retenir surtout `less`.**

---

# 4. `head` — lire le début d'un fichier

Par défaut :

```bash
head fichier
```

affiche les **10 premières lignes**.

Exemple :

```bash
head /etc/passwd
```

---

## Choisir le nombre de lignes

```bash
head -n 5 /etc/passwd
```

affiche seulement les 5 premières lignes.

Syntaxe générale :

```bash
head -n N fichier
```

---

## Cas d'usage

Très pratique pour vérifier rapidement :

- le format d'un CSV ;
- les en-têtes d'un fichier ;
- le début d'une configuration ;
- la structure d'un export.

Exemple :

```bash
head -n 5 fichier.csv
```

---

# 5. `tail` — lire la fin d'un fichier

Par défaut :

```bash
tail fichier
```

affiche les **10 dernières lignes**.

Exemple :

```bash
tail /var/log/syslog
```

---

## Choisir le nombre de lignes

```bash
tail -n 20 /var/log/syslog
```

Syntaxe générale :

```bash
tail -n N fichier
```

---

# 6. `tail -f` — suivre un log en temps réel

```bash
tail -f /var/log/syslog
```

`-f` signifie **follow**.

La commande reste ouverte et affiche les nouvelles lignes au fur et à mesure qu'elles sont ajoutées.

C'est une commande essentielle pour :

- suivre un service ;
- surveiller un log ;
- observer une erreur au moment où elle apparaît ;
- vérifier le comportement d'une application.

Pour quitter :

```text
Ctrl+C
```

---

# 7. `journalctl -f`

Sur les systèmes utilisant `systemd` :

```bash
journalctl -f
```

remplit un rôle similaire à :

```bash
tail -f
```

pour les journaux gérés par le journal systemd.

---

# 8. Quelle commande choisir ?

| Besoin | Commande |
|---|---|
| petit fichier | `cat fichier` |
| petit fichier avec numéros | `cat -n fichier` |
| gros fichier | `less fichier` |
| début du fichier | `head fichier` |
| N premières lignes | `head -n N fichier` |
| fin du fichier | `tail fichier` |
| N dernières lignes | `tail -n N fichier` |
| log en temps réel | `tail -f fichier` |
| journal systemd en direct | `journalctl -f` |

---

# 9. Réflexe pratique

On peut résumer ainsi :

```text
petit fichier    → cat
gros fichier     → less
début            → head
fin              → tail
log en direct    → tail -f
```

---

# 10. Dépannage rapide

| Problème | Cause probable | Solution |
|---|---|---|
| `cat` fait défiler trop vite | fichier trop long | `less` |
| `less` absent | paquet non installé | installer `less` |
| `tail -f` n'affiche rien | aucune nouvelle écriture | vérifier si le fichier grossit |
| `Permission denied` | droits insuffisants | vérifier les permissions |
| caractères illisibles | fichier binaire | utiliser `file` |

---

# 11. Vérifier qu'un fichier change

Si `tail -f` semble inactif, vérifier le fichier :

```bash
ls -l fichier.log
```

Puis refaire la commande plus tard pour voir si sa taille évolue.

On peut aussi inspecter ses métadonnées :

```bash
stat fichier.log
```

---

# 12. Vérifier le type avant lecture

Si un affichage produit des caractères incohérents :

```bash
file fichier
```

Exemple :

```bash
file programme
```

permet de savoir s'il s'agit de :

- texte ;
- ELF ;
- image ;
- archive ;
- données binaires ;
- etc.

> [!warning]
> Éviter d'envoyer volontairement des fichiers binaires dans le terminal avec `cat`.

---

# 13. Commandes à retenir

```bash
# Afficher un fichier court
cat fichier

# Numéroter les lignes
cat -n fichier

# Lire un fichier long
less fichier

# Premières lignes
head fichier
head -n 5 fichier

# Dernières lignes
tail fichier
tail -n 20 fichier

# Suivre un log
tail -f fichier

# Logs systemd
journalctl -f

# Identifier un fichier
file fichier
```

---

# 14. Réflexes sysadmin

1. Petit fichier → `cat`.
2. Gros fichier → `less`.
3. Structure rapide → `head`.
4. Dernières erreurs → `tail`.
5. Surveillance en direct → `tail -f`.
6. Dans `less`, utiliser `/mot` pour chercher.
7. Quitter `less` avec `q`.
8. Quitter `tail -f` avec `Ctrl+C`.
9. Si le contenu paraît binaire, vérifier avec `file`.
10. Si un log ne bouge pas, vérifier sa taille ou ses métadonnées.

---

## À retenir en une phrase

> **`cat` affiche, `less` parcourt, `head` montre le début, `tail` montre la fin, et `tail -f` suit les nouvelles lignes en temps réel.**
