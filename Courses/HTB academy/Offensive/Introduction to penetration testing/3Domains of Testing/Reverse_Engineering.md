---
tags:
  - reverse-engineering
  - penetration-testing
  - course/htb-academy
---

# Reverse Engineering
Reverse engineering est le processus d’analyse d’un logiciel, d’un système ou d’une application pour comprendre son fonctionnement en examinant ses composants, sa structure et ses fonctionnalités. Pour les testeurs en cybersécurité, cette compétence permet d’identifier des vulnérabilités, de comprendre les mécanismes de sécurité et de développer des techniques d’exploitation efficaces. Contrairement à l’ingénierie directe, qui part des besoins pour créer un produit, l’ingénierie inverse commence par le produit final pour en déduire son fonctionnement.
## Compétences essentielles
Pour pratiquer efficacement le reverse engineering, il faut une base solide dans plusieurs domaines techniques :
- **Langages de programmation** : maîtrise des langages utilisés sur la plateforme cible (C/C++, Java, Swift, Kotlin).
- **Langage assembleur et architecture système** : essentiel pour analyser le code bas niveau.
- **Systèmes d’exploitation** : compréhension de la gestion mémoire, des appels système, de la gestion des processus.
- **Connaissances mobiles** : iOS/Android, modèles de sécurité, signatures de code, mécanismes de chiffrement.
- **Modèles logiciels** : design patterns, structures de données, algorithmes usuels.
- **Réseau et API** : compréhension des protocoles et de la communication applicative.
## Fondamentaux
Le reverse engineering repose sur une compréhension fine de l’architecture des ordinateurs et du langage assembleur. Lorsqu’un programme est compilé, le code source est transformé en code machine exécutable par le processeur. Comprendre l’exécution d’un programme implique de maîtriser :
- **La mémoire** : pile (stack), tas (heap), segments de code/données.
- **Le flux d’exécution** : appels de fonctions, variables locales, allocations dynamiques.
## Outils fondamentaux
- **Désassembleurs** : IDA Pro, Ghidra, Radare2
- **Débogueurs** : GDB, WinDbg, x64dbg
- **Décompilateurs** : JADX, ILSpy, DNSpy
Ces outils permettent de transformer du code binaire en représentation lisible, d’observer l’exécution en temps réel, ou de reconstituer le code source haut niveau.
[[ida.gif]]
## Analyse statique vs dynamique
- **Analyse statique** : étude du binaire sans l’exécuter (structure, fonctions, logique générale).
- **Analyse dynamique** : observation du comportement en temps réel (mémoire, appels système, anti-debug, chiffrement).
Les deux approches sont complémentaires pour comprendre en profondeur un logiciel.
## Cas d’usage fréquents
- **Analyse de malware** : comprendre le comportement malveillant, les mécanismes d’évasion, les vecteurs d’attaque.
- **Contournement d’authentification** : détection de validation faible, de mots de passe codés en dur.
- **Analyse de protocole** : rétro-conception de protocoles propriétaires ou non documentés.
## Difficultés avancées
Les logiciels modernes intègrent souvent :
- Obfuscation de code
- Exécutables packés
- Techniques anti-debug
- Sécurité spécifique aux plateformes mobiles ou systèmes embarqués
Le reverse engineering avancé implique de maîtriser les outils, contourner ces mécanismes, et adapter son approche à chaque architecture.
