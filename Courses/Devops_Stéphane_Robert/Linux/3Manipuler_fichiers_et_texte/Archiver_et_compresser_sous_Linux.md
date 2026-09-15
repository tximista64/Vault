---
title: "Archiver et compresser sous Linux"
tags:
  - linux
  - administration-systeme
  - cli
  - archives
  - compression
  - tar
  - gzip
  - bzip2
  - xz
  - zstd
  - zip
  - sauvegarde
  - sysadmin
aliases:
  - "Archives et compression Linux"
  - "tar gzip zip"
---

# Archiver et compresser sous Linux

> [!summary]
> **Archiver** regroupe plusieurs fichiers ; **compresser** réduit leur taille.
>
> `tar` crée des archives, et peut appeler un compresseur :
> - `z` → gzip
> - `j` → bzip2
> - `J` → xz
> - `--zstd` → zstd
>
> Pour un usage courant, `tar.gz` reste un excellent choix. Toujours **lister l’archive avant extraction**.

---

# 1. Archiver ≠ compresser

Créer une archive non compressée :

```bash
tar cf archive.tar dossier/
```

Créer une archive compressée avec gzip :

```bash
tar czf archive.tar.gz dossier/
```

Une archive `tar` seule peut être plus grosse que les fichiers d’origine à cause de ses en-têtes et blocs.

> [!important]
> C’est la **compression**, pas l’archivage, qui réduit réellement la taille.

---

# 2. Les verbes essentiels de `tar`

```text
c → create
t → list
x → extract
```

Ils sont mutuellement exclusifs : une commande `tar` utilise un seul de ces verbes.

`-f` indique le nom du fichier d’archive :

```bash
tar cf archive.tar dossier/
```

---

# 3. Créer une archive gzip

```bash
tar czf sauvegarde.tar.gz dossier/
```

Avec affichage détaillé :

```bash
tar czvf sauvegarde.tar.gz dossier/
```

Options :

```text
c → créer
z → gzip
v → verbose
f → fichier archive
```

---

# 4. Lister avant d’extraire

Archive tar :

```bash
tar tf archive.tar
```

Listing détaillé :

```bash
tar tvf archive.tar.gz
```

> [!tip]
> **Toujours inspecter une archive avant extraction.**

Le listing ne modifie rien sur le disque.

---

# 5. Extraction

```bash
tar xf archive.tar
```

Archive gzip :

```bash
tar xzf archive.tar.gz
```

GNU `tar` sait souvent détecter automatiquement le compresseur à la lecture :

```bash
tar xf archive.tar.gz
```

fonctionne généralement aussi.

---

# 6. Attention à l’extension

Cette commande :

```bash
tar cf archive.tar.gz dossier/
```

crée un **tar non compressé**, malgré le `.gz`.

Vérifier :

```bash
file archive.tar.gz
```

Correct :

```bash
tar czf archive.tar.gz dossier/
```

ou avec détection par extension :

```bash
tar caf archive.tar.gz dossier/
```

`-a` signifie :

```text
--auto-compress
```

---

# 7. Extraire dans un autre répertoire avec `-C`

```bash
mkdir restauration
tar xf archive.tar.gz -C restauration
```

Le répertoire cible doit exister.

---

# 8. Utiliser `-C` aussi à la création

Pour éviter d’enregistrer des chemins inutiles :

```bash
tar czf sauvegarde.tar.gz -C /srv inventaire
```

L’archive contiendra :

```text
inventaire/
inventaire/fichier1
inventaire/fichier2
```

plutôt que :

```text
srv/inventaire/...
```

---

# 9. Piège des chemins absolus

```bash
tar czf sauvegarde.tar.gz /srv/inventaire
```

GNU `tar` affiche :

```text
Removing leading '/' from member names
```

et stocke généralement :

```text
srv/inventaire/...
```

À l’extraction dans `/tmp/restauration` :

```text
/tmp/restauration/srv/inventaire/...
```

> [!important]
> Pour une archive propre, préférer :
>
> ```bash
> tar czf archive.tar.gz -C /srv inventaire
> ```

---

# 10. Éviter `-P`

`-P` / `--absolute-names` conserve les chemins absolus.

```bash
tar cPzf archive.tar.gz /srv/inventaire
```

Cela peut permettre à l’archive d’écrire directement dans des emplacements système.

> [!danger]
> Ne jamais extraire avec `-P` une archive non maîtrisée.

---

# 11. Extraire un seul fichier

Lister d’abord :

```bash
tar tf archive.tar.gz
```

