---
tags:
  - log-analysis
  - dns
  - threat-intel
  - soc
  - course/lets-defend
---

# DNS Log Analysis


DNS is one of the most basic building blocks of the internet. DNS is 
basically a technology that is used for domain - IP resolution. Network 
traffic is basically conducted over IPs and DNS is the system that tells
 us what the IP address for the server of google.com when we need to 
access "google.com" .

SOC analysts generally use DNS logs to check which domains and when 
they were  requested during an incident investigation of a system. We 
should keep the followings when checking these logs:

- Has the system made domain requests in categories that actually should not access?
- Has the system made domain requests that are actually risky categories?
- Were any known services (google drive, one drive, etc.) attempted to access during situations like data leak, and etc.?
- Is there any systems that make requests to domains obtained from Threat Intelligence resources?
- Investigations on DNS logs should be conducted to detect if there
is access to DNS Over TLS (DOT) or DNS over HTTPS (DOH) services.

DNS logs can be divided into 2 different categories from the SOC 
Analyst's point of view as the DNS server events, and the DNS queries.

DNS Server Records are simply the DNS audit events on the server that
 hosts the DNS records. These events are kept on "Application and 
Services Logs -> Microsoft -> Windows -> DNS-Server\Audit" 
section on the Eventlog on Windows servers. Operations like adding, 
deleting, editing, records, etc. on the DNS server could be monitored on
 these logs.

For example, the screenshot below shows you the event about the 
deletion of the Event_ID: 516 deneme.dc.local with the details of who 
deleted it and on what server it was deleted inside the Default zone.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Log+Analysis/images/dns1.png)

DNS queries are a difficult source of logs to collect and analyze. 
DNS servers do not keep these logs by default and they must be enabled 
in order for them to keep these logs. The DNS queries generated directly
 by the DNS service are also difficult to analyze. However, these are 
records where you can find which systems query the domains in the 
obtained IoCs. In summary, applications that provide DNS server services
 such as Microsoft DNS, Bind DNS, Dnsmasq record the DNS queries they 
receive upon request.

IOCs (Indicator of compromise) are the evidences that take part 
before, during and after a cybersecurity incident and are revealed 
during the analysis and investigation of that cyber security incident. 
The IOCs are crucial in determining the details like the type of the 
attack, tools leveraged during the attack, and who the possible attacker
 is.

Bind logs, that are DNS server services generally used in Linux 
systems, can be accessed via the "/var/log/querylog" log file in the 
default configuration.

### A sample DNS log

{
  "timestampt": 1591367999.306059,
  "source_ip": "192.168.4.76",
  "source_port": 36844,
  "destination_ip": "192.168.4.1",
  "destination_port": 53,
  "protocol": "udp",
  "query": "testmyids.com",
  "qtype_name": "A",
}

### DNS query logs generally contain the following data

- Date-Time
- Querying IP, Port
- Query type
- The requested domain

Since the above example log is taken from a product (Bro/Zeek) that 
captures DNS records on the external network outside of DNS server, 
there is also the server information where the query was made along with
 the IP that made the query. For this reason, DNS logs can be obtained 
directly from the server, as well as in the systems that collect these 
queries over the network.

In DNS log analysis, the requested domain and its reputation/category
 are important. The domains utilized in the 2020 "SolarWinds SUNBURST" 
attack could have been detected by analyzing the DNS logs. The domains 
that a network device, a database or 3rd party application servers will 
communicate are clear. Domains that the manufacturer shared with you and
 are supposed to make communications should be investigated through the 
 DNS logs for:

- First time visited domains
- Domains or subdomains over a certain character size
- Detection of NX returning domains
- Domain IOC controls
- Detection of DNS over TLS, DNS over HTTPS accesses

When the DNS logs below are analyzed, we see that there are DNS 
requests made towards subdomains that were randomly created from the IP 
address 192.168.10.12 in 1 minute time period. This activity of DNS 
requests may be a sign for a potential DNS tunneling activity. The 
investigation should be conducted at the endpoint by determining the 
source process that creates this activity.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Log+Analysis/images/dns.png)

Our investigations on the DNS log below show that the requested 
domains appear to be legitimate. Considering that the Oracle Database 
server with an IP address of 192.168.10.3 is querying these domains, the
 Oracle server asking the domains of Microsoft services used for data 
transfer makes this activity suspicious.

Feb  5 09:12:11 ns1 named[80090]: client 192.168.10.3#3261: query: login.microsoftonline.com IN A

Feb  5 09:13:11 ns1 named[80090]: client 192.168.10.3#4536: query: onedrive.live.com IN A

