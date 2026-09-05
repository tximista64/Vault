---
tags:
  - log-analysis
  - waf
  - soc
  - course/lets-defend
---

# WAF Log Analysis



WAF (Web Application Firewall) is the technology used to secure web-based 
applications. The analysis of firewall or IDS/IPS logs alone are often 
not sufficient for the detection of web-based attacks. The main reasons 
for this are the SSL offload issue and the control of the data in the 
payload (data) part of the web request.

SSL Offload is the decryption of SSL-encrypted traffic. The main 
purpose of the system is to reduce the load and increase performance, as
 well as to decrypt the encrypted traffic/request to make the content 
visible and controllable from a security point of view. In this way, 
invisible attack vectors in encrypted traffic become detectable or 
preventable.

In networks equipped with WAF, requests from end users reach WAF 
first over the internet. Then the WAF inspects the request, and makes 
the decision whether it will be transferred to the Web Server or not. 
One of the biggest advantages of WAFs here is that it can perform SSL 
Off-load, which helps examine the content of HTTPS traffic. WAF without 
SSL Offloading capability cannot provide a full effective protection as 
it won’t be able to inspect the payload (data) part of the HTTPS 
communication.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Log+Analysis/images/WAF.png)

F5 Big-IP, Citrix, Imperva, Forti WAF products are examples of WAF 
solutions that are well-known in the market. In addition, Cloudflare, 
Akamai, AWS WAF solutions are also used as cloud WAF solutions.

WAF systems are generally the systems that handle the web access 
requests on the public faced systems. Therefore, we can say that WAFs 
are the first systems to detect web attacks and WAF logs are the ones 
that help SOC Analysts to detect suspicious activities. The analysts 
need to know their location on the network clearly when analyzing WAF 
logs. WAF logs are the source of the logs to view all web requests made,
 and to analyze detected web attacks or blocked web attacks. While 
examining the alerts generated for detected or blocked attacks, the 
reputation of the source IP address that created the log/alert should be
 analyzed also other similar activities that the source IP created in 
other log sources (such as IDS/IPS, Firewall) should be investigated.

### A sample WAF log:

date=2022-01-26 time=19:47:26 log_id=20000008 msg_id=000018341360 
device_id=FVVM08 vd="root" timezone="(GMT+3:00)Istanbul" 
timezone_dayst="GMTg-3" type=attack main_type="Signature Detection" 
sub_type="SQL Injection" severity_level=High proto=tcp 
service=https/tls1.2 action=Alert policy="Alert_Policy" src=19.6.150.138
 src_port=56334 dst=172.16.10.10 dst_port=443 http_method=get 
http_url="?v=(SELECT 
(CHR(113)||CHR(120)||CHR(120)||CHR(118)||CHR(113))||(SELECT (CASE WHEN 
(1876=1876) THEN 1 ELSE 0 END))::text" http_host="app.letsdefend.io" 
http_agent="Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9b1) 
Gecko/2007110703 Firefox/3.0b1" msg="Parameter(Password) triggered 
signature ID 030000136" signature_subclass="SQL Injection" 
signature_id="030000136" srccountry="Germany" attack_type="SQL 
Injection"

All determined web traffic passes through WAF. In other words, you can find all web request records on the WAF logs.

### Following is the information you can find looking at the details of the above log

date= date information

time= time information

type: log type

main_type: detection type

sub_type: detected activity detail

severity_level: incident severity level

proto: protocol

service: service information

action: action taken

policy: rule name

src: source IP address

src_port: source port address

dst: destination IP address

dst_port: destination port address

http_method: http request method

http_url: URL requested

http_host: host requested

http_agent: user-agent info

msg: message related to the incident

signature_subclass: signature class

srccountry: source IP country

attack_type: attack type

When the sample WAF log is analyzed, the source and target IP 
information should be checked since it references a high severity level 
SQL Injection attack type through signature detection. WAF’s response to
 this request should be checked if the reported attack is a generic (SQL
 injection, XSS, etc.) web attack as above. If the WAF did not block 
this request the response returned by the application should be checked.
 The response code of the response of the application (IIS, Apache, 
Nginx, etc.) is also important and should be investigated. If the 
application responded 200 for an attack that WAF could not prevent, it 
means that the attack reached the web server and returned a successful 
response. In some cases, the application returns code 200 while it 
should actually return code 404 due to some technical deficiencies in 
the application. These can be considered as false-positives for the 
relevant requests.

Examples of some of the application responses;

- 200 (OK): The request was received successfully and the response was returned.
- 301 (Permanent Redirect): The request was redirected to a different location.
- 403 (Forbidden): Data requested to be accessed is not allowed.
- 404 (Not Found): The requested content could not be found.
- 503 (Service Unavailable): The server cannot respond.

Response code categories:

- Informational responses (100–199)
- Successful responses (200–299)
- Redirection messages (300–399)
- Client error responses (400–499)
- Server error responses (500–599)

The connection request in the sample WAF log shared above was blocked
 due to the signatures that WAF recognize as malicious and generated an 
alert about it because of the expressions in the URL within the request 
coming from the IP address 19.6.150.138 to the port 443 of the 
172.16.10.10 host behind the WAF. The policy name applied for requests 
matching this signature on the WAF is "Alert_Policy" and the action is 
set to "alert" which is monitoring mode. Therefore, we can say that the 
request reached the destination host.

If the attack reported by WAF for the requests is for the purpose of 
detecting vulnerabilities, it is necessary to look at the details of the
 vulnerability to be detected here. For example, if your web application
 is running on ASP and the vulnerability detection is a PHP application 
specific scan, then such a vulnerability cannot be expected to be 
reported. However, it would still be a good practice to take any actions
 for the IP address that performs scanning activity. The best action to 
take here is to block the inbound requests at the very first security 
device at the gateway where the inbound requests first interacts with 
our network.

We can help use WAF logs when analyzing the following detections:

- Detection of known web vulnerabilities
- Detection of variety of web attacks like SQL Injection, XSS Attack, Code Injection, Directory Traversal
- Detection of suspicious method usage such as PUT, DELETE
- Top requesting IP address information
- Most requested URL information

**Request Method:** Indicates which method the request is made within the web language. The main request methods are as follows.

- GET: It is used to retrieve data from the server
- POST: It is used to send data to the server (such as picture, video)
- DELETE: It is used to delete the data on the server
- PUT: It is used to send data to the server (sent data creates or updates files)
- OPTIONS: Tells which methods the server accepts

