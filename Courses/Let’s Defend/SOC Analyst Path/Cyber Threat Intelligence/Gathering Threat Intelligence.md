---
tags:
  - threat-intelligence
  - cti
  - osint
  - ioc
  - dark-web
  - course/lets-defend
---

# Gathering Threat Intelligence


One of the most important things when collecting threat intelligence is to 
keep the range of sources from which data is collected as wide as 
possible. For example, when collecting malicious hashes, it is useful to
 collect them from as many sources as possible. In addition, in order 
not to increase the false positive rate while expanding the sources, we 
can set a false positive limit value and apply false positive filters to
 the collected sources. This way we can remove the sources that bring 
high false positive values from our intelligence sources. We will 
briefly talk about the most popular sources where we can collect threat 
intelligence data and their possible equivalents:

**Shodan**

Shodan is a web-based server search engine. It is one of the most 
popular search engines of its kind, where users can search for systems 
open to the internet with certain filters. Searches related to an 
organization or a country may be conducted through Shodan worldwide. 
Shodan has a flexible structure that can be shaped in any direction we 
want to use it. For example, we can detect all the systems of a specific
 country or an organization with port# 21 that are open to the internet 
via shodan. Usage examples will be explained in detail in the following 
sections.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/shodan_veritoplama_faceit.png)

Many data can be accessed instantly by searching the interface on 
Shodan. Also, we may need to pull the data through the API as collecting
 intelligence manually is not possible.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/shodan_api.png)

You can access the api documentation at https://developer.shodan.io/api and see how data can be retrieved via the API.

Other search engines alternative to Shodan are “BinaryEdge”, “Zoomeye”, and “Censys”.

**Resources Providing IOCs**

Collecting IPs, domains, hashes, and C2s is one of the most important 
methods to protect from potential attacks. Collecting these artifacts 
that belong to newly emerged threat actors allows us to detect these 
malicious actors and protect our systems before they are infected and 
also to take early actions when an activity related to these IOCs is 
observed in our systems.

Resources such as Alienvault, Malwarebazaar, Abuse.ch, Malshare, Anyrun,
 Virustotal, Hybrid-Analysis, Totalhash, Phishunt, Spamhaus, Tor Exit 
Nodes, Urlscan, Zone-h, Rats, Sorbs, Barracuda and many more can provide
 us with IOCs. One of the most basic rules here is to have a list of 
sources as wide as possible and to pull data from these sources as often
 as possible. Almost all of the sources that provide IOC provide data 
via API. Just like Shodan, we can pull data from these sources via API 
and then reach the lowest possible false positive rate through some data
 elimination methods like whitelisting, etc.

**Hacker Forums**

Hacker forums are one of the most important places to gather 
intelligence. Threat actors usually share in hacker forums first when 
they are in preparation for an attack or before they launch a campaign 
against an organization or a country. By analyzing the posts they made 
in these forums, we can find answers to critical questions such as the 
direction of the attack, the targets, the methods to be used in the 
attack, and who is behind the attack.

Sometimes, sales of access to hacked systems are common on these forums.
 In such cases, even if we are compromised, the remediation issues such 
as closing the access to our systems outside of our network, to avoid 
the access of more dangerous people and determining the root cause of 
the incident should be addressed. Below are screenshots of content 
shared on hacker forums:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/exploit2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/exploit1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/altenen2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/altenen1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/xss2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/xss1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/breached3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/breached2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/breached1.png)

**Ransomware Blogs**

Ransomware blogs are one of the sources that have gained popularity with
 the start of the Covid-19 pandemic. Ransomware groups have ramped up 
their activities as of 2020 and started posting the data of their 
victims who refused to pay on their blogs. In addition, they have been 
making their announcements through these blogs. These blogs should 
definitely be resources that we should monitor closely to find answers 
to questions such as which organization is targeted by which group, 
which groups are targeting which countries, what their motivations are, 
and to gather more intelligence on ransomware groups. Some of the most 
popular ransomware groups today are; Lockbit, Conti, Revil, Hive, Babuk.
 You can view the active ransomware groups from the link below and view 
the links to their blogs:

http://ransomwr3tsydeii4q43vazm7wofla5ujdajquitomtd47cxjtfgwyyd.onion/

We need to install the Tor Browser to be able to visit the sites with 
the .onion extensions as .onion extensions are not accessible via 
regular browsers. Tor Browser can be downloaded from torproject.org.

Below are some screenshots from ransomware blogs:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/conti.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/lockbit.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/hive.png)

**Black Markets**

Black Markets are like more systematized versions of the posts in the 
"Selling" categories in the hacker forums. In black markets, credit 
cards, stealer logs, RDP accesses, and prepaid accounts are generally 
sold.

Since the data to be collected from here contains limited information, 
it will not have an actionable output on its own. However, as explained 
before, if an attack surface has been created and if the collected data 
matches any data on the attack surface, then it will produce an 
actionable output. As black markets don’t provide data via API, we can 
extract data from the black markets only by sending requests with 
scripts we write and by parsing the returned requests. Below are 
screenshots from some black markets.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/russianmarket.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/russianmarket2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/russianmarket3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/genesis.png)