Puis reprendre exactement le nom affiché :

```bash
tar xzf archive.tar.gz inventaire/stock.csv
```

Avec destination :

```bash
tar xzf archive.tar.gz -C cible inventaire/stock.csv
```

---

# 12. Wildcards

```bash
tar xzf archive.tar.gz \
  --wildcards 'inventaire/*.json'
```

Le motif doit être protégé du shell.

---

# 13. `--strip-components`

Pour supprimer des niveaux de chemin à l’extraction :

```bash
tar xzf archive.tar.gz \
  --strip-components=1 \
  -C cible
```

Une archive contenant :

```text
inventaire/stock.csv
```

donnera directement :

```text
cible/stock.csv
```

---

# 14. Exclure certains fichiers

À la création :

```bash
tar cf archive.tar \
  --exclude='*.log' \
  dossier/
```

Très pratique pour écarter :

- logs ;
- caches ;
- fichiers temporaires ;
- gros artefacts inutiles.

---

# 15. Extraction et écrasement

Par défaut, `tar` peut remplacer un fichier existant sans demander.

Pour protéger les fichiers déjà présents :

```bash
tar xkf archive.tar
```

`-k` :

```text
--keep-old-files
```

> [!warning]
> En cas de doute, extraire dans un répertoire vide.

---

# 16. `gzip` seul

Compresser un fichier :

```bash
gzip fichier
```

Résultat :

```text
fichier.gz
```

Le fichier original disparaît.

Pour le conserver :

```bash
gzip -k fichier
```

---

# 17. Décompresser gzip

```bash
gunzip fichier.gz
```

ou :

```bash
gzip -d fichier.gz
```

---

# 18. Lire sans décompresser

Avec gzip :

```bash
zcat fichier.gz
zless fichier.gz
zgrep 'motif' fichier.gz
```

Exemple :

```bash
zgrep -c 'ERROR' journal.log.gz
```

---

# 19. Autres compresseurs avec `tar`

| Option | Compresseur | Extension |
|---|---|---|
| `-z` | gzip | `.tar.gz` |
| `-j` | bzip2 | `.tar.bz2` |
| `-J` | xz | `.tar.xz` |
| `--zstd` | zstd | `.tar.zst` |

Exemples :

```bash
tar cjf archive.tar.bz2 dossier/
tar cJf archive.tar.xz dossier/
tar --zstd -cf archive.tar.zst dossier/
```

---

# 20. Choisir un compresseur

Il n’existe pas de classement absolu.

En pratique :

```text
gzip → rapide, universel, bon compromis
bzip2 → plus lent, compression parfois meilleure
xz → compression forte, création souvent lente
zstd → très rapide, excellent compromis moderne
```

Le résultat dépend fortement du type de données.

> [!tip]
> Pour un choix sérieux : mesurer sur les données réelles plutôt que réciter un tableau.

---

# 21. Vérifier que les outils existent

```bash
for c in gzip bzip2 xz zstd; do
  command -v "$c" || echo "$c absent"
done
```

`tar` appelle ces programmes externes.

Un compresseur manquant peut produire une archive vide ou inutilisable.

---

# 22. `zip` — partage multiplateforme

Créer :

```bash
zip archive.zip fichier1 fichier2
```

Dossier récursif :

```bash
zip -r archive.zip dossier/
```

Lister :

```bash
unzip -l archive.zip
```

Extraire :

```bash
unzip archive.zip
```

> [!tip]
> `zip` est souvent le choix le plus pratique pour échanger avec Windows/macOS.

---

# 23. `tar` et permissions

Une archive `tar` conserve les métadonnées, mais leur restauration dépend de l’utilisateur.

Utilisateur normal, sans `-p` :

```bash
tar xf archive.tar
```

Les permissions peuvent être filtrées par l’`umask`.

Avec :

```bash
tar xpf archive.tar
```

les permissions sont restaurées plus fidèlement.

---

# 24. Propriétaires et groupes

Un utilisateur ordinaire ne peut pas restaurer arbitrairement les propriétaires.

Pour restaurer propriétaire + groupe d’origine :

```bash
sudo tar xf archive.tar
```

En root, `tar` restaure généralement automatiquement ces métadonnées.

---

# 25. Liens physiques et symboliques

`tar` sait préserver :

- symlinks ;
- hard links ;
- dates ;
- permissions ;
- structure de répertoires.

Pour un hard link, le contenu n’est pas dupliqué dans l’archive : la relation est mémorisée.

---

