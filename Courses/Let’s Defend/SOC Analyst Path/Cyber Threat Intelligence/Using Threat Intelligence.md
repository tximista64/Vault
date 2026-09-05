---
tags:
  - threat-intelligence
  - cti
  - attack-surface
  - digital-risk-protection
  - phishing
  - course/lets-defend
---

# Using Threat Intelligence


After the data is interpreted in relation to the attack surface, it will 
become consumable threat intelligence. The intelligence obtained can be 
used in the following 3 different areas. 
External Attack Surface Management (EASM)Digital Risk Protection (DRP)Cyber ​​Threat Intelligence (CTI)

When these 3 areas are combined, they form the XTI structure we 
mentioned at the beginning of our training. Each structure consumes 
intelligence by using it on different topics.

**External Attack Surface Management (EASM)**

EASM is part of XTI, which manages organizations' outward assets. We 
explained how to create the attack surface, which is the basis of 
External Attack Surface Management, in the previous sections. In this 
section, we will cover how we manage the attack surface we have created 
and how it is fed from the collected intelligence.

Attack surface is essential for organizations to detect their unknown or
 forgotten assets and provide visibility and the EASM will come into 
play right at this point since any security vulnerability on these 
assets will pose a risk for the organization. Detected assets must be 
monitored constantly. For example, adding a newly purchased domain to 
the asset list immediately or deleting a discontinued domain from the 
asset list is a part of this monitoring effort. We can keep track of 
these assets through External Attack Surface Management. EASM will 
notify the user if a domain expires, the title of the website changes or
 a subdomain is created. One of the main factors that will provide 
intelligence in this section is the use of information obtained from the
 assets themselves. A second factor is using the intelligence produced 
as a result of the vulnerability data obtained from outside sources like
 Shodan, etc. In this part, we receive notifications about security 
vulnerabilities on our assets as a result of the intelligence we used.

In the section below, the alarms that may occur as a result of the 
active use of threat intelligence by EASM and the actions we can take 
are mentioned:

**New Digital Asset(s) Detected**

This is the warning we will encounter when a new asset is detected and 
added to our continuously monitored asset list. We need to check whether
 the asset really belongs to our organization and was created by the 
authorized users of our organization.

**Domain Information Change Detected**

It is the warning that alerts us when there is any change in the whois 
information of the domain in our asset list. We should check this 
activity to see if it is a harmful activity or not by comparing the old 
and the new data, and verifying if the change is made by the authorized 
users of our organization.

**DNS Information Change Detected**

This is the warning that alerts us when there is any change in the DNS 
records of the domain in our asset list. We should check this activity 
to see if it is a harmful activity or not by comparing the old and the 
new data, and verifying if the change is made by the authorized users of
 our organization.

**DNS Zone Transfer Detected**

This is the warning that alerts us when there is a change DNS Zone 
Transfer status of the domain in our asset list. We should check the DNS
 records for the relevant assets and verify if there is a zone transfer.

**Internal IP Adress Detected**

Since the IP addresses we specify in the A records of our domains are 
open to the public and can be seen outside of our network, they must not
 be internal IP addresses. If an internal IP is disclosed in the A 
record of a domain or subdomain, we will receive an alert that warns us 
of the “Internal IP Address Detected” on our EASM side. This may happen 
due to the lack of communication between different teams in our 
organization. In such cases, the process should be verified by 
contacting the POC of the DNS record maintenance and the root cause 
should be investigated. The IP should be changed if its use is not 
necessary.

**Critical Open Port Detected**

This is the warning that alerts us when there is an indication for open 
critical ports on the IPs that we are monitoring within the intelligence
 we received from sources such as “Shodan”. We should check the ports 
claimed to be open on the relevant IP addresses that we receive the 
alert, and we should close or filter them if they are not the ports used
 by our network actively. If the open ports are used actively, then we 
should update the services running on them and keep them up to date, and
 make sure that necessary configurations are complete.

**SMTP Open Relay Detected**

This is the warning that alerts us when there is an open relay status 
for our mail server which we monitor within our asset list. We should 
investigate the mail server in question and verify the status of the 
mail server by contacting the POC of the server.

**SPF/DMARC Record Not Found**

SPF and DMARC records are constantly checked for domains that we track 
in our asset list, and we receive this alert when these records are not 
found. These records must be configured correctly for the security of 
our mail servers. We need to contact the POC of our mail server and 
verify its status.

**SSL Certificate Revoked/Expired**

SSL certificates are one of the most important elements for secure 
communication. Our SSL certificates hosted on our domains should be 
monitored regularly within our asset list. We will receive this alert if
 one of our SSL certificates is expired or revoked. Any communication 
