---
tags:
  - networking
  - penetration-testing
  - ftp
  - course/htb-academy
---

# Skill Assessment
Pour obtenir le programme en ecoute sur le port 5901 en local
```[us-academy-2]─[10.10.14.247]─[htb-ac-346891@htb-lky6euqqsj]─[~]
└──╼ [★]$ ss -ltpn | grep "5901"
LISTEN 0      5          127.0.0.1:5901      0.0.0.0:*    users:(("Xtigervnc",pid=2521,fd=9))
LISTEN 0      5              [::1]:5901         [::]:*    users:(("Xtigervnc",pid=2521,fd=10))
```
On a un accès anonyme au ftp
```ftp> debug
Debugging on (debug=1).
ftp> get Note-FRom-IT.txt
local: Note-FRom-IT.txt remote: Note-FRom-IT.txt
---> SIZE Note-FRom-IT.txt
213 438
ftp: setsockopt SO_DEBUG (ignored): Permission non accordée
---> EPSV
229 Entering Extended Passive Mode (|||49683|)
229 Entering Extended Passive Mode (|||49683|)
---> RETR Note-FRom-IT.txt
150 Opening ASCII mode data connection.
100% |****************************************************************************************************|   438        5.12 KiB/s    00:00 ETA
226 Transfer complete.
438 bytes received in 00:00 (5.10 KiB/s)
---> MDTM Note-FRom-IT.txt
213 20250209023729
remotemodtime: parsed time `20250209023729' as 1739068649, dim., 09 févr. 2025 03:37:29 +0100
ftp>
```
En examinant le fichier il faut un user agent custom pour accéder au fichier
```─tximista at zaworudo in ~/Bidouille 25-09-01 - 0:05:31
╰─○ cat Note-From-IT.txt
Bertolis,
The website is still under construction. To stop users from poking their nose where it doesn't belong, I've configured IIS to only allow requests
containing a specific user-agent header. If you'd like to test it out, please provide the following header to your HTTP request.
User-Agent: Server Administrator
The site should be finished within the next couple of weeks. I'll keep you posted.
Cheers,
jarednexgent
╭─tximista at zaworudo in ~/Bidouille 25-09-01 - 0:05:36
╰─○ curl -A "Server Administrator"  http://10.129.233.197
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>IIS Windows Server</title>
<style type="text/css">
<!--
body {
color:#000000;
background-color:#0072C6;
margin:0;
}
#container {
margin-left:auto;
margin-right:auto;
text-align:center;
}
a img {
border:none;
}
-->
</style>
</head>
<body>
<div id="container">
<a href="http://go.microsoft.com/fwlink/?linkid=66138&amp;clcid=0x409"><img src="iisstart.png" alt="IIS" width="960" height="600" /></a>
</div>
</body>
</html>
<!-- HTB{S00n_2_B_N3tw0rk1ng_GURU!} -->
```
