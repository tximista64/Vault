---
tags:
  - log-analysis
  - proxy
  - soc
  - course/lets-defend
---

# Proxy Log Analysis



The Proxy basically acts as a bridge between the endpoint and the internet.
 Organizations generally use proxy technology for purposes such as 
internet speed, centralized control and increasing the level of 
security. A simple schematic drawing of the Proxy structure is shared 
below. Requests made by the client reach the Proxy Server first and then
 the Internet. Proxies can basically work in 2 different types:

**Transparent Proxy:** Target server that we access can see the real source IP address.

**Anonymous Proxy:** Target server that we 
access cannot see the real source IP address. It sees the IP address of 
the proxy as the source IP address. Thus, it cannot obtain any 
information about the system that actually made the request in the 
background.

Cisco Umbrella, Forcepoint Web Security Gateway, Check Point URL 
Filtering, and Fortinet Secure Web Gateway products are examples of 
well-known proxy solutions in the market.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Log+Analysis/images/proxy.png)

The proxy working structure controls the access of systems (server, 
client, etc.) to services such as HTTP, HTTPS, FTP according to the 
determined policies and operates the actions taken according to the 
policies as block or pass actions. Although these policies vary 
depending on the proxy capabilities, it basically queries the URL/domain
 to be accessed from the category database, and if the category is a 
risky category, a block action is applied, otherwise a pass action is 
applied. Since some systems do not need to reach any networks other than
 some certain ones, an implicit deny may be applied to all networks 
other than the ones that are needed to be accessed.

### A sample proxy log:

date=2022-05-21 time=16:15:44 type="utm" subtype="webfilter" 
eventtype="urlfilter" level="warning" srcip=192.168.209.142 
srcport=34280 srcintfrole="lan" dstip=54.20.21.189 dstport=443 
dstintfrole="wan" service="HTTPS" 
hostname="android.prod.cloud.netflix.com" profile="Wifi-Guest" 
action="blocked" url="https://android.prod.cloud.netflix.com/" 
sentbyte=517 rcvdbyte=0 direction="outgoing" urlsource="Local URLfilter 
Block" msg="URL was blocked because it is in the URL filter list"

### When we review the above log;

date= date information

time= time information

type= log type

subtype= log sub type (values like forward, vpn, webfilter, virus, ips, system etc.)

eventtype= event type that belongs to the sub type

level= incident severity level

srcip= source IP address

srcport= source port information

srcinfrole= source interface information

dstip= destination IP address

dstport= destination port information

dstinfrole= destination interface information

service= service information

hostname= requested domain

profile= source profile

action= action information

url= URL address requested

sentbyte = size of data sent by bytes

rcvdbyte= size of data received by bytes

direction= direction of the traffic

urlsource= URL sources

msg= message information

When we review the log we see that the request has been blocked to 
access the “https[:]//android[.]prod[.]cloud[.]netflix.com/” address of 
the system with the IP address 192.168.209.142 in the “Wifi_Guest” group
 due to the policy applied to the relevant profile. The reason why this 
request was blocked is because the url to be accessed is in the "Local 
URLfilter Block" list and access to the URLs in this list is blocked.

Proxy logs are one of the most important log types when a SOC analyst
 needs to check which domain/URL a system (server, client, etc.) is 
making a request to our internal systems and whether it was able to 
establish a successful connection. It is also important to be able to 
determine if the domain/URL is a risky category and if there were able 
establish any successful connections before.

- We can detect following suspicious activities through reviewing the proxy logs:
- Connections to/from suspicious URLs
- Infected system detection
- Detection of tunneling activities

For example, when the Forcepoint Web Security Gateway log below is examined;

Jun 17 10:47:00 10.10.18.11 
CEF:0|Forcepoint|Security|8.5.4|194|Transaction blocked|7| act=blocked 
app=https dvc=10.10.18.11 dst=104.26.11.18 dhost=sentry-proxy.cargox.cc 
dpt=443 src=10.80.18.50 spt=61603 suser=Test_User requestMethod=POST 
requestClientApplication=Mozilla/5.0 (Windows NT 10.0; Win64; x64) 
cs1Label=Policy cs1=Block_Risk_Category_Policy(Servers) 
request=https://sentry-proxy.cargox.cc/api/3/envelope/?sentry_key\=e2506000e29247eba06eee9df3f011e0&sentry_version\=7

The Test_User user sent a POST request to the address 
“https[:]//sentry-proxy[.]cargox[.]cc/” with the Mozilla browser over 
its server with an IP address of 10.80.18.50 (it was determined by the 
name of the policy), and the target address was determined as 
“Block_Risk_Category_Policy( Servers)” policy and blocked according to 
the “act=blocked” action.

The domain category to be accessed in this log is expressed by the 
category number. The category number is 194. The equivalent of these 
numbers can be obtained from the following document. (Pages 31-36)

https://www.websense.com/content/support/library/web/v84/siem/siem.pdf

When we review category 194, we find out that there is a category 
belonging to suspicious domains in the form of "194:Extended Protection 
Suspicious Content".

After we review the log analysis above, we found out that the action 
is blocked, but it is clear that this request was made by a server, and 
the server may be infected and that it may be trying to access a 
different Proxy address in order to hide which destination it is 
actually going to. In this case, the analysis should continue more in 
depth and the process that made this request should be determined and 
examined. EDR/XDR log sources should be investigated for the 
continuation of this review.

