---
tags:
  - networking
  - dns
  - course/htb-academy
---

# Domain Name System (DNS)
Le **Domain Name System (DNS)** est comme l’annuaire téléphonique d’Internet.
Il permet de trouver le bon numéro (**adresse IP**) correspondant à un nom de domaine (par ex. `www.google.com`).
Sans DNS, nous devrions mémoriser de longues adresses IP complexes pour chaque site web.
---
## Domain Names vs. IP Addresses
| Adresse       | Description |
|---------------|-------------|
| **Domain Name** | Une adresse lisible, comme `www.example.com`, facile à retenir pour les humains. |
| **IP Address**  | Une étiquette numérique, ex. `93.184.216.34`. |
👉 Le DNS fait le lien entre les deux : on peut taper `www.google.com` sans retenir l’IP sous-jacente.
---
## DNS Hierarchy
Le DNS est organisé comme un arbre, depuis la **racine** jusqu’aux sous-domaines.
| Niveau                  | Description |
|--------------------------|-------------|
| **Root Servers**         | Le sommet de la hiérarchie DNS. |
| **Top-Level Domains (TLDs)** | `.com`, `.org`, `.net`, ou codes pays comme `.uk`, `.de`. |
| **Second-Level Domains** | Par ex. `example` dans `example.com`. |
| **Subdomains / Hostname** | Par ex. `www` dans `www.example.com`, ou `accounts` dans `accounts.google.com`. |
📌 Exemple d’URL :
`https://www.example.com/page.html`
- **Scheme** : https
- **Subdomain** : www
- **2nd-Level Domain** : example
- **Top-Level Domain** : com
- **Page name** : page.html
- **Root** : /
---
## DNS Resolution Process (Domain Translation)
Quand on saisit un domaine dans le navigateur, il doit être traduit en IP.
C’est le processus de **DNS resolution** (traduction de domaine).
| Étape | Description                                                                                 |
| ----- | ------------------------------------------------------------------------------------------- |
| **1** | On tape `www.example.com` dans le navigateur.                                               |
| **2** | Le PC vérifie son **cache DNS local**.                                                      |
| **3** | Si absent, il interroge un **serveur DNS récursif** (ISP ou service comme Google DNS).      |
| **4** | Le serveur récursif contacte un **Root Server**, qui indique le TLD approprié (ex. `.com`). |
| **5** | Le **TLD Name Server** redirige vers le **serveur faisant autorité** pour `example.com`.    |
| **6** | Le **serveur faisant autorité** répond avec l’IP de `www.example.com`.                      |
| **7** | Le serveur récursif renvoie l’IP au PC → connexion établie.                                 |
⏱️ Tout ce processus se fait en **fractions de seconde**.
---
## Exemple
👉 Sans DNS : pour visiter `www.example.com`, il faudrait taper directement `93.184.216.34`.
👉 Avec DNS : on tape `www.example.com` et le système résout automatiquement vers l’adresse IP.
Diagramme typique :
Utilisateur → DNS Resolver → Root Server → TLD Server → Authoritative Server → Retour IP → Connexion site web.
![[Pasted image 20250831211234.png]]
