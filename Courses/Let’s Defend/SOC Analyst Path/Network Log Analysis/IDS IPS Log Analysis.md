---
tags:
  - log-analysis
  - ids-ips
  - soc
  - course/lets-defend
---

# IDS/IPS Log Analysis



The IDS/IPS concept and solutions are technologies developed at the point 
where only rule-based access controls of firewall devices are not 
sufficient in the security world. Roughly, while the firewall works on a
 rule basis so that red apples shall pass and yellows not, IDS/IPS 
solutions can check whether there are worms in the apple or not. In 
other words, it has a decision-making mechanism by inspecting the packet
 content. In this way, it can prevent suspicious/malicious 
packets/requests from reaching the target and prevents systems from 
being affected by this attack.

Today, although IDS/IPS technology is provided by many Firewall 
manufacturers as an additional module/license on firewall devices, it is
 only available in devices with IDS/IPS as core functions.

### IDS vs IPS

- IPS: Intrusion Prevention System - Detects and prevents the suspicious activities
- IDS: Intrusion Detection System - Only detects the suspicious activities

IDS and IPS have signature database. A signature is a set of rules 
designed to detect known attacks. The structure that presents this set 
of rules centrally is called the signature database. An open source 
signature database link is shared below. These databases are constantly 
updated against newly formed attack vectors. Network activities that 
trigger these signatures can be blocked or only detected according to 
the determined action of the signature. In other words, IDS and IPS are 
the same device/product, but 2 different concepts/terms emerge according
 to the action in the signatures. Many firewall manufacturers can 
provide the IDS / IPS module with an additional license in their 
products. Snort or Suricata are two well known open source IDS/IPS 
solutions in the market.

You can access the source of open source code signatures from the link below:

https://rules.emergingthreats.net/open/suricata-5.0/rules/

IDS/IPS systems are one of the sources that will generate the most 
frequent alarms amongst all in place security tools for the detection of
 network-based or host-based attacks. Because many attacks are on the 
network or endpoint, IDS/IPS systems can detect and block many 
suspicious activities. Many different attack categories such as log4j 
attack, post-scan activities, vulnerability exploits, botnet activities 
can be detected and prevented with the help of IDS/IPS technologies that
 are vital security solutions for organizations.

SOC analysts can usually access these outputs produced by IDS/IPS via
 SIEM or SOAR. SIEM presents the collected IDS/IPS alarms to the SOC 
Analyst by turning them into alarms with various rules/correlations 
according to their level, category, and occurrence in a certain number 
of times. These alerts can be investigated as an independent case or as a
 group by associating them with different alerts (Some SIEMs can also 
establish this relationship). For example, after the port-scan activity,
 the generation of events/alarms in the exploit category towards the 
targets that port-scan from the same source IP address will be 
associated with each other and considered as a red flag from the 
security perspective.

### A sample IPS log

date=2022-05-21 time=14:06:38 devname="FG500" devid="FG5HSTF109K" 
eventtime=1650585615163261716 tz="+0300" logid="0419016384" type="utm" 
subtype="ips" eventtype="signature" level="alert" vd="root" 
severity="high" srcip=12.11.2.4 srccountry="Reserved" dstip=19.66.201.16
 dstcountry="United States" srcintf="AOS_LAN" srcintfrole="lan" 
dstintf="Wan_RL" dstintfrole="lan" sessionid=254830141 action="detected"
 proto=17 service="DNS" policyid=2 
poluuid="6b5c8674-a36a-51ec-bbfd-2250544a9125" policytype="policy" 
attack="DNS.Server.Label.Buffer.Overflow" srcport=57673 dstport=53 
direction="incoming" attackid=37088 profile="default" 
ref="http://www.fortinet.com/ids/VID37088" incidentserialno=254762092 
msg="misc: DNS.Server.Label.Buffer.Overflow" crscore=30 craction=8192 
crlevel="high"

### Looking at the details of the above log

date= date information

time= time information

devname= system name

devid= system ID information

tz= timezone

logid= log ID information

type= log type (values like traffic, utm, event, etc.)

subtype= log sub type (values like forward, vpn, webfilter, virus, ips, system etc.)

level= log level

severity= incident severity level

srcip= source IP address

dstip= destination IP address

srccountry= source country

dstcountry= destination country

action= action information

service= service information

attack= attack details

srcport= source port information

dstport= destination port information

direction= direction of packet

attackid= attack ID information

msg= additional message information

IDS/IPS logs usually contain information about source-target IP and 
port information, action information, information about attack type, 
attack category, and attack level.

Following information should be investigated in details when analyzing IDS/IPS logs;

- The direction of attack (inbound or outbound) should be checked.
- The event severity level should be checked. Levels are usually set
as low, medium, high, critical. High and critical levels indicate that
activity is more important, quick action is required, and a false
positive is less likely.
- A different signature trigger state should be checked between the
same source and target. Triggering different signatures means that the
severity level of the event should be raised higher and a faster action
should be taken. The event is resolved within the service level
agreement (SLA) depending on its severity level in case of following
situations like:

- If a single signature is triggered,

- there are no different requests from the relevant source,

- there is no different accept in the firewall logs.

- Is the port/service specified in the attack detail running on the
target port? If it is running, the event level should be raised to the
critical level, and the target system should be checked for infection.
It should also be checked whether a response has been returned to the
relevant system from the source. If the answer is no, blocking the
attacking IP address as a precaution would be an appropriate action.
- Is the action taken just detection or has it been blocked as well?
If the attack is blocked and there are no other requests from the same
IP address on the firewall, we can wait a little longer for taking the
action. However, if the action taken for the attack is only a detection, then other similar requests should be reviewed and block action should
be applied if the content of the requests coming from the IP address is
not false positive.

For example, in the example log given above, 
“DNS.Server.Label.Buffer.Overflow” attack was detected in the request 
made from IP address 12.11.2.4 to port 53 of IP address 19.66.201.16. 
When we look at the details of this attack which can be accessed via the
 ref. url in the log, we see that Tftpd32 DNS Server was affected by 
this attack. If the service running on port 53 of 19.66.201.16 IP 
address is not Tftpd32 DNS Server, we can say that it has not been 
affected by this attack. However, the fact that it says "detected" in 
the action section means that this traffic occurs between the source and
 the destination and is not blocked. In other words, this request made 
by the source IP address reached the service running on port 53 of the 
destination IP address.

Following suspicious activities can be detected monitoring the IDS/IPS logs;

- Port scanning activities
- Vulnerability scans
- Code Injection attacks
- Brute-Force attacks
- Dos/Ddos attacks
- Trojan activities
- Botnet activities

