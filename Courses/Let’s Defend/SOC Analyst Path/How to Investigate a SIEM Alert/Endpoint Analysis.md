---
tags:
  - siem
  - incident-response
  - edr
  - endpoint-security
  - course/lets-defend
---

# Endpoint Analysis



In this lesson, we will perform an Endpoint Security analysis, which 
involves examining the processes and browser activity on the affected 
endpoints to identify any further indicators of compromise.

Endpoint security operates as an Endpoint 
Detection and Response (EDR) system, collecting log data and providing 
insight into activity on the host machine. Like EDRs such as Carbon 
Black, SentinelOne, CrowdStrike, and most others EDRs, LetsDefend 
Endpoint Security allows you to connect to machines, collect detailed 
logs, and even isolate compromised machines.

We will continue to examine the actions 
taken by the malware on Endpoint Security in more detail. This approach 
will allow us to verify whether the malware was executed on the system 
and identify the processes or commands it executed.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/How+to+investigate+SIEM+alert/6.Endpoint+Analysis/image6_1.png)

## Navigating to Endpoint Security

To begin the analysis, navigate to Endpoint Security. This 
section provides comprehensive details about the host machine, including
 its processes, network actions, terminal history, and browser history.

Steps to Follow:

**Select the Host:**

- Find the host by typing its IP address or hostname in the search bar.

**Review Endpoint Information:**

- Examine the host information displayed, including the hostname, IP address, operating system, and last login details.

## Process and Network Action Analysis

Process and network 
action analysis aims to detect suspicious processes and identify 
communication with command and control addresses.

**Analyze Processes:**

- Check the list of running processes. Look for any unfamiliar or suspicious processes that could indicate malicious activity.
- Dive deeper into the details of any identified suspicious processes.
- Broaden your investigation to include related processes, examining both parent and child processes to uncover hidden links.
- Analyze the suspicious process HASH on Threat Intel platforms.

**Network Actions:**

- Check network activity during the alert's time frame.
- Note any unusual inbound or outbound connections that may indicate communication with a C2 server.
- Cross-reference these indicators of compromise (IOCs) on threat intel platforms.

## Terminal and Browser History Analysis

As a part of the 
analysis, we must examine terminal history to see if any commands were 
typed into the computer that seems suspicious or unusual, as this could 
be a sign that someone was trying to do something they shouldn't.

Similarly, when we 
examine the browser history, we're looking for any visits to websites 
that are known to be malicious, or any links that may have been clicked 
on to download dangerous files.

**Terminal and Browser History:**

- Check the terminal history to identify suspicious commands executed on the host.
- Examine the browser history to identify any visits to malicious websites or download links.

Once we've completed this analysis, we can move on to the next step in the playbook.

## Containment

Quickly implementing containment measures is vital in preventing further damage to the system.

### Why is Containment Necessary?

- Prevent data loss
- Prevent Unauthorized access
- Prevent lateral movement
- Prevent data extortion

## Summary

In this lesson, we identified potential indicators of 
compromise. We took appropriate action to mitigate the threat by 
examining the affected endpoint's processes, network actions, terminal 
history, and browser history.

## Next Chapter

In the next lesson, we will review the entire investigation, 
complete the playbook, close the alert, and then review the results 
obtained with the official alert report, along with case management and 
alert review procedures.

