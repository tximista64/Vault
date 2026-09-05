---
tags:
  - llmnr-poisoning
  - ntlm
  - responder
  - hashcat
  - active-directory
  - windows
  - course/tcm-academy
---
# LLMNR Poisoning + (hashcat tips)
LLMNR (Link-Local Multicast Name Resolution) is used to identify hosts when DNS fails to do so

Previously NBT-NS

Key flaw is the services use a user's username and NTLMv2 hash when approprieated respond to

We can use responder tool (in kali) to intercept hashes `sudo responder I wlan0 -dwp`

L'option w correspond à wpad

The **Web Proxy Auto-Discovery (WPAD) Protocol** is a method used by clients to locate the URL of a configuration file using [DHCP](https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol) and/or [DNS](https://en.wikipedia.org/wiki/Domain_Name_System)discovery methods. Once detection and download of the configuration file is complete, it can be executed to determine the proxy for a specified URL.

Once intercepted you can crack the hash with hashcat

hashcat \--help **|** grep NTLM   
 

hashcat -m  5600 hash.txt /usr/share/worlists/rockyou.txt 

option -r Onerule

