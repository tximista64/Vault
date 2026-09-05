---
tags:
  - cyber-kill-chain
  - installation
  - persistence
  - soc
  - course/lets-defend
---

# Installation


The fifth phase of the Cyber Kill Chain is the "Installation" phase. At this stage, the attacker attempts to maintain persistence on the target system that was exploited. The attacker attempts to gain an access path that can be accessed at any time by installing a backdoor on the system. Because the exploited vulnerability will be patched and rendered inoperable after a certain time, the attacker must use a different method to gain access to the target system. At this point, the malware to be installed on the target device can alternatively be placed with the help of a dropper. At this point, the attacker may attempt to acquire access to a highly authorized user account in the system via privilege escalation tactics in order to assure system persistence. This is the stage at which attack preparations are carried out to achieve the ultimate aims once the cyber attack has begun.

## **Adversary**

In the "Installation" step, an attacker can perform a wide range of 
operations. The attacker can successfully perform various technological 
activities provided that they are constrained to their authority in the 
system they exploit. While performing these operations, the attacker 
tries to leave as few traces as possible on the system and ensure that 
security products do not interfere with the operations. In this manner, 
the attacker can remain undetected on the system for a longer period, 
gaining the required time to carry out the attack. At this stage, the 
attacker can perform the following actions:

- Install malware on the victim's device.
- Placing a backdoor on the victim's system
- Install web shell on the web server (if it is a web server).
- Adding a service, firewall rule, or scheduled task to ensure the persistence of the victim device

## **Defender**

The operations that Blueteams apply against attackers at this stage 
consist of the operations of Threat Hunting. The fact that an attacker 
who reached this stage is performing malicious activities on the systems
 indicates that the attacker cannot be detected. Therefore, whether the 
attacker is present or not, the SOC team should manage and execute 
security operations under the assumption that there is always an 
attacker present in the system. Security operations that can be 
performed at this level will depend on the current structure. The 
following are some activities that can be taken generally:

- To carry out Network Security Monitoring operations on all assets of the organization
- Using EDR security solutions to be aware of configuration changes applied on each endpoint
- Restricting access to critical files on systems and monitoring access
- Restricting access to critical paths on systems and monitoring access
- To allow the use of admin privileges only for mandatory situations by making authorization arrangements for users on the systems
- Detecting malicious process activities by monitoring the processes running on the systems
- Allowing only executable files with a valid signature to be run on the system
- Detect anomalies in all monitored system activities and find the root cause

