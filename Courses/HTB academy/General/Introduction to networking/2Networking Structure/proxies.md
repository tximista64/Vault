---
tags:
  - networking
  - osi-model
  - proxy
  - penetration-testing
  - course/htb-academy
---

# Proxies

Un **proxy** est un dispositif ou service qui s'intercale dans une connexion et agit en **médiateur** — il doit pouvoir inspecter le contenu du trafic. Sans cette capacité d'inspection, on parle de **gateway**, pas de proxy.

Les proxies opèrent presque toujours au **Layer 7 du modèle OSI**.

> ⚠️ Changer d'adresse IP ≠ proxy. C'est généralement un VPN — erreur très répandue.

---

## Forward Proxy (Dedicated Proxy)

Le client envoie ses requêtes **via** le proxy, qui les transmet à Internet.

Cas d'usage :
- **Entreprise** : les postes sensibles n'ont pas d'accès direct à Internet — ils passent par un web filter/proxy. Efficace contre les malwares car ceux-ci doivent être **proxy-aware** pour fonctionner.
  - Les navigateurs Chrome/Edge/IE respectent le "System Proxy" et utilisent **WinSock** → malware natif Windows souvent proxy-aware automatiquement.
  - Firefox utilise **libcurl** (non-WinSock) → malware doit chercher spécifiquement les settings Firefox, ce qui est rare.
  - Malware via **DNS as C2** : détectable facilement avec Sysmon.
- **Pentest** : BurpSuite — forward proxy HTTP par défaut, mais configurable en reverse ou transparent.

## Reverse Proxy

Filtre le trafic **entrant** et le redirige vers un réseau interne fermé.

Cas d'usage :
- **Cloudflare** : absorbe les DDoS, filtre le trafic avant qu'il atteigne les webserveurs. Peut aussi agir comme **WAF** (nécessite de déchiffrer le trafic HTTPS).
- **ModSecurity** : WAF — inspecte les requêtes web et bloque le contenu malveillant (voir ModSecurity Core Rule Set).
- **Pentest** : reverse proxy sur un endpoint compromis pour faire rebondir les connexions vers l'attaquant via un SSH tunnel — contourne les firewalls et évite les **IDS** (Intrusion Detection Systems) qui surveillent le trafic web externe.

## Transparent vs Non-Transparent Proxy

- **Transparent proxy** : le client ne sait pas qu'il existe — le proxy intercepte silencieusement les communications.
- **Non-transparent proxy** : le client est configuré pour utiliser explicitement le proxy.

Dans les deux cas, le proxy se présente comme partenaire de communication vis-à-vis de l'extérieur.
