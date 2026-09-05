---
tags:
  - linux
  - linux-fundamentals
  - course/htb-academy
---

# Linux Structure

## Historique rapide

| Année | Événement |
|---|---|
| 1970 | Unix — Ken Thompson & Dennis Ritchie (AT&T) |
| 1977 | BSD — limité par un procès AT&T |
| 1983 | Projet GNU — Richard Stallman (GNU GPL) |
| 1991 | Linux kernel — Linus Torvalds (étudiant finlandais) |
| Aujourd'hui | +23 millions de lignes de code, +600 distributions |

**Distributions populaires :** Ubuntu, Debian, Fedora, Kali, Parrot OS, Arch, RedHat…

**Pwnbox HTB** = Parrot OS (Debian-based, orienté sécurité/privacy).

---

## Philosophie Linux

| Principe | Description |
|---|---|
| **Everything is a file** | Devices, processus, connexions réseau → tout est un fichier |
| **Small, single-purpose programs** | Chaque outil fait une seule chose bien |
| **Chaining** | Les outils se combinent pour des tâches complexes (pipes) |
| **Shell-first** | Priorité au terminal sur les interfaces graphiques |
| **Config en texte** | Fichiers de config lisibles (ex: `/etc/passwd`) |

---

## Architecture

| Couche | Rôle |
|---|---|
| **Hardware** | RAM, CPU, disques, périphériques |
| **Kernel** | Virtualise et contrôle les ressources hardware — isole les processus |
| **Shell** | CLI — interface entre l'utilisateur et le kernel |
| **System Utility** | Expose les fonctionnalités de l'OS à l'utilisateur |

## Composants

| Composant | Description |
|---|---|
| **Bootloader** | Démarre l'OS (Parrot = GRUB) |
| **Kernel** | Gère I/O, mémoire, CPU |
| **Daemons** | Services en arrière-plan (scheduling, impression, multimédia…) |
| **Shell** | Bash, Zsh, Fish, Ksh, Tcsh… |
| **X-server** | Serveur graphique pour les applications GUI |
| **Window Manager** | GUI : GNOME, KDE, MATE, Cinnamon… |
| **Utilities** | Programmes applicatifs |

---

## Filesystem Hierarchy Standard (FHS)

| Répertoire | Contenu |
|---|---|
| `/` | Racine — tout part de là |
| `/bin` | Binaires essentiels |
| `/boot` | Bootloader, kernel |
| `/dev` | Fichiers de périphériques |
| `/etc` | Configs système et applications |
| `/home` | Répertoires utilisateurs |
| `/lib` | Bibliothèques partagées |
| `/media` | Montage des médias amovibles (USB…) |
| `/mnt` | Point de montage temporaire |
| `/opt` | Outils tiers optionnels |
| `/root` | Home du root |
| `/sbin` | Binaires d'administration système |
| `/tmp` | Fichiers temporaires — vidé au boot |
| `/usr` | Exécutables, bibliothèques, man pages |
| `/var` | Données variables : logs, emails, cron, web apps… |
