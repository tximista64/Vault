---
tags:
  - windows
  - wmi
  - lateral-movement
  - course/lets-defend
---

# Windows Management Instrumentation (WMI)


WMI port 135

**What is Windows Management Instrumentation (WMI)?**

Windows Management Instrumentation (WMI) is a feature used to access 
components of the Windows operating system. WMI allows local and remote 
access. That's why it's one of the Windows features that attackers often
 use. Attackers can use WMI for reconnaissance as well as for "Lateral 
Movement" purposes.

**Lateral Movement:**  It is called the attackers' movement
 by gaining access on other machines in the same network after obtaining
 the first access on the target system.

WMI is often preferred by attackers because it is readily available on 
the Windows operating system and has wide usage features. For example, 
attackers could remotely run executable files this way.

**Using WMI**

When obtaining information on the system using WMI, the "wmic" command 
on the command line is used. For example, let's see the information 
about the operating system using WMI:

As can be seen in the image above, information about the operating 
system has been successfully printed on the screen using WMI with the 
"wmic os list brief" command.

As another example, let's see the names of the users in the system with 
WMI:

As can be seen in the image above, the names of the users in the system 
were successfully printed on the screen using WMI with the "wmic 
useraccount get name" command.

The number of operations that can be done with WMI is quite large. For detailed information, you can use the following address:

**WMIC:** https://ss64.com/nt/wmic.html

In this part of the training, what the "Windows Management 
Instrumentation (WMI)" feature is, its importance in terms of security 
and its use are mentioned.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/wmi1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/wmi2.png)

