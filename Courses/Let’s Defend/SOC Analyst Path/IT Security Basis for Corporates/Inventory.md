---
tags:
  - inventory
  - patching
  - access-control
  - soc
  - course/lets-defend
---

# Inventory


Protecting your infrastructure requires knowing what devices are connected to your
 network, what applications are being used, who has access to them, and 
what security measures are in place.

## **What should your inventory contain and why?**

As with all IT security issues, you will need a complete inventory. 
This inventory should include at least the following information:

- the hardware of each workstation and server
- the software installed with the exact version
- the date of the last report

## **End-of-Life Equipment**

Thanks to your inventory, you have been able to isolate all the 
equipment (hardware and software) at the end of their support. Equipment
 that is no longer maintained is equipment that will no longer receive 
security patches. It is then necessary to exclude from your network all 
the equipment that cannot be maintained. In case of extreme necessity, a
 risk acceptance by a CISO(Chief Information Security Officer) must be 
performed and traced in your inventory. This analysis must be reviewed 
at regular intervals, ideally at each new vulnerability discovered.

## **Secure Boot**

The secure boot must be enabled on all your compatible devices. This 
feature ensures that the computer boots using only manufacturer-approved
 software. This is a feature that has been available for 10 years, so it
 is unlikely that a problem will occur if you have standard usage.

## **Softwares List**

In order to reduce the attack surface, it is important that your 
company has a strict policy regarding authorized and unauthorized 
software.

### **Allowed Softwares**

To do so, the use of GPO (Group Policy Object) or [Intune](https://learn.microsoft.com/en-us/mem/intune/fundamentals/what-is-intune)
 allows you to provide your users with a quickly available software 
library without the need for administrative rights to its stations. This
 avoids that your users have to download the installation programs 
themselves and therefore limits the risk of downloading a malicious 
program.

### **Forbidden Softwares**

In the same way, whether via Intune or AppLocker, it is necessary to 
block software identified as forbidden (either because you do not 
legitimize the application or because its version is subject to a CVE 
(Common Vulnerabilities and Exposures) that is dangerous for you). Each 
use of a prohibited application must be reported to your company's IT 
team.

## **Security Hardening**

Does your company rely on proven hardening guides to define the 
configuration of your devices? These hardening guidelines can cover 
different levels such as:

- Station handover procedures with prerequisite checklist
- Audit of the secure configuration of the devices
- Alert in case of configuration modification

This hardening can be done in several ways, such as Ansible, GPO, or Intune.

## **Antivirus / EDR**

Make sure that your company deploys an antivirus, or even an EDR on 
the entire fleet, starting with the devices that are critical to your 
business. Do not forget to set up a follow-up of the generated alerts.

