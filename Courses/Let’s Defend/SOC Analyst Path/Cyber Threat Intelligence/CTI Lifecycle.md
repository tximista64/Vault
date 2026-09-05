---
tags:
  - threat-intelligence
  - cti
  - cti-lifecycle
  - ioc
  - soc
  - course/lets-defend
---

# CTI Lifecycle


**Planning and Direction**

The planning and directing phase should be the foundation of a structure
 that must function flawlessly. Planning is the part that allows us to 
find answers to questions such as what exactly is expected from 
intelligence, who will consume the intelligence obtained, and which 
teams or individuals will take action as a result of the intelligence 
obtained. Intelligence will be used by executives or a team of analysts.
 You can directly feed your SOC team with the intelligence obtained 
and/or present summary reports to your managers. At this point, what you
 want is important. Your requests will also clarify the scope of the 
intelligence. For example, an organization can determine the scope of 
intelligence it wants to obtain by asking the following questions:

**Does your organization have a SOC team?**

This question shows us whether there is a technical team that will 
actively use the intelligence obtained, and if there is, it is an 
indication that shows us we can go down to the technical details of the 
intelligence. If there is not a SOC team it indicates that the 
intelligence will be consumed by managers. In this case, an intelligence
 model that offers clearer and more understandable summaries can be 
taken as a basis, without being bogged down in technical details.

**Has your organization been attacked before? If so, what was the success rate of the attack?**

The fact that the organization was exposed to a high rate of successful 
attacks can be used to reduce the success rate of future attacks by 
putting the intelligence on the basis of the established structure, and 
the intelligence obtained with the data collected from the current 
attacks. This tells us how often we will use intelligence in the 
organization. It controls how often we pull data from internal and 
external sources. It is important that the intelligence obtained is 
constantly updated and consumed quickly for frequently attacked 
organizations.

**Do the attacks target organization or individuals?**

It is important to focus on the External Attack Surface Management area,
 which the intelligence contains, to make the threat surface as clear as
 possible and to follow it up regularly for attacks targeting the 
organization. External Attack Surface Management is to determine and 
manage the attack surface of organizations. It will be covered in detail
 in the following sections.
For attacks targeting individuals, the Digital Risk Protection part is 
crucial. Digital Risk Protection defines the digital risks that 
organizations may face through the attack surface. It will be covered in
 detail in the following sections. It reveals that we need to clarify 
certain issues such as users' login credentials, their risks to be 
exposed to phishing attacks, and defining the strength of your password 
policy.

**Are other companies in your industry exposed to the same attacks you received?**

This question explains the need for us to turn to industry-based 
intelligence that provides us with intelligence about other companies in
 our industry. When other companies are getting attacked, industry-based
 intelligence provides us with the IOC (Indicators used to identify 
attacks digitally, and threat actors) related to that specific attack, 
and also it will allow us to avoid that attack with minimum damage if we
 are exposed to the same attack.

**Information Gathering**

The information collection stage is the part where we determine what 
sources we will collect data from. These resources can be both internal 
and external. Some of the sources we will collect data from are as 
follows:
Hacker ForumsRansomware BlogsDeep/Dark Web Forums and Bot MarketsPublic SandboxesTelegram/ICQ/IRC/Discord/Twitter/Instagram/Facebook/LinkedInSurface Web(Cybersecurity Blogs etc.)Public Research ReportsFile Download SitesGithub/Gitlab/Bitbucket etc.Public Buckets (Amazon S3/Azure Blob etc.)Shodan/Binary Edge/Zoomeye vb.Sources that provide IOC (Alienvault, Abuse.ch, MalwareBazaar vb.)HoneypotsSIEM, IDS/IPS, FirewallsPublic Leak Databases**Processing**

The data obtained is processed at this stage which may be considered a 
filter. We clean the data from false positives as much as possible, pass
 it through certain rule sets, and subject it to some correlations. At 
the end of this process, we get the information we need.

**Analysis and Production**

The information obtained is interpreted and analyzed at this stage and 
the consumable intelligence is obtained as a result of the output of the
 analysis. After this point, appropriate reports are to be prepared 
according to who will consume the intelligence.

**Dissemination and Feedback**

Dissemination of the intelligence appropriately is the next step for 
whom the intelligence is intended. For example, intelligence from 
external sources to the technical team should be distributed to other 
users in the organization through appropriate channels, and the 
necessary feedback should be given to make the intelligence better and 
more efficient at the end of the whole process. Let's say that content 
with the name of our organization is created through a site builder at 
the subdomain of letsdefend.blogspot.com. If the blogspot.com domain is 
marked as suspicious or harmful in the intelligence and not this 
subdomain, this will result in many false positives. In such cases, we 
need to improve the intelligence with feedback.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Cyber+Threat+Intelligence/images/cti-lifecycle.png)

- Hacker Forums
- Ransomware Blogs
- Deep/Dark Web Forums and Bot Markets
- Public Sandboxes
- Telegram/ICQ/IRC/Discord/Twitter/Instagram/Facebook/LinkedIn
- Surface Web(Cybersecurity Blogs etc.)
- Public Research Reports
- File Download Sites
- Github/Gitlab/Bitbucket etc.
- Public Buckets (Amazon S3/Azure Blob etc.)
- Shodan/Binary Edge/Zoomeye vb.
- Sources that provide IOC (Alienvault, Abuse.ch, MalwareBazaar vb.)
- Honeypots
- SIEM, IDS/IPS, Firewalls
- Public Leak Databases

