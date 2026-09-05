---
tags:
  - networking
  - dns
  - nat
  - tcp-ip
  - course/htb-academy
---

# Exemple de flux de données (Data Flow)
Ce document illustre les différentes étapes techniques lorsqu’un utilisateur accède à un site web via un modèle client-serveur. Voici le détail de chaque phase :
## 1. Connexion à Internet
L’utilisateur se connecte via le réseau WLAN domestique :
- Sélection du SSID approprié
- Authentification via WPA2/WPA3
- Attribution automatique de l’adresse IP grâce au protocole **DHCP**
## 2. Attribution IP locale (DHCP)
- Si l’ordinateur n’a pas d’adresse IP, il en fait la demande.
- Le routeur attribue une adresse IP privée (ex: 192.168.1.10), un **subnet mask**, une **gateway**, et une **DNS**.
## 3. Résolution DNS
- L’utilisateur tape une URL (ex: www.example.com).
- Le système effectue une **DNS query** pour obtenir l’adresse IP publique du serveur (ex: 93.184.216.34).
## 4. Encapsulation des données
Les couches du modèle OSI/TCP-IP encapsulent la requête HTTP :
- **Application Layer** : génération de la requête HTTP(S)
- **Transport Layer** : encapsulation dans un segment **TCP**
- **Internet Layer** : encapsulation dans un paquet **IP**
- **Link Layer** : encapsulation dans une trame Ethernet ou Wi-Fi avec les adresses **MAC**
## 5. Network Address Translation (NAT)
- Le routeur traduit l’adresse IP source privée vers son IP publique (ex: 203.0.113.45) via le mécanisme de **NAT**
- Le paquet est ensuite envoyé via l’ISP à travers Internet.
## 6. Réception par le serveur
- Le **firewall** du serveur vérifie la légitimité du paquet.
- Le serveur Web (Apache, Nginx…) traite la requête et envoie la page demandée.
## 7. Réponse et décapsulation
- Le paquet revient en sens inverse.
- Le **router** fait la traduction inverse (NAT) pour renvoyer la réponse au bon client.
- Le navigateur **décapsule** les couches pour afficher le contenu HTML/CSS/JS.
---
Ce flux illustre les bases indispensables pour comprendre la communication réseau moderne, en particulier dans les environnements sécurisés avec pare-feu, DNS, NAT, et architecture client-serveur.
