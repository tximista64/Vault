---
tags:
  - edr
  - endpoint-security
  - soc
  - course/lets-defend
---

# EDR - Endpoint Detection and Response



## What is EDR?

Endpoint Detection and Response (EDR), also known as Endpoint Threat 
Detection and Response (ETDR), is an integrated endpoint security 
solution that combines continuous, real-time monitoring and collection 
of endpoint data with rules-based automated response and analysis 
capabilities. (Definition source: mcafee.com)

Some EDR solutions commonly used in the workplace: CarbonBlack, SentinelOne, and FireEye HX.

## Quick Tip

If you have any type of IOC, such as a file hash, file name, etc., 
you can perform a search in EDR across all hosts and see if there is a 
match. For example, let's say you are certain that a device has been 
hacked and you have obtained a file with an MD5 hash of 
"ac596d282e2f9b1501d66fce5a451f00". You can search for this hash value 
in EDR and determine whether this file exists or is being executed on 
other devices. This will help you understand who has been affected by 
this attack.