**Chatters**

Platforms, where bilateral or multiple written, and audio-visual 
communications are possible, are important in terms of threat 
intelligence. Threat actors may share sensitive data throughout their 
communications with each other on these chatters or important 
information or documents regarding the preparation of an attack may be 
disclosed. This is why we should follow the chatters as possible as we 
can and record everything on those chatters into our database as much as
 possible. Today, popular chatters frequently used by threat actors are 
applications such as Telegram, ICQ, IRC, and Discord. It is possible to 
see posts selling credit cards, accounts, and sales for direct access to
 companies on some groups on these platforms. Below are screenshots of 
some chatters.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/telegram1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/icq.png)

**Code Repositories**

Code Repositories are full of sensitive data that has been forgotten in 
them. Organizations or individual users may forget database access 
information, login information, sensitive configuration files for their 
applications, secret API keys, etc. in the code repositories. This 
information may sometimes be detected by malicious actors and leveraged 
in their attacks. Therefore, monitoring public code repositories is 
important from the threat intelligence perspective. In addition, when a 
new vulnerability is announced, its exploit is often uploaded to these 
code repositories and it is important to identify them. Github, Gitlab, 
and Bitbucket are some of the popular code repository applications. It 
is possible to find sensitive data when searching with certain 
parameters in these applications.
For example, let's search for "password" "abanca.com" in github.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/github1.png)

As the screenshots show, we have 40 results for our search for 
"password" and  "abanca.com" keywords. When we review these results we 
clearly see that the secret API key of Abanca is left open in the second
 file.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/github2.png)

This information may belong to the organization or a third party that 
provides services, but either way, it is obvious that it is highly risky
 that this data is open in this way.

**File Share Websites**

File share sites are applications that many threat actors use actively. 
They can share files anonymously through these sites. Files uploaded on 
these platforms do belong to a specific organization, sometimes to a 
country. Confidential documents of these organizations may be 
distributed through these file share sites in case of a breach of these 
organizations. Monitoring of these sites is important from the threat 
intelligence aspect as we will be aware of the shares about an 
organization that we follow. Thus, if there is a breach, it can be 
detected as early as possible. Popular sites that allow file uploading 
anonymously are sites such as Anonfiles, Mediafire, Uploadfiles, 
WeTransfer, File.io. We cannot download files from these sites directly,
 therefore, we need to use different methods other than API to extract 
data from them. There are 2 different methods to download data from 
these sites. First, before guessing the file name on such sites, we 
detect the unique keys produced for that file through the guessing 
algorithm, and then by sending a request to the application server with 
that key we can retrieve the file in the returned response. This method 
is costly because it requires large processing power. The second method 
is a simpler method with a very low cost. When you upload any file to 
these sites as public, it is observed that browsers index these files 
after a while. These indexed files can be captured and pulled to our own
 servers by using Dork through a script. Dork is queries that allow us 
to search more effectively and quickly.

**Public Buckets**

Bucket applications are cloud-based environments that organizations or 
individuals use to store their data. These environments should be closed
 to the outside of the network and only the authorized users of the 
organization should access them. But this is not the case all the time 
and these environments may be left wide open which causes the disclosure
 of sensitive and confidential data. For this reason, buckets left as 
the public have been an important source of threat intelligence. In 
order to detect these public buckets and to find the endpoints, brute 
force attempts can be made. Let’s say there is a structure named 
“bucketname.amazonaws.com”, we can detect existing buckets by brute 
force in the bucket name field in this structure, and then search for 
files under that endpoint. It is sufficient to have a wordlist 
containing the names of the organization for this. Popular applications 
include Amazon S3 Buckets, Azure Blobs, and Google Cloud Storage.

**Honeypots**

Honeypots are one of the most effective ways to catch the attackers. 
Systems that are easy to breach are very attractive to attackers. 
Honeypots are basically systems with security vulnerabilities that are 
not connected to any critical server or system that works with the logic
 of trapping. It is intended for attackers to attack honeypots so we can
 actively collect IOCs such as attacker IPs and use them in our own 
systems. If we wish, we can build our own honeypot or we can use popular
 honeypots that are already active. Kippo, Cowrite, Glastopf, Nodepot, 
Google Hack Honeypot, ElasticHoney, Honeymail are some of the popular 
honeypots.

**SIEM/IDS/IPS/Firewalls**

An institution may receive hundreds of attacks per day and these attacks
 may be prevented by the written rules on the security products used. 
One of the most effective sources of intelligence is the logs of these 
security products. The logs collected in SIEM or the logs containing the
 blocked IP addresses of the firewall will give us good information 
about the attackers. We can obtain the list that contains the attacker's
 IPs by filtering these logs. Also, the hash of a malicious file 
captured on the SIEM is intelligence for us. It will always keep us one 
step ahead if we see the products we use within the organization as 
critical resources and use them effectively by creating rules and 
scripts to collect data from these sources.

