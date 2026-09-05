
# Footprinting Cheat Sheet

**tags**: #cheatsheet #footprinting #enumeration #pentest #réseau #ftp #smb #curl #snmp #smtp #dns #mysql 

---

## Infrastructure-based Enumeration

| Command                                              | Description                         |
|------------------------------------------------------|-------------------------------------|
| `curl -s https://crt.sh/?q=<target-domain>&output=json \| jq .` | Certificate transparency enumeration |
| `for i in $(cat ip-addresses.txt); do shodan host $i; done` | Scan IPs using Shodan |

---

## Host-based Enumeration

### FTP
| Command                                                | Description                             |
|--------------------------------------------------------|-----------------------------------------|
| `ftp <FQDN/IP>`                                        | Interact with FTP service               |
| `nc -nv <FQDN/IP> 21`                                  | Netcat interaction with FTP             |
| `telnet <FQDN/IP> 21`                                  | Telnet interaction with FTP             |
| `openssl s_client -connect <FQDN/IP>:21 -starttls ftp` | Encrypted FTP interaction               |
| `wget -m --no-passive ftp://anonymous:anonymous@<target>` | Download files from FTP anonymously     |

### SMB
| Command                                              | Description                             |
|------------------------------------------------------|-----------------------------------------|
| `smbclient -N -L //<FQDN/IP>`                        | Null session SMB enumeration            |
| `smbclient //<FQDN/IP>/<share>`                      | Connect to SMB share                    |
| `rpcclient -U "" <FQDN/IP>`                          | RPC interaction                         |
| `samrdump.py <FQDN/IP>`                              | Username enumeration with Impacket      |
| `smbmap -H <FQDN/IP>`                                | SMB share enumeration                   |
| `crackmapexec smb <FQDN/IP> --shares -u '' -p ''`    | Enumerate shares via null session       |
| `enum4linux-ng.py <FQDN/IP> -A`                      | SMB enumeration with enum4linux         |

### NFS
| Command                                        | Description                            |
|------------------------------------------------|----------------------------------------|
| `showmount -e <FQDN/IP>`                       | Show available NFS shares              |
| `mount -t nfs <FQDN/IP>:/<share> ./target-NFS/ -o nolock` | Mount NFS share                        |
| `umount ./target-NFS`                          | Unmount NFS share                      |

### DNS
| Command                                         | Description                                 |
|-------------------------------------------------|---------------------------------------------|
| `dig ns <domain.tld> @<nameserver>`             | NS query                                    |
| `dig any <domain.tld> @<nameserver>`            | ANY query                                   |
| `dig axfr <domain.tld> @<nameserver>`           | AXFR DNS zone transfer                      |
| `dnsenum --dnsserver <ns> --enum -p 0 -s 0 -o found_subdomains.txt -f subdomains.list <domain.tld>` | Subdomain brute forcing |

### SMTP
| Command                    | Description             |
|----------------------------|-------------------------|
| `telnet <FQDN/IP> 25`      | SMTP interaction        |

### IMAP/POP3
| Command                                               | Description                              |
|-------------------------------------------------------|------------------------------------------|
| `curl -k 'imaps://<FQDN/IP>' --user <user>:<pass>`    | IMAPS login via curl                     |
| `openssl s_client -connect <FQDN/IP>:imaps`           | Connect IMAPS                            |
| `openssl s_client -connect <FQDN/IP>:pop3s`           | Connect POP3s                            |

### SNMP
| Command                                              | Description                             |
|------------------------------------------------------|-----------------------------------------|
| `snmpwalk -v2c -c <community> <FQDN/IP>`             | Query SNMP OIDs                         |
| `onesixtyone -c community-strings.list <FQDN/IP>`    | Brute force SNMP community strings      |
| `braa <community>@<FQDN/IP>:.1.*`                    | Brute force SNMP OIDs                   |

### MySQL
| Command                                    | Description                             |
|--------------------------------------------|-----------------------------------------|
| `mysql -u <user> -p<password> -h <FQDN/IP>`| MySQL login                             |

### MSSQL
| Command                                                | Description                             |
|--------------------------------------------------------|-----------------------------------------|
| `mssqlclient.py <user>@<FQDN/IP> -windows-auth`        | MSSQL login with Windows authentication |

### IPMI
| Command                                             | Description                             |
|-----------------------------------------------------|-----------------------------------------|
| `msf6 auxiliary(scanner/ipmi/ipmi_version)`         | Detect IPMI version                     |
| `msf6 auxiliary(scanner/ipmi/ipmi_dumphashes)`      | Dump IPMI hashes                        |

### Linux Remote Management
| Command                                            | Description                             |
|----------------------------------------------------|-----------------------------------------|
| `ssh-audit.py <FQDN/IP>`                           | SSH security audit                      |
| `ssh <user>@<FQDN/IP>`                             | SSH login                               |
| `ssh -i private.key <user>@<FQDN/IP>`              | SSH login with private key              |
| `ssh <user>@<FQDN/IP> -o PreferredAuthentications=password` | Enforce password auth          |

### Windows Remote Management
| Command                                              | Description                             |
|------------------------------------------------------|-----------------------------------------|
| `rdp-sec-check.pl <FQDN/IP>`                         | Check RDP security                      |
| `xfreerdp /u:<user> /p:"<pass>" /v:<FQDN/IP>`        | Connect to RDP                          |
| `evil-winrm -i <FQDN/IP> -u <user> -p <pass>`        | Connect via WinRM                       |
| `wmiexec.py <user>:"<pass>"@<FQDN/IP> "<command>"`   | Execute via WMI                         |

### Oracle TNS
| Command                                                        | Description                             |
|----------------------------------------------------------------|-----------------------------------------|
| `./odat.py all -s <FQDN/IP>`                                   | Oracle DB service scans                 |
| `sqlplus <user>/<pass>@<FQDN/IP>/<db>`                         | Oracle DB login                         |
| `./odat.py utlfile -s <FQDN/IP> -d <db> -U <user> -P <pass> --sysdba --putFile C:\path file.txt ./file.txt` | Upload file via Oracle |

---