# 26. SELinux et xattrs

Sur un système SELinux, les contextes ne sont pas forcément sauvegardés par défaut.

Pour une sauvegarde système :

```bash
sudo tar --selinux --xattrs -cf sauvegarde.tar dossier/
```

Extraction :

```bash
sudo tar --selinux --xattrs -xf sauvegarde.tar
```

> [!important]
> Pour restaurer correctement les contextes SELinux, utiliser les options **à la création et à l’extraction**.

---

# 27. Vérifier le code de retour

Une archive peut être créée malgré certaines erreurs de lecture.

Exemple :

```text
Permission denied
Exiting with failure status
```

Mais un fichier archive peut quand même exister.

Toujours contrôler :

```bash
echo $?
```

> [!danger]
> Une archive existante n’est pas forcément une archive complète.

---

# 28. Vérifier une archive avec `tar df`

Comparer l’archive avec les fichiers présents sur disque :

```bash
tar df archive.tar.gz -C /srv
```

Silence + code `0` :

```text
contenu conforme
```

Après modification d’un fichier, `tar` peut signaler :

```text
Mod time differs
Size differs
```

---

# 29. Réflexe de sauvegarde

Pipeline mental :

```text
1. créer
2. vérifier le code retour
3. lister
4. comparer si possible
5. tester une extraction
```

Une sauvegarde non testée n’est pas encore une restauration garantie.

---

# 30. Dépannage rapide

| Symptôme | Cause probable | Solution |
|---|---|---|
| `Removing leading '/'` à la création | chemin absolu fourni | créer avec `-C` |
| même message au listing | vrais chemins absolus dans archive | prudence, éviter `-P` |
| extraction recrée `srv/`, `home/`, `etc/` | mauvais chemin stocké | utiliser `-C` |
| archive existe mais fichier manque | erreur de lecture à la création | vérifier code retour |
| `bzip2: command not found` | compresseur absent | installer le paquet |
| `.tar.gz` non compressé | `tar cf` seulement | `tar czf` ou `tar caf` |
| binaire dans terminal | `-f` oublié | préciser fichier archive |
| `Not found in archive` | mauvais nom de membre | reprendre le nom de `tar tf` |
| `-C`: répertoire absent | cible inexistante | créer le répertoire |
| fichier local remplacé | comportement normal | `-k` |
| permissions incorrectes | umask | extraction avec `-p` |
| propriétaire non restauré | utilisateur non root | extraire en root |
| contexte SELinux perdu | xattrs non archivés | `--selinux --xattrs` |
| original supprimé après `gzip` | comportement normal | `gzip -k` |

---

# 31. Commandes à retenir

```bash
# Créer
tar cf archive.tar dossier/
tar czf archive.tar.gz dossier/
tar caf archive.tar.gz dossier/

# Lister
tar tf archive.tar
tar tvf archive.tar.gz

# Extraire
tar xf archive.tar
tar xf archive.tar.gz -C destination

# Un seul fichier
tar xf archive.tar.gz chemin/dans/archive

# Exclure
tar cf archive.tar --exclude='*.log' dossier/

# Retirer un niveau de chemin
tar xf archive.tar --strip-components=1

# Ne pas écraser
tar xkf archive.tar

# Comparer archive / disque
tar df archive.tar

# gzip seul
gzip fichier
gzip -k fichier
gunzip fichier.gz

# Lire gzip
zcat fichier.gz
zless fichier.gz
zgrep 'motif' fichier.gz

# zip
zip -r archive.zip dossier/
unzip -l archive.zip
unzip archive.zip
```

---

# 32. Réflexes sysadmin

1. Distinguer **archive** et **compression**.
2. Toujours faire `tar tf` avant extraction.
3. Utiliser `-C` pour contrôler les chemins.
4. Éviter les chemins absolus dans les archives.
5. Ne jamais utiliser `-P` sur une archive non maîtrisée.
6. Vérifier le code de retour après création.
7. Ne pas supposer qu’une extension garantit le format réel.
8. Utiliser `file` pour vérifier une archive douteuse.
9. Extraire dans un répertoire vide en cas de doute.
10. Utiliser `-k` pour éviter les écrasements accidentels.
11. Utiliser `--selinux --xattrs` pour les sauvegardes système concernées.
12. Tester une restauration, pas seulement une création.

---

## À retenir en une phrase

> **`tar` regroupe, un compresseur réduit la taille, `-C` maîtrise les chemins, et une archive sérieuse se liste et se vérifie avant toute extraction.**
