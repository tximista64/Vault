---
tags:
  - writeup/htb
  - ctf
  - network-forensics
  - cloud-security
  - openstack
  - pcap-analysis
  - incident-response
---

# Vantage

A small company moved some of its resources to a private cloud installation. The developers left the redirect to the dashboard on their web server. The security team got an email from the alleged attacker stating that the user data was leaked. It is up to you to investigate the situation.


### What tool did the attacker use to fuzz the web server ? (Format- include version e.g, [nmap@7.80](mailto:nmap@7.80))

```shell 
╰─○ tshark -r web-server.2025-07-01.pcap -Y "http.user_agent" -T fields -e http.user_agent | sort | uniq -c | sort -nr    
  3696 Fuzz Faster U Fool v2.1.0-dev  
    40 Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36  
     2 Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70  
     1 Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101 Firefox/102.0  
     1 Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences  
on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com

```

### Which subdomain did the attacker discover?


```shell  
╰─○ tshark -r web-server.2025-07-01.pcap -Y "http.host" -T fields -e http.host | sort | uniq -c | sort -nr | less

42 cloud.vantage.tech  
     3 157.230.81.229  
     2 www.vantage.tech  
     2 www.test.vantage.tech  
     2 www.m.vantage.tech  
     2 www.forum.vantage.tech  
     2 www.dev.vantage.tech  
     2 www.blog.vantage.tech  
     2 www3.vantage.tech  
     2 www2.vantage.tech  
     2 www1.vantage.tech  
     2 wiki.vantage.tech  
     2 whm.vantage.tech  
     2 web.vantage.tech
SNIP SNIP
```

### How many login attempts did the attacker make before successfully logging in to the dashboard?

J'ai lutté pour cette question

```shell
╰─○ tshark -r web-server.2025-07-01.pcap -Y 'http.request.method == "POST" && http.request.uri == "/dashboard/auth/login/"' -T fields -e frame.number -e http.file_data
20822   637372666d6964646c6577617265746f6b656e3d55583464766532447775446f3137314545676e705a61786e69333935454135696a59734f6f4f6f48775055624771414f4b6352375934716e73327957496237342666616b655f656d61696c3d2666616b655f70617373776f72643d266e6578743d25324664617368626f61726425324626726567696f6e3d64656661756c7426757365726e616d653d61646d696e2670617373776f72643d61646d696e
20827   637372666d6964646c6577617265746f6b656e3d55583464766532447775446f3137314545676e705a61786e69333935454135696a59734f6f4f6f48775055624771414f4b6352375934716e73327957496237342666616b655f656d61696c3d2666616b655f70617373776f72643d266e6578743d25324664617368626f61726425324626726567696f6e3d64656661756c7426757365726e616d653d61646d696e2670617373776f72643d61646d696e
20933   637372666d6964646c6577617265746f6b656e3d6a744c78334d6b58413453395177737873486a6b776c4365544a684f44587a6c49753938576d4731417039577650314879444e327666766533494746487942372666616b655f656d61696c3d2666616b655f70617373776f72643d266e6578743d25324664617368626f61726425324626726567696f6e3d64656661756c7426757365726e616d653d64656d6f2670617373776f72643d64656d6f
20939   637372666d6964646c6577617265746f6b656e3d6a744c78334d6b58413453395177737873486a6b776c4365544a684f44587a6c49753938576d4731417039577650314879444e327666766533494746487942372666616b655f656d61696c3d2666616b655f70617373776f72643d266e6578743d25324664617368626f61726425324626726567696f6e3d64656661756c7426757365726e616d653d64656d6f2670617373776f72643d64656d6f
20995   637372666d6964646c6577617265746f6b656e3d394d67325376696271364b57497a5975446835786f4d63717548697257655662794e45444c3545667172314a6e5378454a647a666e47357145474869305058582666616b655f656d61696c3d2666616b655f70617373776f72643d266e6578743d25324664617368626f61726425324626726567696f6e3d64656661756c7426757365726e616d653d726f6f742670617373776f72643d726f6f74
21000   637372666d6964646c6577617265746f6b656e3d394d67325376696271364b57497a5975446835786f4d63717548697257655662794e45444c3545667172314a6e5378454a647a666e47357145474869305058582666616b655f656d61696c3d2666616b655f70617373776f72643d266e6578743d25324664617368626f61726425324626726567696f6e3d64656661756c7426757365726e616d653d726f6f742670617373776f72643d726f6f74
21091   637372666d6964646c6577617265746f6b656e3d797669437064643255416b4777534c77423761716d374f5341496a6f4a58423258774764694e7a365556427462626b47483345386c3148534b4849664e79444f2666616b655f656d61696c3d2666616b655f70617373776f72643d266e6578743d25324664617368626f61726425324626726567696f6e3d64656661756c7426757365726e616d653d61646d696e2670617373776f72643d5374726f6e6741646d696e536563726574
21098   637372666d6964646c6577617265746f6b656e3d797669437064643255416b4777534c77423761716d374f5341496a6f4a58423258774764694e7a365556427462626b47483345386c3148534b4849664e79444f2666616b655f656d61696c3d2666616b655f70617373776f72643d266e6578743d25324664617368626f61726425324626726567696f6e3d64656661756c7426757365726e616d653d61646d696e2670617373776f72643d5374726f6e6741646d696e536563726574



```

