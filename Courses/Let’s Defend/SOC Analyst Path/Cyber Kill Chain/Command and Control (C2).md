---
tags:
  - cyber-kill-chain
  - command-and-control
  - network-security
  - soc
  - course/lets-defend
---

# Command and Control (C2)


The sixth stage of the Cyber Kill Chain is the "Command and Control 
(C2)" step. At this point, the attacker has completed several crucial 
tasks of the attack and has prepared the Command and Control (C2) server
 to deliver commands to the system. The attacker can send remote 
commands to the system and execute them at this step.

## **Adversary**

In the "Command and Control (C2)" stage, what the attacker does is 
establish contact between C2 and the target system. This stage does not 
include the execution of the actions targeted by the attacker. Once the 
C2 communication is complete, the attacker will proceed to carry out 
malicious activities.

Briefly, what the attacker does at this stage is as follows:

- Configuring C2 Server to communicate with the victim
- Implementing the necessary actions on the victim's device to make its contact with C2 possible.

## **Defender**

Although there is no specific action for blue teams at this stage, 
general security monitoring and detection techniques and practices 
within the context of C2 communication should be considered. Blueteams 
should take the appropriate steps to recognize and prevent potential C2 
network traffic flow. The following are some steps to be taken:

- To determine whether the known C2 tools are available on systems
- Blocking C2 server IP addresses from Cyber Threat Intelligence sources through security products such as Firewall
- To detect network traffic that may be C2 communication with Network Security Monitoring on the system