carried out without SSL poses high risks as the data is transmitted in 
clear text and can be seen by third parties. Therefore, we need to renew
 our SSL certificate as soon as possible when we receive this alert.

**Suspicious Website Redirection**

Sometimes we redirect some of our domains to some of our websites. If we
 do this frequently, we are likely to miss suspicious redirects. 
Therefore, we need to receive feeds that provide us with the status 
codes of our websites and where they are directed. If we receive this 
alert, it means that one of our domains in our asset list is redirecting
 to a website that is not in our asset list. This indicates a potential 
breach. We must urgently check the redirection and report the case to 
the relevant team that manages these issues.

**Subdomain Takeover Detected**

We receive this alert if a takeover is detected on a subdomain. This 
case should be investigated to find the DNS record that this takeover 
took place and the details should be shared with the team that will 
handle the case.

**Website Status Code Changed**

We receive this alert when the status code that our website returns back
 to us is changed. This warning comes to us from the data containing the
 status codes of the websites. In order to prevent service 
interruptions, the status code and the problem should be determined with
 its root cause, and the solutions to remediate the issue should be 
applied immediately.

**Vulnerability Detected**

This alert comes to us as a result of intelligence obtained from 
vulnerability data. If we encounter this warning, it means that there is
 a match between the vulnerabilities in the data and our network 
applications, SSL certificates, domains, websites, IPs, or 3rd party 
technologies. If the warning is generated from the CVE data and there is
 product and version information in which the vulnerability is triggered
 in the details of the CVE, the accuracy of the alert is very high, 
immediate action must be taken and the suggested fixes should be applied
 immediately. The accuracy rate may be slightly lower if the warning is 
coming from other sources like shodan, etc.

**Digital Risk Protection**

DRP is the part of XTI that constitutes most of the intelligence for the
 organization after all the data collected from all the sources are 
mapped with the attack surface following the interpretation of the data.
 In this section, we will cover topics such as the protection of brand 
reputation, threats on the Deep&Dark Web, fraud protection specific 
to banks, the impact of risks that may occur in any organization in the 
supply chain, threats to the organization on the web surface and 
protection for senior executives, and the threats and risks we may face 
related to these as well as how we should take action against them will 
be detailed.
Below are the alarms that we may encounter within the scope of DRP and 
the actions we can take:

**Potential Phishing Domain Detected**

Newly registered domains or previously registered domains with newly 
created SSL certificates are an intelligence source for us. After 
interpreting the data obtained from these sources, we encounter this 
warning for domains with a structure similar to our domains in the 
intelligence obtained. When we receive this alert, we should investigate
 the relevant domain in safe environments and determine whether they are
 mimicking our original content. If these domains mimic our brand and/or
 content, we should contact the domain registrar and the ISP that hosts 
the content of the fraudulent site to take it down immediately. If there
 is nothing suspicious in the content, the domain should still be 
monitored there is a high potential for that domain to turn into a 
phishing site.

**Rogue Mobile Application Detected**

If our organization has mobile applications, we will receive this alert 
if there is a match with our official mobile application and the data 
that contains the pirated APK files found on pirated APK sites with 
similar names and similar content. The APK files transmitted in this 
alert should be analyzed in a safe environment, and quick remediation 
action should be taken if they are found malicious. These copycat mobile
 applications should be taken down immediately to avoid any malicious 
activities and to protect our brand reputation.

**IP Address Reputation**

There are multiple reasons that cause the loss of reputation of IP 
addresses. If we receive this alert it means that there is an incident 
that occurred affecting our IP reputation. Possible reasons for the loss
 of the IP reputation are as follows:
If the IP address is blacklisted on any source for any reason,If the IP address is found in a feed containing harmful IOCs, If the IP address has been involved in an activity in the torrent network,

then the reputation of the IP address will be lost. 

We will receive this alert if any of our IP addresses are among the 
resources that will cause this reputation loss. If it is a blacklist 
case, we should investigate the root cause and determine on what sources
 it has been blacklisted. The root cause of the blacklist should be 
investigated and eliminated. It will be more risky and harmful if our IP
 addresses have been found in a feed containing harmful IOCs or involved
 in the torrent network because our IP addresses could potentially be 
used in a malicious campaign. This raises the possibility that the 
organization has been breached. In this case, we must quickly 
investigate the relevant systems retrospectively and identify the root 
cause. If the breach has happened, we need to enforce the internal 
policies.

**Impersonating Social Media Account Detected**