On note des doublons dans le file_data après decodage avec xxd on note les tentatives suivantes:

20822 admin:admin
20827 admin:admin

20933 demo:demo
20939 demo:demo

20995 root:root
21000 root:root

21091 admin:StrongAdminSecret
21098 admin:StrongAdminSecret

La frame 21098 est l'accès au dashboard  les autres (en doublons) des tentatives:

3

### When did the attacker download the OpenStack API remote access config file? (UTC)

GET /dashboard/project/api_access/openrc/ HTTP/1.1
Host: cloud.vantage.tech
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Referer: http://cloud.vantage.tech/dashboard/project/api_access/
Accept-Encoding: gzip, deflate
Accept-Language: en-GB,en-US;q=0.9,en;q=0.8,es;q=0.7
Cookie: login_region=default; login_domain=""; csrftoken=vSJp8PSCxgVICejM2lui5foOpgzAXX94; sessionid=t5up9mbx1u0p47asqrqjfhn4f6dpinla
X-Forwarded-For: 117.200.21.26
X-Forwarded-Host: cloud.vantage.tech
X-Forwarded-Server: cloud.vantage.tech
Connection: Keep-Alive
 
HTTP/1.1 200 OK

Date: Tue, 01 Jul 2025 09:40:29 GMT

### When did the attacker first interact with the API on controller node? (UTC)

Dans le fichier de config de l'api on note 

export OS_AUTH_URL=http://134.209.71.220/identity c'est le controller node

du coup 

```shell

╭─tximista at zaworudo in ~/Téléchargements/Vantage 26-03-23 - 0:28:32  
╰─○ tshark -r controller.2025-07-01.pcap -Y 'ip.dst == 134.209.71.220 && http.request && ip.src != 134.209.71.220' -T fields -e frame.time -e ip.  
src -e http.request.uri | sort           
Jul  1, 2025 11:41:44.667723000 CEST    117.200.21.26   /identity  
Jul  1, 2025 11:41:45.271347000 CEST    117.200.21.26   /identity/v3/auth/tokens  
Jul  1, 2025 11:41:45.863173000 CEST    117.200.21.26   /identity/v3/services  
Jul  1, 2025 11:41:54.792245000 CEST    117.200.21.26   /identity
```

### What is the project id of the default project accessed by the attacker?


```shell
─tximista at zaworudo in ~/Téléchargements/Vantage 26-03-23 - 0:38:59  
╰─○ cat openrc       
#!/usr/bin/env bash  
# To use an OpenStack cloud you need to authenticate against the Identity  
# service named keystone, which returns a **Token** and **Service Catalog**.  
# The catalog contains the endpoints for all services the user/tenant has  
# access to - such as Compute, Image Service, Identity, Object Storage, Block  
# Storage, and Networking (code-named nova, glance, keystone, swift,  
# cinder, and neutron).  
#  
# *NOTE*: Using the 3 *Identity API* does not necessarily mean any other  
# OpenStack API is version 3. For example, your cloud provider may implement  
# Image API v1.1, Block Storage API v2, and Compute API v2.0. OS_AUTH_URL is  
# only for the Identity API served through keystone.  
export OS_AUTH_URL=http://134.209.71.220/identity  
# With the addition of Keystone we have standardized on the term **project**  
# as the entity that owns the resources.  
export OS_PROJECT_ID=9fb84977ff7c4a0baf0d5dbb57e235c7  
export OS_PROJECT_NAME="admin"  
export OS_USER_DOMAIN_NAME="Default"
```

### Which OpenStack service provides authentication and authorization for the OpenStack API?

https://openstack4j.github.io/learn/identity/identity-v3/

### What is the endpoint URL of the swift service?

