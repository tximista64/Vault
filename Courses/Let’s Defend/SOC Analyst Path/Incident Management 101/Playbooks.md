---
tags:
  - incident-management
  - playbooks
  - soc
  - course/lets-defend
---

# Playbooks


There are many different types of alerts (web attacks, ransomware, malware, 
phishing, etc.) in the SOC environment. The methods and approaches of 
investigating these alerts are different from each other. The workflows 
prepared for effective and consistent analysis of alerts created on SIEM
 or a different security tool are called playbooks.

For example, when you click the “Create Case” button for an alert on the
 LetsDefend Monitoring page, a ticket opens on “Case Management” and the
 system automatically assigns you a playbook. So you can investigate the
 alert with the right steps by following the instructions there.

**Why is Playbook Important?**

As SOC analysts, we may not always know exactly what to do when handling
 alerts. We can carry out the investigation process step by step, thanks
 to the instructions in the Playbook. Playbooks will provide guidance, 
especially to analysts who have just started their careers in the SOC 
field.

We mentioned that playbooks guide analysts. Apart from that, it enables 
the team to perform analysis at certain standards. For instance, 
checking to see whether there is access to C2 sites/IP addresses is 
vital after analyzing malware. However, some analysts may not be 
checking to see the C2 access all the time, while others do. This leads 
to inconsistency in the team's work standards. It is important that 
playbooks are created and followed by all the analysts in order to 
ensure the same level of analysis standards within the team.

In the example below, you can see the phishing playbook stream that Microsoft has published.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Incident+Management+101/images/playbook.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Incident+Management+101/images/ms-playbook1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Incident+Management+101/images/ms-playbook2.png)

