---
tags:
  - linux
  - fondamentaux
  - noyau
  - système
  - démarrage
  - fhs
  - systemd
  - sysadmin
  - devops
---

# Notions fondamentales Linux

> **Linux au sens strict** = le noyau seul (Linus Torvalds, 1991, licence GPL)
> **Linux au sens courant** = une distribution complète (noyau + bibliothèques + outils + init + gestionnaire de paquets)

---

## Les composants d'un système Linux

| Composant | Rôle | Exemple |
|---|---|---|
| **Noyau** | Gère matériel, mémoire, processus | Linux 6.x |
| **Bibliothèques** | Interface entre programmes et noyau | glibc, musl |
| **Shell** | Interprète les commandes | bash, zsh, sh |
| **Outils système** | Manipulation fichiers, réseau, processus | coreutils, util-linux |
| **Gestionnaire de paquets** | Installation et mises à jour | apt, dnf, apk |
| **Init / PID 1** | Démarre et supervise les services | systemd |

**Distributions serveur courantes :** Ubuntu Server, Debian, RHEL/Rocky Linux, Alpine Linux

---

## Architecture — Comment une commande voyage jusqu'au noyau

```mermaid
flowchart TD
    U["👤 Utilisateur\ntape : ls /etc"] --> S
    S["🐚 Shell\nbash/zsh analyse et lance ls"] --> P
    P["⚙️ Processus ls\nmode utilisateur"] --> L
    L["📚 Bibliothèque C\nglibc — fonctions d'accès aux fichiers"] --> K
    K["🐧 Noyau Linux\nmode noyau — appels système\nopenat, getdents64..."] --> D
    D["💾 Disque\nlecture des entrées /etc"] --> K
    K --> L --> P --> S --> U

    style U fill:#27ae60,color:#fff
    style S fill:#2980b9,color:#fff
    style P fill:#8e44ad,color:#fff
    style L fill:#e67e22,color:#fff
    style K fill:#e74c3c,color:#fff
    style D fill:#34495e,color:#fff
```

> **Règle fondamentale** : le shell n'est pas Linux. C'est un programme utilisateur ordinaire. Linux = le noyau qui arbitre l'accès aux ressources.

### Mode noyau vs mode utilisateur

| Mode | Accès | Risque |
|---|---|---|
| **Mode noyau** | Accès total au matériel | Un bug peut paralyser le système entier |
| **Mode utilisateur** | Privilèges restreints | Un crash ne touche pas le reste du système |

La frontière est franchie uniquement par les **appels système** — c'est le mécanisme de sécurité central.

### À ne pas confondre

| ❌ | ✅ |
|---|---|
| Linux = une distribution | Linux = le noyau ; Debian/Ubuntu/RHEL = des distributions |
| Shell = terminal | Terminal affiche, shell interprète |
| /proc et /sys = répertoires de données | /proc et /sys = vues virtuelles sur le noyau |
| /tmp = stockage durable | /tmp = temporaire, jamais de persistance garantie |

---

## Le processus de démarrage (7 étapes)

```mermaid
flowchart TD
    A["1️⃣ Firmware\nBIOS / UEFI\nInitialise le matériel\nSecure Boot"] --> B
    B["2️⃣ Chargeur de démarrage\nGRUB2 / systemd-boot\nCharge vmlinuz + initramfs"] --> C
    C["3️⃣ Décompression du noyau\nDétection du matériel\nPrise de contrôle du CPU"] --> D
    D["4️⃣ Initramfs\nEnvironnement minimal en RAM\nCharge pilotes, LVM, chiffrement\nTrouve la vraie partition /"] --> E
    E["5️⃣ Switch-root\nBascule vers le vrai /\nsur disque"] --> F
    F["6️⃣ PID 1 — systemd\nPremier processus\nGère tout ce qui suit"] --> G
    G["7️⃣ Services et cible par défaut\nmulti-user.target\nDémarre les services selon dépendances"]

    style A fill:#34495e,color:#fff
    style B fill:#2980b9,color:#fff
    style C fill:#8e44ad,color:#fff
    style D fill:#e67e22,color:#fff
    style E fill:#e74c3c,color:#fff
    style F fill:#27ae60,color:#fff
    style G fill:#1abc9c,color:#fff
```

### Noyau installé ≠ noyau en cours d'exécution

```bash
ls /boot/vmlinuz*       # noyaux installés
readlink /boot/vmlinuz  # noyau par défaut
uname -r                # noyau actuellement en cours d'exécution
grep -o 'BOOT_IMAGE=[^ ]*' /proc/cmdline  # noyau réellement démarré
```

> ⚠️ Une mise à jour de sécurité du noyau **n'a aucun effet** tant que la machine n'a pas redémarré. Les outils de conformité distinguent "corrigé" de "redémarré".

### Points de blocage fréquents au démarrage

| Étape | Cause fréquente |
|---|---|
| **Initramfs** | Pilote manquant, volume LVM/chiffré non trouvé |
| **systemd** | Service en échec, dépendance non résolue |

---

## Hiérarchie du système de fichiers (FHS)

```mermaid
flowchart TD
    R["/\nRacine"] --> etc["/etc\nConfigurations"]
    R --> var["/var\nDonnées variables persistantes\n(journaux, état des services)"]
    R --> usr["/usr\nProgrammes, bibliothèques, doc"]
    R --> home["/home\nRépertoires utilisateurs"]
    R --> boot["/boot\nNoyau, initramfs, chargeur"]
    R --> tmp["/tmp\nTemporaire — jamais persistant"]
    R --> run["/run\nDonnées d'exécution volatiles\nréinitialisé au boot"]
    R --> proc["/proc\nVue virtuelle noyau/processus"]
    R --> dev["/dev\nPériphériques"]

    style R fill:#e74c3c,color:#fff
    style etc fill:#2980b9,color:#fff
    style var fill:#8e44ad,color:#fff
    style usr fill:#27ae60,color:#fff
    style home fill:#e67e22,color:#fff
    style boot fill:#34495e,color:#fff
    style tmp fill:#95a5a6,color:#fff
    style run fill:#1abc9c,color:#fff
    style proc fill:#f39c12,color:#333
    style dev fill:#c0392b,color:#fff
```

### 3 réflexes d'administration

| Besoin | Répertoire |
|---|---|
| Chercher une configuration | `/etc/` |
| Analyser un problème | `/var/log/` |
| Repérer un fichier runtime (socket, PID) | `/run/` |
