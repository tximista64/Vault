---
tags:
  - linux
  - filesystem
  - disk
  - mount
  - swap
  - inodes
  - sysadmin
---

# File System Management

## Systèmes de fichiers Linux

| FS | Journalisation | Cas d'usage |
|---|---|---|
| **ext2** | Non | USB, faible overhead |
| **ext3** | Oui | Systèmes legacy |
| **ext4** | Oui | Défaut Linux moderne — équilibre perf/fiabilité |
| **Btrfs** | Oui | Snapshots, intégrité des données, NAS |
| **XFS** | Oui | Gros fichiers, I/O intensif |
| **NTFS** | Oui | Dual-boot Linux/Windows, disques externes |

---

## Inodes

Structure de métadonnées stockant : permissions, propriétaire, taille, timestamps, pointeurs vers les blocs de données — mais **pas** le nom ni le contenu du fichier.

```bash
ls -il                    # Afficher les numéros d'inodes
stat fichier.txt          # Infos complètes d'un inode
df -i                     # Utilisation des inodes par filesystem
find / -inum 12345 2>/dev/null   # Trouver un fichier par inode
```

## Types de fichiers

| Type | Description |
|---|---|
| **Regular file** | Texte, binaire, images, exécutables |
| **Directory** | Conteneur de fichiers |
| **Symbolic link** | Raccourci vers un autre fichier/répertoire |

---

## Gestion des disques

```bash
# Lister les partitions et disques
sudo fdisk -l

# Autres outils de partitionnement
gpart    # BSD-style
GParted  # Interface graphique
```

---

## Montage (Mount)

Associer un périphérique/partition à un point de montage dans l'arborescence.

```bash
# Lister les filesystems montés
mount

# Monter un périphérique
sudo mount /dev/sdb1 /mnt/usb

# Démonter
sudo umount /mnt/usb

# Vérifier les processus utilisant un filesystem avant démontage
lsof | grep /mnt/usb
```

### /etc/fstab — montage automatique au boot

```
# <filesystem>          <mount point>  <type>  <options>        <dump> <pass>
/dev/sda1               /              ext4    defaults          0      1
/dev/sda2               /home          ext4    defaults          0      2
/dev/sdb1               /mnt/usb       ext4    rw,noauto,user    0      0
192.168.1.100:/nfs      /mnt/nfs       nfs     defaults          0      0
```

| Option | Description |
|---|---|
| `defaults` | rw, suid, dev, exec, auto, nouser, async |
| `noauto` | Ne pas monter au boot |
| `user` | Permet à un user non-root de monter |
| `ro` / `rw` | Lecture seule / lecture-écriture |

```bash
# Identifier l'UUID d'un disque (recommandé dans fstab)
blkid
```

---

## SWAP

Extension virtuelle de la RAM sur disque — utilisée quand la RAM est saturée, et pour l'hibernation.

```bash
# Créer un espace swap sur une partition
sudo mkswap /dev/sdb2

# Activer le swap
sudo swapon /dev/sdb2

# Vérifier le swap actif
swapon --show
free -h

# Désactiver le swap
sudo swapoff /dev/sdb2
```

> ⚠️ Le swap peut contenir des données sensibles en clair — recommandé de le **chiffrer** (LUKS).

---

## Pertinence pentest

- `df -i` → filesystem saturé en inodes → déni de service possible même avec de l'espace disque disponible.
- `mount` → identifier les partages NFS, CIFS, ou devices montés — vecteurs d'accès supplémentaires.
- `/etc/fstab` → révèle la topologie du stockage, les partages réseau et les options de sécurité.
- Swap non chiffré → potentielle extraction de données sensibles (credentials, clés…) avec des outils forensiques.
