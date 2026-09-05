
# macOS Fundamentals - Cheat Sheet

**tags**: #cheatsheet #macos #unix #zsh #réseau #homebrew #cli

---

## Fichiers et Répertoires

| Commande                                                  | Description                                         |
|-----------------------------------------------------------|-----------------------------------------------------|
| `defaults write com.apple.Finder AppleShowAllFiles true && killall Finder` | Affiche les fichiers cachés dans le Finder       |
| `ls`, `ls -l`, `ls -la`                                   | Liste les fichiers (avec options attributs/masqués)|
| `cd <path>`                                               | Change de répertoire                               |
| `clear`                                                   | Nettoie le terminal                                |
| `touch <file>`                                            | Crée un fichier vide                               |
| `mkdir <directory>`                                       | Crée un dossier                                    |
| `mv <src> <dst>`                                          | Déplace un fichier                                 |
| `chmod -vv <octal> <file>`                                | Modifie les permissions                            |
| `sudo chown <user>:<group> <file>`                        | Change le propriétaire                             |

---

## Réseau

| Commande                                           | Description                                      |
|----------------------------------------------------|--------------------------------------------------|
| `ifconfig`                                         | Affiche les interfaces réseau                    |
| `ifconfig <interface>`                             | Détails d'une interface                         |
| `ifconfig en0 inet <IP> netmask <NETMASK>`         | Configure une IP statique                       |
| `lsof -n -i4TCP -P`                                | Liste les ports TCP utilisés                    |
| `hostname`                                         | Affiche le nom de la machine                    |
| `networksetup -listallnetworkservices`             | Liste les services réseau                       |
| `networksetup -listnetworkserviceorder`            | Ordre des services réseau                       |
| `networksetup -getinfo <device>`                   | Infos IP/MAC pour une interface                 |
| `networksetup -getcurrentlocation`                 | Affiche l’emplacement réseau actuel             |
| `networksetup -setmanual <svc> <ip> <mask> <gw>`   | Configure manuellement une interface            |
| `networkQuality -I <interface>`                    | Test de performance réseau                      |
| `security find-generic-password -wa <SSID>`        | Récupère un mot de passe Wi-Fi du trousseau     |
| `nc`                                               | Utilitaire réseau pour écouter ou se connecter  |

---

## Gestion des applications (Homebrew)

| Commande                                                            | Description                            |
|---------------------------------------------------------------------|----------------------------------------|
| `/bin/bash -c "$(curl -fsSL https://.../install.sh)"`              | Installe Homebrew                      |
| `brew -v`                                                           | Affiche la version                     |
| `brew install <package>`                                           | Installe un paquet                     |
| `brew search <package>`                                            | Recherche un paquet                    |
| `brew install <package> --cask`                                    | Installe une app graphique             |
| `brew uninstall <package>`                                         | Supprime un paquet                     |
| `brew upgrade`                                                     | Met à jour Homebrew et les paquets     |
| `brew cleanup`                                                     | Nettoie les paquets inutilisés         |

---

## Gestion du shell (Bash, Zsh)

| Commande                                                        | Description                                   |
|------------------------------------------------------------------|-----------------------------------------------|
| `.bashrc`, `.zshrc`                                              | Fichiers de configuration Bash/Zsh            |
| `chsh -s /bin/bash`                                              | Définit Bash comme shell par défaut           |
| `brew install zsh`                                               | Installe Zsh                                  |
| `chsh -s /bin/zsh`                                               | Définit Zsh comme shell                       |
| `alias ll='ls -l'`                                               | Déclare un alias                              |
| `sh -c "$(curl -fsSL https://.../ohmyzsh/install.sh)"`          | Installe Oh My Zsh                            |
| `git clone https://.../zsh-syntax-highlighting.git ...`         | Installe la coloration syntaxique Zsh         |
| `git clone https://.../powerlevel10k.git ...`                   | Installe le thème Powerlevel10k               |
| `brew install romkatv/powerlevel10k/powerlevel10k`              | Installe Powerlevel10k via Homebrew           |
| `echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc` | Active le thème Powerlevel10k     |

---
