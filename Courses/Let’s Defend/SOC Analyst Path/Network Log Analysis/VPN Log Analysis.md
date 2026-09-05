---
tags:
  - log-analysis
  - vpn
  - soc
  - course/lets-defend
---

# VPN Log Analysis




VPN is the technology that allows you to connect to a local network that 
you are not physically connected to. Generally, organizations prefer 
this technology to access their internal systems remotely. Today, it is 
known as a technology to access sites that are not accessible. The logic
 here works like this; you are able to access sites you normally cannot 
access from your current location by switching your location to a 
different location (connecting to the internet as if you were there).

VPN technology for enterprise networks is an indispensable type of 
access. Therefore, VPN logs are crucial for the daily routine of SOC 
Analysts. Since VPN is one of the services that are open public, it 
becomes as an entry point for attackers. Data such as time information, 
source IP information, user information in the VPN logs are among the 
most useful information for the analysts when investigating 
events/alarms.

VPNs are generally used over the organization's existing Firewall 
(firewall that supports VPN). In addition, it is possible to see 
products that provide dedicated services only for VPNs in some networks.
 In summary, VPN logs may be obtained from Firewall devices as well as 
other devices that only provide VPN service.

### An example VPN log

date=2022-05-21 time=14:06:38 devname="FG500" devid="FG5HSTF109K" 
eventtime=1653134913959078891 tz="+0300" logid="0101039424" type="event"
 subtype="vpn" level="information" vd="root" logdesc="SSL VPN tunnel up"
 action="tunnel-up" tunneltype="ssl-web" tunnelid=462105151 
remip=13.29.5.4 user="letsdefend-user" reason="login successfully" 
msg="SSL tunnel established"

### When we review the details of the above log

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

logdesc= log description

action= action taken

tunneltype= VPN tunnel type

remip= IP address that established the VPN connection

user= User information

reason= VPN Connection Request Result

msg= Message (Detailed message after the access)

The most important information to review in the VPN log is the IP 
address that makes the connection, which user it connects to, and the 
result of this access request (successful-failure status). The given 
sample log is a log of the VPN service running as an additional module 
on a firewall. Therefore, the type is listed as “event” and the subtype 
is “vpn”. After a successful VPN connection, an IP is assigned to you 
for your access through the VPN system. The log of the assigned IP 
information may be sent either in the same log record or in a different 
log. In addition to the information in the sample log above, you can 
also see the IP information assigned to you with the “tunnelip” value in
 the other log after successful VPN connection.

When we review the sample vpn log above, we can detect that a 
successful VPN access has been established as the IP address that makes 
the VPN request is 13.29.5.4, the user name is "letsdefend-user" and the
 message produced by the device belonging to the VPN activity is "login 
successfully".

Your firewall traffic logs will be created with the IP address 
specified in the "tunnelip" assigned to you as the source IP address in 
the network activities carried out over the VPN going forward.

For example, SOC Analysts are expected to analyze VPN logs when faced with a scenario like the one below.

**Scenario:** After a phishing e-mail 
targeting the organization, it has been determined that some users in 
the organization opened this e-mail and entered their username and 
password information. For these users, it is necessary to check all the 
activities of these users in all services especially the ones publicly 
available accounts (i.e. VPN). The VPN logs of the relevant users should
 be analyzed. The successful access source IP and country information 
and whether these successful accesses are indeed made by the user should
 be further investigated.

Following suspicious activities can be detected through the VPN logs:

- Successful/Unsuccessful VPN accesses
- Detection of brute-force attacks against VPN accounts
- Detection of VPN accesses outside the specified countries
- Detection of VPN accesses outside the specified time periods

The traffic log on the same device for the successful VPN connection 
that we have reviewed its log above is as follows. (There is more than 
one record, only 1 has been added as an example.) As seen in the log, 
the firewall creates the log of this traffic first before the VPN access
 is made as the traffic/connection occurs on the firewall side. You can 
see that the **srcip** in this log and the **remip**
 values ​​in the VPN log are the same. The fact that the application 
(service) information in the traffic log is HTTPS is due to the fact 
that the VPN type used is SSL-VPN

