---
tags:
  - metasploit
  - red-team
  - course/htb-academy
---



```shell-session
msfconsole -q
```

Permet de lancer metasploit sans la bannière

```bash 
show payloads 
``` 

Permet de choisir le cas échéant le type de payload bind ou reverse.

Le payload Stage 0 permet d'initier la connexion ensuite le payload Stage1 peut etre plus conséquent. Le payload meterpreter est quand à lui plus stable et polyvalent. Il utilise une injection de DLL qui permet cette stabilité et d'être plus difficile à detecter. Inscrit en mémoire il n'est pas detectable sur le disque dur et permet la persistence.
