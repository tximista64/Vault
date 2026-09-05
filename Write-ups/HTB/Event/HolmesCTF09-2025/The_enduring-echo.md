---
tags:
  - writeup/htb
  - ctf
  - forensics
  - windows
  - log-analysis
  - timeline-analysis
  - chainsaw
---

The enduring echo


J'ai pas pris de note on a fait le chall a 2 on était bloqué sur le password forgé par JM.PS1 avec une timestamp précise. Avec chainsaw avec une recherche de BIAS j'ai réussi a dénouer le truc

```bash
 ./chainsaw search "Bias" /home/tximista/Téléchargements/The_Enduring_Echo/C/Windows/System32/winevt/logs/ --skip-errors > ultimaratio.txt
```
Et on trouve un CurrentBias: 420 soit 7 heures de décalage le flag était donc Watson_20250824160509.
