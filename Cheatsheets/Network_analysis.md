# Network Traffic Analysis - Cheat Sheet

**tags**: #cheatsheet #réseau #tcpdump #wireshark #tshark #analyse #pcap

---

## Général

> ⚠️ La plupart des commandes nécessitent des droits `sudo` pour capturer l’interface réseau ou activer le mode promiscuité.

---

## Tcpdump - Commandes de base

| Command                                           | Description                                       |
|---------------------------------------------------|---------------------------------------------------|
| `tcpdump --version`                              | Affiche la version de tcpdump/libpcap            |
| `tcpdump -h`                                     | Aide                                             |
| `tcpdump -D`                                     | Liste les interfaces réseau                      |
| `tcpdump -i <interface>`                         | Capture sur une interface                        |
| `tcpdump -i <int> -w file.pcap`                  | Écrit la capture dans un fichier `.pcap`         |
| `tcpdump -r file.pcap`                           | Lit un fichier `.pcap`                           |
| `tcpdump -r/-w file.pcap -l | grep 'string'`     | Live capture avec filtrage via `grep`            |
| `tcpdump -i <int> host <ip>`                     | Filtre par hôte                                  |
| `tcpdump -i <int> port <#>`                      | Filtre par port                                  |
| `tcpdump -i <int> proto <#|tcp|udp|icmp>`        | Filtre par protocole                             |

---

## Tcpdump - Options utiles

| Option         | Description                                               |
|----------------|-----------------------------------------------------------|
| `-n`           | Ne pas résoudre les noms d’hôtes                          |
| `-nn`          | Ne pas résoudre noms + ports                              |
| `-e`           | Inclure l'en-tête Ethernet                                |
| `-X`, `-XX`    | Contenu des paquets en hex/ascii                          |
| `-v`, `-vv`, `-vvv` | Verbosité croissante                              |
| `-c`           | Capturer X paquets puis quitter                           |
| `-s`           | Taille de la capture (snaplen)                            |
| `-S`           | Affiche les numéros de séquence absolus                   |
| `-q`           | Moins d’info protocolaire                                 |
| `host`, `src`, `dst`, `net`, `port`, `portrange` | Filtres classiques    |
| `and`, `or`, `not` | Combinaisons logiques                                |

---

## TShark - Commandes

| Command                                           | Description                                      |
|---------------------------------------------------|--------------------------------------------------|
| `tshark -h`                                       | Aide                                             |
| `tshark -D`                                       | Liste les interfaces                            |
| `tshark -i <int>`                                 | Capture depuis une interface                     |
| `-f "host x.x.x.x"`                               | Filtre BPF lors de la capture                    |
| `-c <nb>`                                         | Capture X paquets                                |
| `-a duration:60`                                  | Stop après durée, taille ou nombre               |
| `-r file.pcap`                                    | Lire un fichier                                  |
| `-W file.pcapng`                                  | Écriture en pcapng                               |
| `-x`                                              | Ajoute affichage HEX + ASCII                     |

---

## Wireshark - Filtres de capture

| Filtre                  | Description                                      |
|-------------------------|--------------------------------------------------|
| `host x.x.x.x`          | Filtre pour un hôte                             |
| `net x.x.x.x/24`        | Réseau                                           |
| `src net` / `dst net`   | Source ou destination réseau                    |
| `port 80`               | Filtre par port                                  |
| `not port 80`           | Exclure un port                                  |
| `and`, `or`, `not`      | Combinaisons logiques                            |
| `portrange 0-1024`      | Plage de ports                                   |
| `ip`, `ether`, `tcp`    | Par protocole                                    |
| `broadcast`, `multicast`, `unicast` | Types de trafic                     |

---

## Wireshark - Filtres d'affichage

| Filtre                        | Description                                |
|-------------------------------|--------------------------------------------|
| `ip.addr == x.x.x.x`         | IP source ou destination                   |
| `ip.src == x.x.x.x`          | IP source                                  |
| `ip.dst == x.x.x.x`          | IP destination                             |
| `dns`, `tcp`, `ftp`, `arp`   | Par protocole                              |
| `tcp.port == 80`             | Port spécifique                            |
| `src.port == x` / `dst.port == x` | Source ou destination port           |
| `tcp.stream eq #`            | Suivre un flux TCP                         |
| `http`, `http && image-jfif` | Trafic HTTP ou HTTP avec image             |
| `ftp`, `ftp.request.command` | FTP contrôle                               |

---

## Ports & Protocoles connus

| Port | Protocole | Description                             |
|------|-----------|-----------------------------------------|
| 20   | FTP-Data  | Transfert de fichiers FTP               |
| 21   | FTP       | Commandes FTP                           |
| 22   | SSH       | Connexion sécurisée                     |
| 23   | Telnet    | Connexion distante non sécurisée        |
| 25   | SMTP      | Envoi d’e-mails                         |
| 53   | DNS       | Résolution de noms                      |
| 69   | TFTP      | Transfert de fichiers simplifié         |
| 80   | HTTP      | Web en clair                            |
| 88   | Kerberos  | Authentification réseau                 |
| 110  | POP3      | Récupération d’e-mails                  |
| 111  | RPC       | Appels distants                         |
| 115  | SFTP      | FTP via SSH                             |
| 123  | NTP       | Synchronisation de temps réseau         |
| 137  | Netbios-NS| Résolution de noms local                |
| 139  | Netbios-SSN| Services de session SMB                |
| 179  | BGP       | Routage inter-domaine                   |
| 389  | LDAP      | Annuaire centralisé                     |
| 443  | HTTPS     | Web sécurisé (SSL/TLS)                  |
| 445  | SMB       | Partages de fichiers, imprimantes, etc. |

---

## Commandes diverses

| Command                          | Description                                 |
|----------------------------------|---------------------------------------------|
| `sudo *`                        | Exécute avec privilèges                      |
| `which <tool>`                 | Vérifie si un outil est installé             |
| `sudo apt install <tool>`      | Installe un outil                            |
| `man <outil>`                  | Manuel de l’outil                            |

---

