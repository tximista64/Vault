---
tags:
  - linux
  - linux-fundamentals
  - penetration-testing
  - course/htb-academy
---

# Linux Distributions

Les **distributions** (distros) sont des OS basés sur le kernel Linux, adaptés à des usages spécifiques. Même architecture et philosophie, mais packages, outils et configurations différents.

## Distributions populaires par usage

| Usage | Distributions |
|---|---|
| **Desktop / débutants** | Ubuntu, Fedora |
| **Serveurs** | Debian, CentOS, Red Hat Enterprise Linux |
| **Entreprise** | Red Hat Enterprise Linux, CentOS |
| **Cybersécurité** | Kali Linux, ParrotOS, BlackArch, BackBox, Pentoo |
| **Embedded / IoT** | Raspberry Pi OS, Debian |

## Pour les pentesters

**Kali Linux** : distribution de référence en cybersécurité — large collection d'outils offensifs pré-installés.

**Parrot OS** : Debian-based, orienté sécurité et privacy — utilisé sur la Pwnbox HTB.

## Debian

Distribution de référence pour la stabilité et la flexibilité.

- Gestionnaire de packages : **apt** (Advanced Package Tool)
- Mises à jour de sécurité automatiques ou manuelles
- Utilisé pour : serveurs, desktop, systèmes embarqués
- Courbe d'apprentissage plus élevée — mais contrôle maximal sur le système
- Base de nombreuses autres distros (Ubuntu, Parrot, Kali…)

> Plus on maîtrise les commandes en profondeur, plus Linux devient efficace — la complexité apparente vient du manque de pratique, pas de la difficulté intrinsèque.
