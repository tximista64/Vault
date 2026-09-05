---
tags:
  - log-analysis
  - firewall
  - soc
  - course/lets-defend
---

# Firewall Log Analysis


Firewalls are physical or virtual devices that control incoming and outgoing 
packets on the network according to rules created depending on the 
network’s cyber policies. Each system/server may have its own firewall 
application, or a public facing firewall device may be placed for 
central management of the network in large organizations. In this way, 
network communication primarily passes through the firewall and reaches 
its destination according to the rules determined on the firewall setup.

In this sense, firewalls are one of the most important security 
components as it controls network access in organizations. Therefore, it
 is extremely important for the SOC Analyst to be able to analyze the 
logs produced by the firewall devices.

Compared to the past, today's firewall devices not only decide where 
the packets will go (OSI Layer-3) according to the determined rules, but
 also undertake different tasks thanks to its additional modules. For 
example, it can recognize applications and their content (OSI Layer-7). 
In other words, firewalls that recognize which application (http, https,
 ssh, dns, etc.) make the communication in the application layer are 
defined as NGFW (Next-Generation Firewall). Application names that are 
mentioned in the firewall logs, app, and services etc. describe this 
firewall as NGFW. The fact that it recognizes an application allows to 
write application-based rules while writing rules on the firewall. That 
actually means that just blocking packets with destination port 22 to 
forbid outbound ssh access does not mean that ssh traffic is completely 
blocked. When the target application is defined as SSH instead of target
 port 22, the firewall will recognize it at the application layer, and 
block the ssh access regardless of the port that the ssh communication 
carried out.

The most essential firewall logs are the logs of the traffic passing 
over the device. Basically, this log provides us traffic time, source 
IP/Port information, destination IP/Port information, interface 
information, location information, etc.

### A sample firewall traffic log

date=2022-05-21 time=14:06:38 devname="FG500" devid="FG5HSTF109K" 
eventtime=1653131198230012501 tz="+0300" logid="0000000013" 
type="traffic" subtype="forward" level="notice" vd="root" 
srcip=172.14.14.26 srcname="CNL" srcport=50495 srcintf="ACC-LAN" 
srcintfrole="lan" dstip=142.250.186.142 dstport=443 dstintf="Wan" 
dstintfrole="wan" srccountry="Reserved" dstcountry="United States" 
sessionid=445180938 proto=6 action="accept" policyid=284 
policytype="policy" poluuid="8ec32778-a70a-51ec-9265-8fdf896d07f1" 
service="HTTPS" trandisp="snat" transip=89.145.185.195 transport=50495 
duration=72 sentbyte=2518 rcvdbyte=49503 sentpkt=13 rcvdpkt=42

### Looking at the details of the above log

date= Date

time= Time

devname= Hostname

devid= Device ID

eventtime= 1653131198230012501

tz= time zone

logid= Log ID

type= Log Type (traffic, utm, event, etc.)

subtype=Sub Log Type (Forward, vpn, webfilter, virus, ips, system, etc.)

level= log level

srcip= Source IP Address

srcname= Source Hostname

srcport= Source Port

srcintf= Name of the Source Interface

srcintfrole= Role of the Source Interface

dstip= Destination IP Address

dstport= Destination Port

dstintf= Name of the Destination Interface

dstintfrole= Role of the Destination Interface

srccountry= Source IP information (Country)

dstcountry= Destination IP information (Country)

action= info on the action taken (drop, deny, accept, etc.)

service= service information

transip= NAT IP info (internal output of the private source address)

transport= NAT port info

duration= time elapsed

sentbyte= size of the packets sent (byte)

rcvdbyte= size of the packets received (byte)

sentpkt= number of the packets sent

rcvdpkt= number of the packets received

When performing log analysis, the very first thing we need to check 
is the IP and port information. After we have the IP and port 
information we should check whether this traffic reaches the target or 
not under the "action" section. In other words, the firewall log will 
provide us the information on source and destination of the traffic as 
well as on what port it is carried out.

As action;

- **accept:** indicates that the packet passed successfully.
- **deny:** packet transmission is blocked, information is returned back to the IP address that it is blocked.
- **drop:** packet transmission is blocked. No information is returned back to the IP address that it is blocked.
- **close:** indicates that the communication is mutually terminated.
- **client-rst:** indicates that the communication was terminated by the client.
- **server-rst:** indicates that the communication was terminated by the server.

For example, checking the firewall logs, you will be able to find 
information on whether the network communication has been established 
with an IP address that has been forwarded to you for your review. It 
will make you search easier if you filter down your findings by the 
source and destination IP addresses. Firewall logs are one of the most 
important resources for the SOC Analyst to refer to when investigating 
incidents, cases, suspicious activities. For example, it will be very 
important to find the details like below:

- Is there a accept request at different times from the IP address
that was detected as attacking and denied by the IPS on firewall logs?
- Checking the firewall logs, you will be able to find whether there
is access to/from the suspicious IPs/Domains obtained as a result of the analysis of the malicious content in the antivirus logs.
- Firewall traffic logs are also good resources to detect which
different systems an infected system is communicating within the
network.

### Through the firewall logs, suspicious activities like:

- Port-Scan activities
- Communication detection with IoCs
- Lateral (lan-lan) or vertical (lan-wan, wan-lan) unauthorized access can be detected

