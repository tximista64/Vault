---
tags:
  - linux
  - network
  - services
  - ssh
  - nfs
  - web-server
  - vpn
  - pentest
  - sysadmin
---

# Network Services

## SSH (OpenSSH)

Protocole de communication chiffrée pour accès distant, exécution de commandes et transfert de fichiers.

```bash
# Installation
sudo apt install openssh-server -y

# Statut
systemctl status ssh

# Connexion
ssh user@10.129.17.122

# Config
/etc/ssh/sshd_config
```

Usages pentest : accès distant sécurisé, tunneling, port forwarding, pivot.

---

## NFS (Network File System)

Partage de fichiers réseau — monter un répertoire distant comme un filesystem local.

```bash
# Installation
sudo apt install nfs-kernel-server -y

# Statut
systemctl status nfs-kernel-server

# Config des partages
/etc/exports

# Créer et exporter un partage
mkdir ~/nfs_sharing
echo '/home/user/nfs_sharing hostname(rw,sync,no_root_squash)' >> /etc/exports

# Monter un partage NFS distant
mkdir ~/target_nfs
mount 10.129.12.17:/home/john/dev_scripts ~/target_nfs
```

### Options `/etc/exports`

| Option | Description |
|---|---|
| `rw` | Lecture + écriture |
| `ro` | Lecture seule |
| `no_root_squash` | Le root client garde ses droits root |
| `root_squash` | Le root client est limité à un user normal |
| `sync` | Transfert synchrone (sûr) |
| `async` | Transfert asynchrone (plus rapide, moins sûr) |

> ⚠️ `no_root_squash` → vecteur de **privesc** : si on peut écrire sur le partage en tant que root local, on peut créer des binaires SUID sur le serveur cible.

---

## Web Server

### Apache

```bash
# Installation
sudo apt install apache2 -y

# Racine web
/var/www/html

# Config globale
/etc/apache2/apache2.conf

# Config par répertoire
.htaccess
```

Modules utiles : `mod_rewrite`, `mod_security`, `mod_ssl`.

### Python HTTP Server (one-liner)

Alternative légère à Apache — idéale pour transférer des fichiers rapidement.

```bash
# Servir le répertoire courant sur le port 8000
python3 -m http.server

# Servir un répertoire spécifique
python3 -m http.server --directory /home/user/files

# Sur un port personnalisé
python3 -m http.server 443
```

Usages pentest :
- Transfert de fichiers vers/depuis une cible (`wget`, `curl`)
- Hébergement de payloads
- Phishing (replica de pages)

---

## VPN (OpenVPN)

```bash
# Installation
sudo apt install openvpn -y

# Config serveur
/etc/openvpn/server.conf

# Connexion avec un fichier .ovpn
sudo openvpn --config internal.ovpn
```

Solutions VPN Linux courantes : **OpenVPN**, L2TP/IPsec, PPTP, SSTP, SoftEther.

Usages pentest : accès aux réseaux internes inaccessibles directement, pivot réseau.
