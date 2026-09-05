---
tags:
  - network-security
  - pcap
  - segmentation
  - soc
  - course/lets-defend
---

# Network


Monitor your organization's incoming and outgoing Internet traffic.

### **PCAP**

Use the SPAN ports of your network equipment to capture your network 
activities. This capture will allow you to detect abnormal behavior 
(increased use of a protocol, abnormal destination addresses, etc.) as 
well as to perform a post-mortem in case of compromise.

### **Segmentation**

Segmentation divides a computer network into smaller parts. Network 
segmentation improves network performance and security by reducing the 
attack surface and limiting the range of an attack. The use of VLAN, 
PVLAN allows you to separate your different networks.

Are the administration interfaces of your network equipment available
 from Alice's (or whoever) accounting station? Is the remote office 
service only available on a dedicated network?

### **Review of Blocked Flows**

Now that your corporate network is segmented, and flows are 
prohibited, the next step is to set up a review to identify the origin 
of the requests that get blocked with your new policy. It could be a 
compromised workstation, an application that went under your radar in 
the inventory, etc.

### **Alert Outside of Standard Use**

Once all this is in place, you can generate alerts in case of 
abnormal network usage. Besides the security gain, these alerts could 
allow you to identify weak points in your organization, for example when
 your backup tools saturate the network.

