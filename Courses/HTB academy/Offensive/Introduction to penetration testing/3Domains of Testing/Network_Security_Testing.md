---
tags:
  - penetration-testing
  - networking
  - course/htb-academy
---

# Test de Sécurité Réseau (Network Security Testing)
Le **test d’intrusion réseau** (Network Penetration Testing) est une évaluation méthodique de la sécurité d’une infrastructure réseau, simulant des attaques réelles. Avant toute chose, il est crucial de comprendre l’architecture réseau de base, composée de routeurs, commutateurs, pare-feux, serveurs et terminaux. Chacun de ces composants peut contenir des failles compromettant la sécurité globale.
## Vulnérabilités Courantes des Réseaux
| Vulnérabilité                | Description |
|-----------------------------|-------------|
| Services mal configurés     | Services réseau avec identifiants par défaut, ports inutiles ouverts |
| Systèmes non mis à jour     | Logiciels obsolètes avec failles connues |
| Authentification faible     | Politiques de mot de passe faibles, absence de MFA |
| Protocoles non sécurisés    | Usage de FTP, Telnet ou HTTP sans chiffrement |
| Mauvaise segmentation       | Absence de cloisonnement entre zones sensibles |
| Interfaces de gestion exposées | Interfaces admin accessibles depuis internet |
| Contrôles de sécurité absents | Manque de pare-feu, IDS/IPS ou ACL |
## Étapes pratiques d’un test
1. **Collecte d'informations** : IP, domaines, systèmes via méthodes passives (OSINT) ou actives (scan réseau).
2. **Scan réseau** : avec Nmap pour détecter ports/services ouverts.
3. **Analyse des vulnérabilités** : avec des outils comme Nessus ou OpenVAS, puis validation manuelle.
4. **Exploitation** : tentative d’exploitation des failles trouvées sans endommager les systèmes (ex. : buffer overflow ou FTP anonyme).
5. **Escalade et mouvement latéral** : démonstration des accès obtenus et de la progression possible dans le réseau.
## Outils essentiels
- **Nmap** : pour la cartographie réseau
- **Nessus/OpenVAS** : scanners de vulnérabilités
- **Metasploit** : exploitation de failles
- **Wireshark** : analyse du trafic réseau
- **John the Ripper, Hashcat** : audit de mots de passe
## Protocoles à maîtriser
- **TCP/IP**, **UDP**, **ICMP**
- Protocoles applicatifs : **HTTP**, **FTP**, **SSH**, etc.
## Test de réseaux sans fil (WiFi)
Évaluation de la sécurité des réseaux WiFi :
- Analyse du chiffrement (**WEP**, **WPA2**, **WPA3**)
- Détection de points d’accès frauduleux
- Outils : **Aircrack-ng**, **Airmon-ng**
## Pièges à éviter
- Bâcler la phase de reconnaissance
- Se reposer uniquement sur les outils automatiques
- Négliger la validation manuelle des résultats
- Oublier la communication régulière avec le client
- Ne pas documenter les échecs ou faux positifs
Une documentation rigoureuse et une communication constante garantissent un test utile, sécurisé et compréhensible pour le client.
