---
tags:
  - writeup/htb
  - ctf
  - forensics
  - digital-forensics
  - linux
  - rootkit
  - ld-preload
---

# Suspicious Threat


## Enoncé

Our SSH server is showing strange library linking errors, and critical folders seem to be missing despite their confirmed existence. Investigate the anomalies in the library loading process and filesystem. Look for hidden manipulations that could indicate a userland rootkit. Creds: `root:hackthebox`

### Contexte

```bash 
root@ng-828556-forensicssuspiciousthreatmp-16orr-f8d4887fb-jlg8v:~# id
uid=0(root) gid=0(root) groups=0(root)
root@ng-828556-forensicssuspiciousthreatmp-16orr-f8d4887fb-jlg8v:~# uname -a
Linux ng-828556-forensicssuspiciousthreatmp-16orr-f8d4887fb-jlg8v 6.1.0-10-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.37-1 (2023-07-03) x86_64 x86_64 x86_64 GNU/Linux 
root@ng-828556-forensicssuspiciousthreatmp-1qv4w-55bc4b5696-dscr8:~# find / -type f -name flag.txt 2>/dev/null  
root@ng-828556-forensicssuspiciousthreatmp-1qv4w-55bc4b5696-dscr8:~#
```  

### Fichier de pré chargement des librairies 

Le rôle de /etc/ld.so.preload

Sous Linux, lorsqu’un programme dynamique est lancé, le linker dynamique (ld-linux.so) charge en mémoire les bibliothèques partagées nécessaires (par exemple libc.so.6).

Si le fichier /etc/ld.so.preload existe et contient des chemins vers des bibliothèques, ces bibliothèques sont injectées avant toutes les autres, quelle que soit la commande exécutée.

Cela signifie que tout programme utilisant la libc va d’abord utiliser le code défini dans le .so listé dans ce fichier.

```bash 
root@ng-828556-forensicssuspiciousthreatmp-16orr-f8d4887fb-jlg8v:~# ls -l /etc/ld.so.preload 2>/dev/null || echo "no ld.so.preload"  
-rw-r--r-- 1 root root 37 Jul 24  2024 /etc/ld.so.preload  
root@ng-828556-forensicssuspiciousthreatmp-16orr-f8d4887fb-jlg8v:~# cat /etc/ld.so.preload 2>/dev/null    
/lib/x86_64-linux-gnu/libc.hook.so.6  
root@ng-828556-forensicssuspiciousthreatmp-16orr-f8d4887fb-jlg8v:~#
```

Non vide... On penche pour un rootkit userland qui va agir au niveau des bibliothèques partagées et du système utilisateur et non du noyau

Du coup pas besoin d'un module kernel, facile à installer en root et  de surcroît facile à cacher car la perception que l'utilisateur a du système est biaisée!


On désactive le hook en vidant le fichier et on reconstruit le cache de bibilothèque.

```bash
root@ng-828556-forensicssuspiciousthreatmp-1qv4w-55bc4b5696-dscr8:/var# : > /etc/ld.so.preload  
root@ng-828556-forensicssuspiciousthreatmp-1qv4w-55bc4b5696-dscr8:/var# ldconfig
```

on logout puis se reconnecte et

```bash
root@ng-828556-forensicssuspiciousthreatmp-1qv4w-55bc4b5696-dscr8:~# find / -type f -name flag.txt 2>/dev/null  
/var/pr3l04d_/flag.txt
root@ng-828556-forensicssuspiciousthreatmp-1qv4w-55bc4b5696-dscr8:~# cat /var/pr3l04d_/flag.txt    
HTB{Us3rL4nd_R00tK1t_R3m0v3dd!}

``` 


