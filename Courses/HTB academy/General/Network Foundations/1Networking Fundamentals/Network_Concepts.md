---
tags:
  - networking
  - osi-model
  - tcp-ip
  - course/htb-academy
---

# Network Concepts
Ce module présente les concepts fondamentaux du **networking**, expliquant comment il s'intègre à l'écosystème technologique moderne, basé en grande partie sur la **TCP/IP stack**. Les notions clés incluent les modèles **OSI** et **TCP/IP**, les protocoles réseau courants et les méthodes de transmission.
## OSI Model (7 couches)
1. **Physical Layer** : Transmission de bits bruts via le support physique (Ethernet, hubs, répéteurs).
2. **Data Link Layer** : Transfert **node-to-node**, adressage MAC, contrôle d'erreurs (switches, bridges).
3. **Network Layer** : Routage et adressage logique (IP), détermination des chemins (routers).
4. **Transport Layer** : Communication de bout en bout, fiabilité (TCP) ou rapidité (UDP).
5. **Session Layer** : Gestion, maintien et terminaison des sessions (APIs).
6. **Presentation Layer** : Traduction des données, chiffrement/déchiffrement, compression.
7. **Application Layer** : Services directs aux applications (HTTP, FTP, SMTP, DNS).
### Exemple
Envoi d'un fichier : Application → Présentation (chiffrement) → Session → Transport (segmentation) → Network (routage) → Data Link (encapsulation) → Physical (transmission).
## TCP/IP Model (4 couches)
1. **Link Layer** : Connexion physique et trames (Ethernet, Wi-Fi).
2. **Internet Layer** : Adressage IP, routage, ICMP.
3. **Transport Layer** : TCP/UDP pour communication fiable ou rapide.
4. **Application Layer** : HTTP, FTP, SMTP, DNS.
Comparaison : TCP/IP regroupe certaines couches OSI, conçu pour l’Internet, plus orienté applications.
### Exemple
Accès à un site : Application (HTTP) → Transport (TCP) → Internet (IP) → Link (transmission physique).
## Protocoles courants
- **HTTP** : Transfert de pages web (Application Layer).
- **FTP** : Transfert de fichiers (Application Layer).
- **SMTP** : Envoi d’e-mails (Application Layer).
- **TCP** : Transmission fiable (Transport Layer).
- **UDP** : Transmission rapide sans garantie (Transport Layer).
- **IP** : Routage des paquets (Internet Layer).
## Transmission
- **Types** : Analog (signal continu) / Digital (bits discrets).
- **Modes** :
- **Simplex** : Sens unique (clavier → PC).
- **Half-duplex** : Bidirectionnel mais alterné (talkie-walkie).
- **Full-duplex** : Bidirectionnel simultané (téléphone).
- **Médias** :
- Filaire : paires torsadées (Ethernet), coaxial, fibre optique.
- Sans fil : radio (Wi-Fi, cellulaire), micro-ondes (satellite), infrarouge (courtes distances).
![[Pasted image 20250811002940.png]]
