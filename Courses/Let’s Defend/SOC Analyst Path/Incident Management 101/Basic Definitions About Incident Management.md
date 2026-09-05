---
tags:
  - incident-management
  - soc
  - siem
  - course/lets-defend
---

# Basic Definitions About Incident Management



In this section, we will explain the basic concepts that you need to know 
about incident management. Since you will encounter these concepts 
frequently during your education and your daily work routine, we 
recommend that you understand these concepts thoroughly:

AlertEventIncidentTrue PositiveFalse Positive**Alert**

We talked about how an alert is created in the SIEM training module. You
 can click on the link 
(https://app.letsdefend.io/training/lessons/siem-101) to access the 
training. To briefly recall, an alert is generated as a result of data 
collection and processing (parsing, enriching, etc.) in SIEM, as seen in
 the image below. Then, we start the analysis process by sending the 
generated alarms to the Incident Management System.

**Event**

An event is any observable occurrence in a system or network. Simply, 
events are activities like a user connecting to a file share, a server 
receiving a request for a Web page, a user sending electronic mail 
(e-mail), a firewall blocking a connection attempt, etc.

**Incident**

The definition of a computer security incident has evolved over time. In
 the past, a computer security incident was thought of as a 
security-related adverse event in which there was a loss of data 
confidentiality, disruption of data or system integrity, or disruption 
or denial of availability.

A lot of new types of computer security incidents have emerged since 
then, and this necessitated an expanded definition of “incident”. 
Generally, an incident is a violation or imminent threat of violation of
 computer security policies, acceptable use policies, or standard 
security practices.
*Definitions: NIST Special Publication 800-61***True Positive Alert**

If the situation to be detected and the detected (triggered alert) 
situation are the same, it is a True Positive alert. For example, let's 
say you had a PCR test to find out whether you are Covid19 positive and 
the test result came back positive. It is True Positive because the 
condition you want to detect (whether you have Covid19 disease) and the 
detected condition (being a Covid19 patient) are the same. This is a 
true positive alert.

Let’s suppose there is a rule to detect SQL Injection attacks and this 
rule has been triggered because of a request that was made to the 
following URL. The alert is indeed a “True Positive” as there was a real
 SQL Injection attack.

https://app.letsdefend.io/casemanagement/casedetail/115/src=' OR 1=1

**False  Positive Alert**

In short, it is a false alarm. For example, there is a security camera 
in your house and if the camera alerts you due to your cat's movements, 
it is a false positive alert.

If we look at the URL example below, we see the SQL parameter "Union" 
keyword within this URL. If an SQL injection alert occurs for this URL, 
it will be a false positive alert because the “Union” keyword is used to
 mention a sports team here and not for an SQL injection attack.

https://www.google.com/search?q=FC+Union+Berlin

In order to better understand the definitions, you can compare the terms and definitions in a single table as follows:

*img source:towardsdatascience.com*

- Alert
- Event
- Incident
- True Positive
- False Positive

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Incident+Management+101/images/siem-alert.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Incident+Management+101/images/false-positive-true-positive.png)

