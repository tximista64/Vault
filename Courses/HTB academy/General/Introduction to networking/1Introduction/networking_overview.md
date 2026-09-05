---
tags:
  - networking
  - subnetting
  - penetration-testing
  - course/htb-academy
---

# Networking Overview

## Principe de base

Un réseau permet à deux machines de communiquer. Un réseau **flat** (plat) est simple à monter mais peu sécurisé — segmenter en sous-réseaux ajoute des couches de défense et ralentit un attaquant.

Analogie : la segmentation réseau, c'est comme une clôture, des éclairages et des buissons autour d'une maison — chaque couche complique la progression discrète d'un intrus.

## Anecdote pentest — erreur de subnet

Un pentester avait configuré son masque en `/24` sans vérifier. Le réseau cible était segmenté en `/25` :

| Machine | IP |
|---|---|
| Server Gateway | 10.20.0.1/25 |
| Domain Controller | 10.20.0.10/25 |
| Client Gateway | 10.20.0.129/25 |
| Client Workstation | 10.20.0.200/25 |
| Pentester | 10.20.0.252/**24** |

Résultat : le pentester ne voyait que le segment client et a conclu à tort que le Domain Controller était hors ligne. Il n'a jamais atteint les cibles à haute valeur (serveurs DB…).

## Fonctionnement simplifié d'une requête web

- **URL** : adresse complète incluant chemin, paramètres (`https://site.com/page?id=1`)
- **FQDN** : juste le nom de domaine (`www.site.com`)
- Le **router** = bureau de poste local → transmet au **FAI**
- Le **FAI** consulte le **DNS** (annuaire) → obtient l'**adresse IP** de destination
- Le paquet est acheminé jusqu'au serveur, qui renvoie la réponse à l'IP source

## Segmentation recommandée (réseau d'entreprise)

| Segment | Raison |
|---|---|
| **DMZ** (Web Server) | Exposé à internet — isoler pour limiter la propagation en cas de compromission |
| **Workstations** | Éviter le spoofing et les attaques MitM entre postes ; idéalement firewall host-based entre eux |
| **Admin Network** (Switch/Router) | Empêcher les postes de sniffer les échanges réseau (ex: annonces OSPF malveillantes) |
| **IP Phones** | Confidentialité des appels + priorisation du trafic (latence critique) |
| **Printers** | Impossible à sécuriser correctement : peuvent capturer des credentials NTLMv2, servir de pivot, ou être utilisés pour de la persistence |

## Anecdote — Physical Pentest via imprimante

Pendant le COVID, une imprimante piégée avec un reverse shell a été expédiée à la cible sous prétexte d'un "cadeau WFH". Connectée au réseau en quelques minutes, elle a reçu les credentials du Domain Admin via une authentification NTLMv2 automatique depuis un poste Windows.

Ce scénario aurait été bloqué par :
- Bloquer l'accès internet de l'imprimante
- Bloquer le port 445 entre postes et imprimantes
- Empêcher l'imprimante d'initier des connexions vers les workstations
