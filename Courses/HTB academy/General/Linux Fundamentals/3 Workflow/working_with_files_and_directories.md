---
tags:
  - linux
  - shell
  - course/htb-academy
---

# Working with Files and Directories

## Créer

```bash
touch fichier.txt              # Crée un fichier vide
mkdir Storage                  # Crée un répertoire
mkdir -p Storage/local/user/documents  # Crée l'arborescence complète
touch ./Storage/local/user/userinfo.txt  # Crée un fichier dans un sous-dossier
tree .                         # Affiche l'arborescence
```

## Renommer et déplacer

`mv` sert à la fois à **renommer** et à **déplacer** :

```bash
mv info.txt information.txt              # Renommer
mv information.txt readme.txt Storage/   # Déplacer plusieurs fichiers
```

## Copier

```bash
cp Storage/readme.txt Storage/local/     # Copie vers un répertoire
```

## Supprimer

```bash
rm fichier.txt          # Supprimer un fichier
rm -r Storage/          # Supprimer un répertoire et son contenu (récursif)
rm -rf Storage/         # Forcer sans confirmation (dangereux)
rmdir Storage/          # Supprimer un répertoire vide uniquement
```

## Récapitulatif des commandes

| Commande | Action |
|---|---|
| `touch <nom>` | Créer un fichier vide |
| `mkdir <nom>` | Créer un répertoire |
| `mkdir -p <chemin>` | Créer l'arborescence complète |
| `mv <src> <dst>` | Déplacer ou renommer |
| `cp <src> <dst>` | Copier |
| `rm <fichier>` | Supprimer un fichier |
| `rm -r <dir>` | Supprimer un répertoire récursivement |
| `tree .` | Visualiser l'arborescence |
