---
tags:
  - incident-management
  - soc
  - siem
  - threat-intelligence
  - course/lets-defend
---

# Incident Management Systems (IMS)


Incident Management Systems is where SOC teams conduct the investigation process
 and record the actions taken when an incident occurs. For this reason, 
SOC analysts spend a significant part of their time at the interface of 
these systems.

An example of IMS is the open-source TheHive project.

Similarly, "Case Management" on LetsDefend can be given as an example to the Incident Management Systems.

**How Incident Management Systems (IMS) Works?**

In order to open a record on the Incident Management platform, a data 
entry must first be provided here. This data can directly come from the 
SIEM or from other security products. After the data flow is 
established, a ticket/case is created on the Incident Management System.

If integrations with “Threat Intelligence”, “SOAR”, and similar 
platforms are established data within the case is enriched and this 
helps in responding quickly. For example, let's say there is a 
suspicious "letsdefend.io" domain in the incident. If there is an 
integration between IMS and the threat intelligence platform, the 
reputation of the “letsdefend.io” domain address is automatically 
queried and provided to the SOC analyst. If there is not a threat 
intelligence platform integration, then a manual query from the 
open-source platforms such as Virustotal is required.

In addition, SOAR products also offer integration with other security 
products. Many SOAR products can integrate with products such as 
Firewall, IPS, WAF, Proxy, Email Gateway, Email Security products. If we
 are sure that the domain “letsdefend.io” is harmful and we want to 
prevent access to this address from within the organization, we can 
quickly block this domain via a proxy with the help of SOAR.

Consider the "Investigation Channel" on the LetsDefend Monitoring page. A
 new "Case" is created on the "Case Management" when we click the 
"Create Case" button here. In other words, a new record is created on 
the IMS.

Lastly, you can check the SIEM dashboard as a SOC analyst:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Incident+Management+101/images/1-hive.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Incident+Management+101/images/2-case-management.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Incident+Management+101/images/3-monitoring.png)

Generally, as we see in the picture below, alert details from SIEM are 
transmitted to the Incident Management System and the Incident 
Management System works in coordination with the Threat Intelligence and
 SOAR platforms to process all the data and a new case/ticket is 
created. Thanks to Threat Intelligence and SOAR integrations on IMS, 
data enrichment and various actions are provided. Finally, the alert is 
closed when the operations are complete.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Incident+Management+101/images/4-ims-system.png)

**P.S.:**

As we mentioned before, Incident 
Management System (IMS) is one of the platforms where you will spend 
most of your time as a SOC Analyst. You can significantly shorten your 
investigation time and get rid of your repetitive tasks if you use IMS 
platforms effectively. Therefore, you should always take your knowledge 
and skills on IMS platforms to the next level.