Social media is a platform that many organizations use to represent 
themselves. Thousands of new accounts are created every day on these 
platforms. Not all accounts are created with good intentions. Many 
accounts may be created with user names that can imitate the original 
accounts of the organization or with the intention to conduct smear 
campaigns against the organization. We will receive this alert if we 
encounter such a situation. In this case, the relevant account should be
 reviewed and determined whether it is just a name similarity or an 
attempt to mimic. If the account is being used for fraud or a smear 
campaign against our organization, we should contact the support team of
 the relevant social media application and request that this account be 
closed.

**Botnet Detected at Black Market**

We receive this alert if any of our organization’s domain or IP 
addresses is included in the botnet data in the black markets. The user 
system that became a bot reported in the alert may belong to one of our 
employees or customers. If the system belongs to a customer, the user’s 
password should be reset to remediate the incident. If the system 
belongs to one of our employees forensics investigation should be 
conducted, the system should be isolated from the network immediately, 
employee’s network credentials must be reset. Further investigations 
must be conducted on the system to determine if the system is infected 
or not.

**Suspicious Content Detected at Deep&Dark Web**

Deep&Dark web environments are monitored and all data is collected 
regularly. We receive this alert if there is anything that mentions our 
organization in the data after the collected data is interpreted. For 
example, if there is a post on a hacker forum mentioning an attack 
against our organization, then we can implement security tightening even
 before the attack occurs. We can avoid the attack totally or get it 
over with the least damage thanks to these posts. When we encounter this
 alert, the post that threatens our organization and its content should 
be analyzed thoroughly, and necessary actions should be taken 
accordingly.

**Suspicious Content Detected at IM Platforms**

Instant messaging platforms such as Telegram, ICQ, and IRC are the 
environments that threat actors use for communication. We receive this 
alert if there is anything that mentions our organization in the data 
after the conversations of the threat actors in the public or private 
groups of these platforms are monitored and the collected data is 
interpreted. In this case, the conversation or the statement about our 
organization should be analyzed thoroughly and the context of the 
mention regarding our organization should be determined. If there is a 
threat to the organization, necessary actions should be taken quickly.

**Stolen Credit Card Detected**

It is a common situation for fraud teams of banks. Threat actors steal 
credit card information by phishing or other ways and share or sell them
 in the dark web environment. In these types of cases, banks should 
follow these stolen credit cards well in order to protect their 
customers. We receive this alert if a stolen credit card number matches 
with one of the bank’s with the help of the intelligence gathered. In 
this case, we must inform the fraud teams immediately and take action to
 cancel the card.

**Data Leak Detected on Code Repository**

We mentioned that code repositories such as Github, Bitbucket, Azure 
Blob, and Amazon S3 where we can store data or store codes are one of 
the sources of intelligence. Sometimes sensitive data for the 
organization may be forgotten in such environments. We will receive this
 alert if sensitive and critical data such as an IP address of the 
organization, domain, database access information, login information 
that belongs to employees, or if a sensitive report related to the 
organization is detected in a bucket through the intelligence gathered. 
In this case, we must take quick action to delete the sensitive data if 
we manage the relevant repository or bucket. If someone outside of our 
organization manages it, then, we should go after the takedown option.

**Company Related Information Detected on Malware Analysis Services**

Public sandboxes are one of the important intelligence sources for the 
organization to detect malicious files against our organization. 
Thousands of samples are uploaded and analyzed in these sandboxes every 
day. A malicious file referring to our organization is crucial for our 
organization. It may target our organization directly or may have been 
uploaded by an attacker with the intention of smearing our organization.
 In these cases, we receive these alerts as a warning for these 
malicious files that refer to our organization within the collected data
 and we should investigate and analyze the malicious file and take the 
necessary actions.

**Employee and VIP Credential Detected**

These are the warnings that will occur if there is a data leak related 
to our employees, especially the VIPs that we keep monitoring actively. 
When we see these alerts we need to apply the password reset process for
 the relevant users quickly.

**Cyber Threat Intelligence** 

CTI is considered a part of XTI, which is the next-generation threat 
intelligence. It is a sub-branch of XTI and it is where we can be aware 
of what is happening in the cyber world in general, where we can learn 
about current malicious campaigns, the orientation of ransomware groups,
 or offensive IP addresses around the world. Since it may be difficult 
to protect our organization with CTI alone, we should support the CTI 
with our corporate feeds to obtain the most efficient intelligence. We 
are able to use our SIEM, SOAR, and EDR tools more effectively by 
integrating them into the CTI feeds and protect our organization better.

- External Attack Surface Management (EASM)
- Digital Risk Protection (DRP)
- Cyber ​​Threat Intelligence (CTI)
- If the IP address is blacklisted on any source for any reason,
- If the IP address is found in a feed containing harmful IOCs,
- If the IP address has been involved in an activity in the torrent network,

