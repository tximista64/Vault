---
tags:
  - writeup/htb
  - ctf
  - forensics
  - memory-forensics
  - linux
---

What is the Linux kernel version of the provided image? (string


un grep sur le fichier brut

```bash
[Sep 25, 2025 - 22:22:24 (CEST)] exegol-ctf /workspace # strings -n 8 memdump.mem | egrep -i "Linux version|vmlinux|kallsyms|KERNEL|Linux|Windows NT|Microsoft|Win32|PAGE0" | head -n 60

ting `Debian GNU/Linux'
5.10.0-35-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.237-1 (2025-05-19)
```