```─○ cat tokens    
{"token": {"methods": ["password", "token"], "user": {"domain": {"id": "default", "name": "Default"}, "id": "b1cbe2fc995a47ae85a4408a52aeca38", "  
name": "admin", "password_expires_at": null}, "audit_ids": ["0A8mdTHOTdOdbAK3teH7oA", "NlkBxt4ZQEm3rMWlwHJDdQ"], "expires_at": "2025-07-01T10:40:  
07.000000Z", "issued_at": "2025-07-01T09:40:07.000000Z", "project": {"domain": {"id": "default", "name": "Default"}, "id": "9fb84977ff7c4a0baf0d5  
dbb57e235c7", "name": "admin"}, "is_domain": false, "roles": [{"id": "d3649868c2f341c6888d66ca0081f688", "name": "reader"}, {"id": "65d7c4b6697b4  
b82a18ebb500ce3958d", "name": "member"}, {"id": "0501401642464242bcd799437b71bdc9", "name": "admin"}, {"id": "0f9fa828df4c4ff083eb16461dd78e9e",  
"name": "manager"}], "catalog": [{"endpoints": [{"id": "40f882c56dad425b859f2ad70ab7b3b5", "interface": "public", "region_id": "RegionOne", "url"  
: "http://134.209.71.220/volume/v3", "region": "RegionOne"}], "id": "2c88abbce32146cc9fc3ec2543ed2590", "type": "block-storage", "name": "cinder"  
}, {"endpoints": [{"id": "22bccb88a47b4f11958e6945411aca1e", "interface": "public", "region_id": "RegionOne", "url": "http://134.209.71.220/image  
", "region": "RegionOne"}], "id": "33e9974d827c44c1858ba54394f83019", "type": "image", "name": "glance"}, {"endpoints": [{"id": "ef877f3e850b40c1  
89d46afd02015bf6", "interface": "public", "region_id": "RegionOne", "url": "http://134.209.71.220/compute/v2/9fb84977ff7c4a0baf0d5dbb57e235c7", "  
region": "RegionOne"}], "id": "5511fb633aeb478f80b57f35a573e063", "type": "compute_legacy", "name": "nova_legacy"}, {"endpoints": [{"id": "4372a6  
2d2831489eb007b975dae0443b", "interface": "public", "region_id": "RegionOne", "url": "http://134.209.71.220/identity", "region": "RegionOne"}, {"  
id": "8215847252174865a494704a946231ed", "interface": "internal", "region_id": "RegionOne", "url": "http://134.209.71.220/identity", "region": "R  
egionOne"}, {"id": "ec845707092245d0bfff6a7d6f4ad599", "interface": "admin", "region_id": "RegionOne", "url": "http://134.209.71.220/identity", "  
region": "RegionOne"}], "id": "9bc4045e7dde47a9ae38bea53e0ff05c", "type": "identity", "name": "keystone"}, {"endpoints": [{"id": "06c50b8ce6b9437  
8a7e92a012cf51945", "interface": "public", "region_id": "RegionOne", "url": "http://134.209.71.220/compute/v2.1", "region": "RegionOne"}], "id":  
"a0ae7efb370840889a621e8c0893f7b4", "type": "compute", "name": "nova"}, {"endpoints": [{"id": "73747311352943afa2c14c3eb3b47d92", "interface": "p  
ublic", "region_id": "RegionOne", "url": "http://134.209.71.220/placement", "region": "RegionOne"}], "id": "dc9b8604dd4f4567b378ea962451582b", "t  
ype": "placement", "name": "placement"}, {"endpoints": [{"id": "968f23a3924346a3bdddae69879080bb", "interface": "admin", "region_id": "RegionOne"  
, "url": "http://134.209.71.220:8080", "region": "RegionOne"}, {"id": "fa462e9eb3174b5d9af61ea50e8f23cb", "interface": "public", "region_id": "Re  
gionOne", "url": "http://134.209.71.220:8080/v1/AUTH_9fb84977ff7c4a0baf0d5dbb57e235c7", "region": "RegionOne"}], "id": "f9194820052d4788b09157bf0  
a0dfdd0", "type": "object-store", "name": "swift"}, {"endpoints": [{"id": "aac42a57d5614c5b89a5ef536149d773", "interface": "public", "region_id":  
"RegionOne", "url": "http://134.209.71.220/networking", "region": "RegionOne"}], "id": "ff889368f61f4fcfaa6ad584613e56fc", "type": "network", "n  
ame": "neutron"}]}}%
```

### How many containers were discovered by the attacker?

```
GET /sdb1/350/AUTH_9fb84977ff7c4a0baf0d5dbb57e235c7?format=json HTTP/1.1

SNIP__________________________________________________________________SNIP

[{"name": "dev-files", "count": 0, "bytes": 0, "last_modified": "2025-07-01T04:22:36.008860", "storage_policy": "Policy-0"}, {"name": "employee-data", "count": 0, "bytes": 0, "last_modified": "2025-07-01T04:22:28.334080", "storage_policy": "Policy-0"}, {"name": "user-data", "count": 0, "bytes": 0, "last_modified": "2025-07-01T04:22:07.707130", "storage_policy": "Policy-0"}]

``` 

### When did the attacker download the sensitive user data file? (UTC)

Avec wireshark
GET /v1/AUTH_9fb84977ff7c4a0baf0d5dbb57e235c7/user-data/user-details.csv 

