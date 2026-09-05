# Linux Fundamentals - Cheat Sheet

**tags**: #cheatsheet #linux #commandes #terminal #sysadmin

---

## Aide et documentation

| Command                  | Description                                                      |
|--------------------------|------------------------------------------------------------------|
| `man <outil>`           | Affiche les pages de manuel pour l'outil spécifié               |
| `<outil> -h`            | Affiche l'aide de l'outil                                       |
| `apropos <mot-clé>`     | Recherche dans les descriptions des man pages                   |

---

## Informations système et utilisateur

| Command        | Description                                         |
|----------------|-----------------------------------------------------|
| `whoami`       | Affiche l'utilisateur actuel                        |
| `id`           | Identité de l'utilisateur                           |
| `hostname`     | Affiche ou modifie le nom d’hôte                    |
| `uname`        | Affiche le nom du système d’exploitation            |
| `pwd`          | Affiche le répertoire courant                       |

---

## Réseau

| Command     | Description                                                             |
|-------------|-------------------------------------------------------------------------|
| `ifconfig`  | Affiche ou configure une interface réseau                               |
| `ip`        | Gère les interfaces, routes, tunnels, etc.                              |
| `netstat`   | Affiche l’état des connexions réseau                                    |
| `ss`        | Outil alternatif pour inspecter les sockets                             |
| `curl`      | Transfère des données depuis/vers un serveur                            |
| `wget`      | Télécharge des fichiers via FTP ou HTTP(S)                              |
| `python3 -m http.server` | Démarre un serveur web local sur le port TCP 8000         |

---

## Processus

| Command        | Description                                      |
|----------------|--------------------------------------------------|
| `ps`           | Affiche les processus actifs                     |
| `who`          | Qui est connecté                                 |
| `env`          | Affiche ou exécute avec des variables d’environnement |
| `systemctl`    | Gère les services et le système (systemd)        |
| `journalctl`   | Interroge le journal de systemd                  |
| `kill`         | Envoie un signal à un processus                  |
| `bg`           | Met un processus en arrière-plan                 |
| `jobs`         | Liste les processus en arrière-plan              |
| `fg`           | Ramène un processus au premier plan              |

---

## Matériel

| Command     | Description                     |
|-------------|---------------------------------|
| `lsblk`     | Liste les périphériques blocs   |
| `lsusb`     | Liste les périphériques USB     |
| `lspci`     | Liste les périphériques PCI     |
| `lsof`      | Liste les fichiers ouverts      |

---

## Gestion des utilisateurs et groupes

| Command        | Description                                       |
|----------------|---------------------------------------------------|
| `sudo`         | Exécute une commande en tant qu’autre utilisateur |
| `su`           | Change d’utilisateur (par défaut root)            |
| `useradd`      | Crée un nouvel utilisateur                        |
| `userdel`      | Supprime un utilisateur                           |
| `usermod`      | Modifie un compte utilisateur                     |
| `addgroup`     | Ajoute un groupe                                  |
| `delgroup`     | Supprime un groupe                                |
| `passwd`       | Change le mot de passe                            |

---

## Gestion des paquets

| Command     | Description                             |
|-------------|-----------------------------------------|
| `dpkg`      | Gère les paquets Debian                 |
| `apt`       | Outil haut niveau de gestion de paquets |
| `aptitude`  | Alternative à apt                       |
| `snap`      | Gère les paquets Snap                   |
| `gem`       | Gestionnaire de paquets Ruby            |
| `pip`       | Gestionnaire de paquets Python          |

---

## Fichiers et navigation

| Command      | Description                                 |
|--------------|---------------------------------------------|
| `ls`         | Liste le contenu d’un répertoire            |
| `cd`         | Change de répertoire                        |
| `clear`      | Efface le terminal                          |
| `touch`      | Crée un fichier vide                        |
| `mkdir`      | Crée un dossier                             |
| `tree`       | Affiche récursivement l’arborescence        |
| `mv`         | Déplace ou renomme un fichier/dossier       |
| `cp`         | Copie fichier ou dossier                    |
| `nano`       | Éditeur de texte en ligne de commande       |
| `which`      | Affiche le chemin d’un programme            |

---

## Recherche de fichiers

| Command        | Description                                        |
|----------------|----------------------------------------------------|
| `find`         | Recherche dans l’arborescence                      |
| `updatedb`     | Met à jour la base de données `locate`             |
| `locate`       | Recherche avec la base de données `updatedb`       |

---

## Lecture de fichiers

| Command     | Description                          |
|-------------|--------------------------------------|
| `more`      | Affiche page par page                |
| `less`      | Version améliorée de `more`          |
| `head`      | Affiche les 10 premières lignes      |
| `tail`      | Affiche les 10 dernières lignes      |

---

## Traitement de texte en ligne

| Command     | Description                                  |
|-------------|----------------------------------------------|
| `sort`      | Trie les lignes                              |
| `grep`      | Recherche un motif                           |
| `cut`       | Coupe des sections de texte                  |
| `tr`        | Remplace des caractères                      |
| `column`    | Formate en colonnes                          |
| `awk`       | Langage de traitement de texte               |
| `sed`       | Éditeur de flux pour modifier du texte       |
| `wc`        | Compte lignes, mots, caractères               |

---

## Permissions

| Command     | Description                                |
|-------------|--------------------------------------------|
| `chmod`     | Modifie les permissions                    |
| `chown`     | Change le propriétaire et groupe d’un fichier |

