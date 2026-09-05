---
tags:
  - linux
  - backup
  - rsync
  - ssh
  - cron
  - sysadmin
---

# Backup and Restore

## Outils de sauvegarde Ubuntu

| Outil | Description |
|---|---|
| **Rsync** | Synchronisation rapide, incrémentale, locale ou distante |
| **Duplicity** | Rsync + chiffrement — backups sécurisés sur serveurs distants/cloud |
| **Deja Dup** | Interface graphique basée sur Rsync — simple et accessible |

**Chiffrement complémentaire :** GnuPG, eCryptfs, LUKS

---

## Rsync

```bash
sudo apt install rsync -y
```

### Options principales

| Option | Description |
|---|---|
| `-a` | Archive — préserve permissions, timestamps, liens symboliques… |
| `-v` | Verbose — affiche la progression |
| `-z` | Compression pendant le transfert |
| `-e ssh` | Tunnel SSH (chiffrement) |
| `--backup` | Sauvegarde incrémentale |
| `--backup-dir` | Répertoire des sauvegardes incrémantales |
| `--delete` | Supprime sur la destination les fichiers absents de la source |

### Commandes

```bash
# Backup local → serveur distant
rsync -av /chemin/local user@backup_server:/chemin/distant

# Backup complet avec compression, incrémental et suppression
rsync -avz --backup --backup-dir=/backup/incremental --delete \
  /chemin/local user@backup_server:/chemin/distant

# Backup chiffré via SSH
rsync -avz -e ssh /chemin/local user@backup_server:/chemin/distant

# Restauration — serveur distant → local
rsync -av user@backup_server:/chemin/distant /chemin/local
```

---

## Auto-synchronisation avec cron

### 1. Générer une clé SSH (auth sans mot de passe)

```bash
ssh-keygen -t rsa -b 2048
ssh-copy-id user@backup_server
```

### 2. Script de backup

```bash
#!/bin/bash
# RSYNC_Backup.sh
rsync -avz -e ssh /chemin/local user@backup_server:/chemin/distant
```

```bash
chmod +x RSYNC_Backup.sh
```

### 3. Planifier avec cron

```bash
crontab -e
```

```
# Syntaxe cron : minute heure jour mois jour_semaine commande
0 * * * *  /chemin/vers/RSYNC_Backup.sh   # Toutes les heures
* * * * *  /chemin/vers/RSYNC_Backup.sh   # Toutes les minutes (test)
0 2 * * *  /chemin/vers/RSYNC_Backup.sh   # Tous les jours à 2h
```

### Rappel syntaxe crontab

```
┌─ minute (0-59)
│ ┌─ heure (0-23)
│ │ ┌─ jour du mois (1-31)
│ │ │ ┌─ mois (1-12)
│ │ │ │ ┌─ jour de la semaine (0-7, 0 et 7 = dimanche)
│ │ │ │ │
* * * * *  commande
```
