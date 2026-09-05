---
tags:
  - metasploit
  - meterpreter
  - course/htb-academy
---

On peux interagir avec les sessions crées


```bash  
msf6 exploit(windows/smb/psexec_psh) > sessions

Active sessions
===============

  Id  Name  Type                     Information                 Connection
  --  ----  ----                     -----------                 ----------
  1         meterpreter x86/windows  NT AUTHORITY\SYSTEM @ MS01  10.10.10.129:443 -> 10.10.10.205:50501 (10.10.10.205)
``` 
  
```shell-session
msf6 exploit(windows/smb/psexec_psh) > sessions -i 1
[*] Starting interaction with 1...

meterpreter > 
```

J'utilise perso la commande bg alias de background pour mettre la session (souvent meterpreter )
 en arrière plan.
