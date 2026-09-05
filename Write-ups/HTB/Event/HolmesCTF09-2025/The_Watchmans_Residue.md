---
tags:
  - writeup/htb
  - ctf
  - forensics
  - windows
  - incident-response
  - log-analysis
  - credential-theft
---

# Rapport Forensique — CENTRAL-WS-5

## PCAPNG

Rapidement traité avec strings sur le fichier et wireshark follow http stream on voit un prompt injection sur un chatbot AI custom par un certain JM se faisant passer pour un technicien et exfiltré le couple login/creds d'un RMM

## Résumé exécutif
L'attaquant a accédé à CENTRAL-WS-5 via TeamViewer, a déposé des outils (mimikatz, JM.exe, WebBrowserPassView) sous `C:\Windows\Temp\safe`, a stagé des fichiers sensibles sous `C:\Windows\Temp\flyover` puis les a exfiltrés via la fonction "Send file" de TeamViewer (rafale d'envois à 2025-08-20 11:12:07–11:12:08). Les preuves proviennent des logs TeamViewer et des événements Windows fournis.

---

## Timeline (horodatages extraits des logs)
- **2025-08-20 09:58:51.414352Z** — ProcessCreationTime lié au browser-credential harvester (EventID 5379).  
- **2025-08-20 10:03:33.405433Z** — Event DPAPI / credential-access lié au zip du navigateur (EventID 5379).  
  - **Durée d'exécution du browser-harvester** : **281991 ms** (différence entre les deux timestamps ci-dessus).

- **2025-08-20 11:02:50 – 11:02:51** — Dépôt / téléchargement des outils sur la machine : `C:\Windows\Temp\safe\mimikatz.exe`, `JM.exe`, `webbrowserpassview.zip`.  
- **2025-08-20 11:12:07.902** — `Send file C:\Windows\Temp\flyover\COG-HR-EMPLOYEES.pdf`. *(TeamViewer log)*  
- **2025-08-20 11:12:08.013** — `Send file C:\Windows\Temp\flyover\dump.txt`. *(TeamViewer log)*  
- **2025-08-20 11:12:08.030** — `Send file C:\Windows\Temp\flyover\Heisen-9 remote snapshot.kdbx`. *(TeamViewer log)*

---

## Faits établis
1. Outils malveillants livrés sur l'hôte (`C:\Windows\Temp\safe\...`).  
2. Un outil de récolte de credentials navigateur a été exécuté (EventID 5379), runtime mesuré = **281991 ms**.  
3. Plusieurs fichiers sensibles ont été stagés dans `C:\Windows\Temp\flyover` puis exfiltrés via TeamViewer entre **2025-08-20 11:12:07.902** et **2025-08-20 11:12:08.030**.  
4. Mimikatz a été déposé (`mimikatz.exe`) — dépôt prouvé, exécution non confirmée dans les EVTX fournis (aucun 4688 clair nommant `mimikatz.exe`).

---

## IOCs et chemins
- `C:\Windows\Temp\safe\mimikatz.exe`  
- `C:\Windows\Temp\safe\JM.exe`  
- `C:\Windows\Temp\safe\webbrowserpassview.zip`  
- `C:\Windows\Temp\flyover\dump.txt` — exfiltré à `2025-08-20 11:12:08.013`  
- `C:\Windows\Temp\flyover\Heisen-9 remote snapshot.kdbx` — exfiltré à `2025-08-20 11:12:08.030`  
- TeamViewer file transfer entries: `Send file` lines (voir TeamViewer15_Logfile.log)

---

## Limites
- Les EVTX fournis ne contiennent pas d'événement 4688/4689 explicitant la création/termination d'un process `mimikatz.exe` (possible renommage, exécution en mémoire, ou logs manquants).  
- Le contenu de `dump.txt` et de `Heisen-9 remote snapshot.kdbx` n'est pas inclus dans les logs

Je n'arrive pas à aller plus loin
