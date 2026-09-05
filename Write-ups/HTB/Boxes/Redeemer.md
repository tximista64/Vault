---
tags:
  - writeup/htb
  - ctf
  - redis
  - database
  - misconfiguration
---

# Redeemer

Première fois confronté à redis, on utilise la synthaxe `redis-cli -h 10.129.181.250`  , on utilise la commande info pour obtenir info et stats

La commande keys * montre toutes les clef en faisant Get nom de la clef on obtiens le flag

![Capture d'écran 2024-10-07 205429.png](Capture_dcran_2024-10-07_205429.png)

