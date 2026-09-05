---
tags:
  - linux
  - file-permissions
  - penetration-testing
  - course/htb-academy
---

# User Management

## Commandes essentielles

| Commande | Description |
|---|---|
| `sudo <cmd>` | Exécute une commande avec les droits d'un autre user (défaut : root) |
| `su <user>` | Bascule vers un autre utilisateur (demande le mot de passe via PAM) |
| `useradd <user>` | Crée un nouvel utilisateur |
| `userdel <user>` | Supprime un utilisateur et ses fichiers associés |
| `usermod <options> <user>` | Modifie un compte utilisateur existant |
| `addgroup <group>` | Crée un groupe |
| `delgroup <group>` | Supprime un groupe |
| `passwd <user>` | Change le mot de passe d'un utilisateur |

## Exemples pratiques

```bash
# Créer un utilisateur avec home directory
useradd -m alex

# Créer un utilisateur avec shell et groupe
useradd -m -s /bin/bash -G sudo alex

# Modifier le groupe d'un utilisateur existant
usermod -aG docker alex    # -a = append (ne pas écraser les groupes existants)

# Changer le shell d'un utilisateur
usermod -s /bin/zsh alex

# Changer le mot de passe
passwd alex

# Basculer vers root
sudo su -         # Login shell root
sudo -i           # Équivalent

# Basculer vers un autre utilisateur
su - alex         # Login shell alex (demande son mot de passe)
sudo su - alex    # Sans mot de passe si droits sudo
```

## Fichiers sensibles

| Fichier | Contenu | Accès |
|---|---|---|
| `/etc/passwd` | Users, UID, GID, home, shell | Lisible par tous |
| `/etc/shadow` | Hashes des mots de passe | Root uniquement |
| `/etc/group` | Groupes et membres | Lisible par tous |
| `/etc/sudoers` | Droits sudo par user/groupe | Root uniquement (`visudo`) |

## Pertinence pentest

- `/etc/shadow` lisible → extraction et cracking des hashes.
- Un utilisateur dans le groupe **sudo** → potentielle escalade de privilèges.
- `sudo -l` → lister les commandes sudo autorisées pour l'utilisateur courant → vecteur de privesc (GTFObins).
- `su` avec un mot de passe faible → bruteforceable.
