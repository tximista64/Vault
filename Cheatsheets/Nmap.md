
# Nmap Cheat Sheet

**tags**: #cheatsheet #nmap #réseau #enumeration #pentest

---

## Scanning Options

| Nmap Option          | Description                                           |
|----------------------|-------------------------------------------------------|
| `10.10.10.0/24`      | Target network range                                  |
| `-sn`                | Disables port scanning                                |
| `-Pn`                | Disables ICMP Echo Requests                           |
| `-n`                 | Disables DNS resolution                               |
| `-PE`                | Ping scan using ICMP Echo Requests                    |
| `--packet-trace`     | Shows all packets sent and received                   |
| `--reason`           | Displays reason for results                           |
| `--disable-arp-ping` | Disables ARP Ping Requests                            |
| `--top-ports=<num>`  | Scans specified top frequent ports                    |
| `-p-`                | Scan all ports                                        |
| `-p22-110`           | Scan ports from 22 to 110                             |
| `-p22,25`            | Scan ports 22 and 25                                  |
| `-F`                 | Scan top 100 ports                                    |
| `-sS`                | TCP SYN scan                                          |
| `-sA`                | TCP ACK scan                                          |
| `-sU`                | UDP scan                                              |
| `-sV`                | Service version detection                             |
| `-sC`                | Default script scan                                   |
| `--script <script>`  | Scan using specified scripts                          |
| `-O`                 | OS detection                                          |
| `-A`                 | OS, service detection, traceroute                     |
| `-D RND:5`           | Use random decoys                                     |
| `-e`                 | Specify network interface                             |
| `-S 10.10.10.200`    | Specify source IP                                     |
| `-g`                 | Specify source port                                   |
| `--dns-server <ns>`  | Use specified DNS server                              |

---

## Output Options

| Nmap Option | Description                                               |
|-------------|-----------------------------------------------------------|
| `-oA filename` | Save results in all formats (normal, grepable, XML)      |
| `-oN filename` | Save results in normal format                            |
| `-oG filename` | Save results in grepable format                          |
| `-oX filename` | Save results in XML format                               |

---

## Performance Options

| Nmap Option                   | Description                                       |
|-------------------------------|---------------------------------------------------|
| `--max-retries <num>`         | Set retries per port                              |
| `--stats-every=5s`            | Display scan status every 5 seconds               |
| `-v/-vv`                      | Verbose output                                    |
| `--initial-rtt-timeout 50ms`  | Initial RTT timeout                               |
| `--max-rtt-timeout 100ms`     | Max RTT timeout                                   |
| `--min-rate 300`              | Packets sent simultaneously                       |
| `-T <0-5>`                    | Timing template                                   |

---
