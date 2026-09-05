---
tags:
  - brute-force
  - windows
  - rdp
  - log-analysis
  - course/lets-defend
---

# Windows Login Brute Force Detection Example


## **7.1 Windows Login Records**

Considering the general situation, a login activity appears in all 
successful or unsuccessful cyberattacks. An attacker often wants to log 
into the server to take over the system. For this purpose, it can 
perform brute force attack or directly login with the password in hand. 
In both cases (successful login / unsuccessful login attempt) the log 
will be created.

Let’s consider an attacker logged into the server after a brute force
 attack. To better analyze what the attacker did after entering the 
system, we need to find the login date. For this, we need “Event ID 4624
 – An account was successfully logged on”.

Each event log has its own ID value. Filtering, analyzing and 
searching the log title is more difficult, so it is easy to use the ID 
value.

You can find the details of which Event ID value means what from the URL address below.

[https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/default.aspx](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/default.aspx)

Log file for lesson:

[Log_File.zip Pass=321](https://files-ld.s3.us-east-2.amazonaws.com/Log_File.zip) (https://files-ld.s3.us-east-2.amazonaws.com/Log_File.zip)

To reach the result, we open the “Event Viewer” and select “Security” logs.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-1.jpeg)

Then we create a filter for the “4624” Event ID.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-2-1024x585.jpeg)

And now we see that the number of logs has decreased significantly 
and we are only listing logs for successful login activities. Looking at
 the log details, we see that the user of “LetsDefendTest” first logged 
in at 23/02/2021 10:17 PM.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-3.jpeg)

When we look at the “Logon Type” field, we see the value 10. This 
indicates that you are logged in with “Remote Desktop Services” or 
“Remote Desktop Protocol”.

You can find the meaning of the logon type values on Microsoft’s page.

[https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4624](https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4624)

In the next section, we will detect the Brute force attack the attacker made before logging in.

## **7.2 Windows RDP Brute Force Detection**

In this section, we will catch an attacker who is in the lateral 
movement phase. The attacker is trying to jump to the other machine by 
brute force over RDP.

Download log file: Log_File.zip Pass=321

[Log_File.zip Pass=321](https://files-ld.s3.us-east-2.amazonaws.com/Log_File.zip) (https://files-ld.s3.us-east-2.amazonaws.com/Log_File.zip)

When an unsuccessful login operation is made on RDP, the "Event ID 
4625 - An account failed to log on" log is generated. If we follow this 
log, we can track down the attacker.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-11.png)

After filtering, we see 4 logs with 4625 Event IDs.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-12.png)

When we look at the dates, we see that the logs are formed one after 
the other. When we look at the details, it is seen that all logs are 
created for the "LetsDefendTest" user.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-13.png)

As a result, we understand that the attacker has unsuccessfully 
attempted to login 4 times. To understand whether the attack was 
successful or not, we can search for the 4624 logs we saw in the 
previous section.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-14.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-15.png)

As can be seen from the results, the attacker succeeded in connecting to the system with the 4624 log after the 4625 logs.

