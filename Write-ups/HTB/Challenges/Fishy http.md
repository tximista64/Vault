---
tags:
  - writeup/htb
  - ctf
  - forensics
  - network-forensics
  - reverse-engineering
  - dotnet
  - pcap-analysis
---

## Contexte

I found a suspicious program on my computer making HTTP requests to a web server. Please review the provided traffic capture and executable file for analysis. (Note: Flag has two parts)
## Analyse pcapng 
Un flux http qui laisse présager une exfiltration
![](Screenshot_20250913_232041.png)
## Déchiffrement


```bash

╭─tximista at zaworudo in ~/Téléchargements 25-09-13 - 23:21:38
╰─○ nvim cat.py    
╭─tximista at zaworudo in ~/Téléchargements 25-09-13 - 23:32:55
╰─○ ./cat.py input.txt 
IFZvbHVtZSBpbiBkcml2ZSBDIGhhcyBubyBsYWJlbC4NCiBWb2x1bWUgU2VyaWFsIE51bWJlciBpcyBBMDc5LUFERkINCg0KIERpcmVjdG9yeSBvZiBDOlxUZW1wDQoNCjA1LzA3LzIwMjQgIDA5OjIyIEFNICAgIDxESVI+ICAgICAgICAgIC4NCjA1LzA3LzIwMjQgIDA5OjIyIEFNICAgIDxESVI+ICAgICAgICAgIC4uDQowNS8wNy8yMDI0ICAwNzoyMyBBTSAgICAgICAgNjcsNTE1LDc0NCBzbXBob3N0LmV4ZQ0KICAgICAgICAgICAgICAgMSBGaWxlKHMpICAgICA2Nyw1MTUsNzQ0IGJ5dGVzDQogICAgICAgICAgICAgICAyIERpcihzKSAgMjksNjM4LDUyMCw4MzIgYnl0ZXMgZnJlZQ0KJ2g3N1BfczczNDE3aHlfcmV2U0hFTEx9JyANCg==
╭─tximista at zaworudo in ~/Téléchargements 25-09-13 - 23:33:00
╰─○ echo 'IFZvbHVtZSBpbiBkcml2ZSBDIGhhcyBubyBsYWJlbC4NCiBWb2x1bWUgU2VyaWFsIE51bWJlciBpcyBBMDc5LUFERkINCg0KIERpcmVjdG9yeSBvZiBDOlxUZW1wDQoNCjA1LzA3LzIwMjQgIDA5OjIyIEFNICAgIDxESVI+ICAgICAgICAgIC4NCjA1LzA3LzIwMjQgIDA5OjIyIEFNICAgIDxESVI+ICAgICAgICAgIC4uDQowNS8wNy8yMDI0ICAwNzoyMyBBTSAgICAgICAgNjcsNTE1LDc0NCBzbXBob3N0LmV4ZQ0KICAgICAgICAgICAgICAgMSBGaWxlKHMpICAgICA2Nyw1MTUsNzQ0IGJ5dGVzDQogICAgICAgICAgICAgICAyIERpcihzKSAgMjksNjM4LDUyMCw4MzIgYnl0ZXMgZnJlZQ0KJ2g3N1BfczczNDE3aHlfcmV2U0hFTEx9JyANCg==' | base64 -d
 Volume in drive C has no label.
 Volume Serial Number is A079-ADFB

 Directory of C:\Temp

05/07/2024  09:22 AM    <DIR>          .
05/07/2024  09:22 AM    <DIR>          ..
05/07/2024  07:23 AM        67,515,744 smphost.exe
               1 File(s)     67,515,744 bytes
               2 Dir(s)  29,638,520,832 bytes free
'h77P_s73417hy_revSHELL}' 
```

C'est probablement la deuxième partie du flag. On va sortir ida pour la première partie.

## Analyse PE
Dans Ida rien de croustillant
.rdata:00000001406E61A0	00000007	C	.rdata
.rdata:00000001406E61AC	00000006	C	.meta
.rdata:00000001406E63BE	00000005	C	91BMT
.rdata:00000001406E63E0	0000002C	C	Microsoft-DotNETCore-EventPipeConfiguration
.rdata:00000001406E6410	00000020	C	Microsoft-Windows-DotNETRuntime
.rdata:00000001406E6430	00000024	C	Microsoft-DotNETCore-SampleProfiler
.rdata:00000001406E6458	0000001F	C	Microsoft-DotNETCore-EventPipe
.rdata:00000001406E6478	00000027	C	Microsoft-Windows-DotNETRuntimePrivate
.rdata:00000001406E64A0	00000027	C	Microsoft-Windows-DotNETRuntimeRundown

et merde du dotnet il va faloir sortir dotpeek

![](Screenshot_20250914_000423.png)
On trouve un dictionnaire qui correspond étrangement a des balises vu dans le flux html du pcapng...

![](Screenshot_20250914_001512.png)
On modifie le fichier imput.txt avec le contenu du flux http avec les balises

```bash
tximista at zaworudo in ~/Téléchargements 25-09-14 - 0:11:39  
╰─○ chmod +x decode_tags.py     
╭─tximista at zaworudo in ~/Téléchargements 25-09-14 - 0:11:46  
╰─○ ./decode_tags.py input.txt    
[+] Captured tags: 167 (sample: ['ol', 'li', 'span', 'button', 'p', 'p', 'cite', 'p', 'ol', 'li'])  
[+] Hex: 6972202626206364205c55736572735c70616b6379626572626f745c446f63756d656e74735c2026262074797065204854427b54683474735f6430376e33375f  
[+] Bytes: b'ir && cd \\Users\\pakcyberbot\\Documents\\ && type HTB{Th4ts_d07n37_'  
[+] ASCII: ir && cd \Users\pakcyberbot\Documents\ && type HTB{Th4ts_d07n37_
```

