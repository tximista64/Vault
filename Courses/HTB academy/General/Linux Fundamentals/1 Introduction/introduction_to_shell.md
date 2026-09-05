---
tags:
  - linux
  - shell
  - course/htb-academy
---

# Introduction to Shell

## Shell / Terminal / Console

| Terme | Définition |
|---|---|
| **Shell** | Interpréteur de commandes — interface entre l'utilisateur et le kernel |
| **Terminal** | Fenêtre de texte I/O donnant accès au shell |
| **Console** | Écran en mode texte (pas une fenêtre) |
| **Terminal emulator** | Logiciel qui émule un terminal dans un GUI |
| **CLI** | Command-Line Interface — terminal additionnel dans un terminal |

Analogie : le shell = la salle serveur, le terminal = le bureau d'accueil, l'émulateur de terminal = le bureau virtuel en télétravail.

## Terminal Emulators & Multiplexers

Les **multiplexers** (ex: **Tmux**) étendent les capacités du terminal :
- Diviser le terminal en plusieurs panneaux
- Travailler dans plusieurs répertoires simultanément
- Gérer plusieurs workspaces
- Sessions persistantes (reconnexion après déconnexion)

## Shells disponibles

| Shell | Notes |
|---|---|
| **Bash** (Bourne-Again Shell) | Shell par défaut Linux — partie du projet GNU |
| **Zsh** | Bash étendu — autocomplétion avancée |
| **Fish** | Friendly interactive shell — syntaxe moderne |
| **Ksh** | KornShell |
| **Tcsh/Csh** | C Shell |

**Bash** est le shell le plus utilisé — tout ce qui est faisable via GUI est faisable en shell, souvent plus rapidement et avec plus de contrôle. Les scripts automatisent les tâches répétitives.
