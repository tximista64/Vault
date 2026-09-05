
# FreeBSD - Cheat Sheet

**tags**: #cheatsheet #freebsd #unix #bsd #sysadmin

---

## Commandes de base

| Commande                | Description                                      |
|-------------------------|--------------------------------------------------|
| `uname -a`             | Infos système                                     |
| `freebsd-version`      | Version de FreeBSD                               |
| `shutdown -r now`      | Redémarrer immédiatement                         |
| `shutdown -p now`      | Éteindre la machine                               |
| `top`                  | Surveillance des processus                        |
| `ps aux`               | Liste des processus                              |
| `kill <PID>`           | Tuer un processus                                |

---

## Gestion des services

| Commande                          | Description                                      |
|-----------------------------------|--------------------------------------------------|
| `service <nom> start`           | Démarrer un service                              |
| `service <nom> stop`            | Arrêter un service                               |
| `service <nom> restart`         | Redémarrer un service                            |
| `service -e`                    | Liste les services actifs                        |

---

## Réseau

| Commande                          | Description                                      |
|-----------------------------------|--------------------------------------------------|
| `ifconfig`                      | Affiche les interfaces réseau                    |
| `netstat -rn`                   | Affiche la table de routage                     |
| `ping <adresse>`                | Tester la connectivité                          |
| `sockstat -4 -l`                | Ports TCP/IPv4 ouverts                          |

---

## Gestion des paquets

| Commande                              | Description                                      |
|---------------------------------------|--------------------------------------------------|
| `pkg search <nom>`                   | Rechercher un paquet                            |
| `pkg install <nom>`                  | Installer un paquet                             |
| `pkg delete <nom>`                   | Supprimer un paquet                             |
| `pkg update`                         | Mettre à jour la base de paquets                |
| `pkg upgrade`                        | Mettre à jour tous les paquets                  |

---

## Ports

| Commande                              | Description                                      |
|---------------------------------------|--------------------------------------------------|
| `cd /usr/ports/<categorie>/<port>`  | Aller dans un répertoire de port                |
| `make install clean`                | Compiler et installer un port                   |

---

## Montage de systèmes de fichiers

| Commande                              | Description                                      |
|---------------------------------------|--------------------------------------------------|
| `mount`                              | Liste les systèmes montés                       |
| `mount /dev/ada0p2 /mnt`             | Monter une partition                            |
| `umount /mnt`                        | Démonter un système                             |

---

## Utilisateurs

| Commande                              | Description                                      |
|---------------------------------------|--------------------------------------------------|
| `adduser`                            | Ajouter un utilisateur                          |
| `pw userdel <nom>`                   | Supprimer un utilisateur                        |
| `passwd <nom>`                       | Modifier un mot de passe                        |

---

## Système et logs

| Commande                              | Description                                      |
|---------------------------------------|--------------------------------------------------|
| `dmesg`                              | Messages du noyau                               |
| `less /var/log/messages`             | Logs système principaux                         |
| `tail -f /var/log/messages`          | Suivi temps réel des logs                       |

---

## Compilation du noyau

```sh
cd /usr/src
make buildkernel KERNCONF=MONKERNEL
make installkernel KERNCONF=MONKERNEL
reboot
```

---

## Fichiers importants

| Fichier                        | Rôle                              |
|-------------------------------|------------------------------------|
| `/etc/rc.conf`                | Configuration des services         |
| `/etc/fstab`                  | Points de montage automatiques     |
| `/boot/loader.conf`           | Options de démarrage du noyau      |

---