Jul  1, 2025 09:45:23.060797000 UTC 


### How many user records are in the sensitive user data file?

```shell
─tximista at zaworudo in ~/Téléchargements/Vantage 26-03-23 - 22:18:56  
╰─○ wc -l users  
28 users
```

### For persistence, the attacker created a new user with admin privileges. What is the username of the new user?

{"users": [{"id": "c373da67a62b48f393c45dc071fa80b8", "name": "jellibean", "domain_id": "default", "enabled": true, "default_project_id": "9fb84977ff7c4a0baf0d5dbb57e235c7", "password_expires_at": null, "options": {}, "links": {"self": "http://134.209.71.220/identity/v3/users/c373da67a62b48f393c45dc071fa80b8"}}], "links": {"next": null, "self": "http://134.209.71.220/identity/v3/users?name=jellibean", "previous": null}}

### What is the password of the new user?

```shell
─tximista at zaworudo in ~/Téléchargements/Vantage 26-03-23 - 22:30:38  
╰─○ tshark -r controller.2025-07-01.pcap \  
-Y 'http.request.method == "POST" && http.file_data contains "jellibean"' \  
-T fields -e http.file_data | xxd -r -p  
{"user": {"password": "P@$$word", "enabled": true, "default_project_id": "9fb84977ff7c4a0baf0d5dbb57e235c7", "name": "jellibean"}}%
```

### What is MITRE tactic id of the technique in task 12?

[T1136.001](https://attack.mitre.org/techniques/T1136/001/) 

## Attack Summary

The attacker performed web reconnaissance using a fuzzing tool (**ffuf**) and discovered a hidden subdomain (`cloud.vantage.tech`) exposing a cloud dashboard.

A brute force attack was then conducted against the login endpoint, leading to successful authentication using valid credentials (`admin:StrongAdminSecret`).

After gaining access, the attacker:

- downloaded the OpenStack API configuration file (`openrc`)
- authenticated against the OpenStack controller (Keystone)
- enumerated available services and storage containers
- accessed and exfiltrated sensitive user data (`user-details.csv`)
- created a new admin user (`jellibean`) for persistence

The attack chain follows:

> **recon → brute force → cloud access → API abuse → data exfiltration → persistence**

---

## Timeline

- **Reconnaissance phase**
    - Web fuzzing using `ffuf`
    - Discovery of `cloud.vantage.tech`
- **Brute force phase**
    - Multiple login attempts:
        - `admin:admin`
        - `demo:demo`
        - `root:root`
    - **Successful login**:
        - `admin:StrongAdminSecret`
- **2025-07-01 09:40:29 UTC**
    - Download of OpenStack API config (`openrc`)
- **2025-07-01 ~09:41:44 UTC**
    - First interaction with OpenStack controller (`/identity`)
    - Token generation and API usage begins
- **Enumeration phase**
    - Discovery of storage containers:
        - `dev-files`
        - `employee-data`
        - `user-data`
- **2025-07-01 09:45:23 UTC**
    - Download of sensitive file:
        - `user-details.csv`
- **Post-exploitation**
    - Creation of persistent admin user:
        - `jellibean / P@$$word`

---

## Threat Context

The attacker behavior is consistent with a **targeted intrusion into a cloud environment**, leveraging weak credentials and exposed services.

Observed techniques:

- Web fuzzing (surface discovery)
- Brute force authentication
- Abuse of exposed cloud dashboard
- API interaction with OpenStack (Keystone, Swift)
- Data exfiltration from object storage
- Persistence via account creation

This aligns with common attacker objectives:

> **unauthorized access to cloud resources and sensitive user data**

The use of valid credentials and API access suggests a **hands-on-keyboard attacker**, not automated malware.

The targeted data (`user-details.csv`) indicates:

> **data theft for potential financial or identity exploitation**

---

## Remediation 

### Immediate containment

- Disable external access to the cloud dashboard
- Block attacker IP `117.200.21.26`
- Invalidate all active sessions and tokens

---

### Eradication

- Remove unauthorized user:
    - `jellibean`
- Review all created users and roles
- Audit API activity for additional persistence

---

### Credential security

- Reset all credentials:
    - admin accounts
    - API keys
- Enforce strong password policy
- Enable MFA on all cloud accounts

---

### System recovery

- Verify integrity of cloud resources
- Audit object storage (Swift) for unauthorized access
- Identify all exposed or downloaded data

---

### Monitoring & detection

- Monitor:
    - failed login attempts (brute force)
    - unusual API calls
- Alert on:
    - new user creation
    - abnormal data access/download

---

### Long-term prevention

- Restrict access to admin dashboards (VPN / IP allowlist)
- Disable weak/default credentials
- Implement rate limiting on authentication endpoints
- Enable centralized logging and SIEM monitoring
- Apply least privilege on cloud roles