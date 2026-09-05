---
tags:
  - siem
  - log-analysis
  - network-security
  - threat-intelligence
  - incident-response
  - course/lets-defend
---

# Network and Log Analysis



This lesson focuses on analyzing network and log data to determine whether malicious URLs were accessed.

To determine if the user has executed the file they have downloaded, this step is critical.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/How+to+investigate+SIEM+alert/5.Network+and+Log+Analysis/image5_1.png)

## Navigating Log Management

To begin our analysis, 
navigate to the “Log Management” page. Here, we will review logs to 
identify any suspicious activity or connections to malicious IP 
addresses and command and control (C2) addresses.

Steps to follow:

**Find the IP Address of the Affected Host**

- Go to the “Endpoint Security” page on the LetsDefend platform. Search for the hostname on the search bar.
- Review “Host Information” and find the IP address of the host computer.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/How+to+investigate+SIEM+alert/5.Network+and+Log+Analysis/image5_2.png)

**Navigate to the Log Management Page:**

- Navigate to the "Log
Management" page on the LetsDefend platform. Switch to "Basic" mode by
clicking the button in the top right hand corner of the screen.

**Search for the IP Addresses:**

- In the search bar,
enter the IP address of the hostname in question. This will allow you to see all connections made from that host.

**Analyze Log Entries:**

- Examine the log entries displayed. Focus on the "SRC ADDRESS" and "DEST ADDRESS" columns to identify any suspicious connections.
- Review network actions
to identify any unusual outbound connections or data transfers within
the alert's time frame that may suggest communication with a C2 server.

**Determine Access Status:**

- Click the Raw Data button to view the raw log of the specified entry. Determine whether the malicious file or URL was accessed.

See below for an example of how to check if a C2 address was accessed:

The example above 
demonstrates the importance of carefully reviewing log data to identify 
any signs of malicious activity. Accurate log analysis is essential to 
understanding the scope of the incident and taking appropriate action.

## Threat Intel

LetsDefend provides a 
Threat Intel tab to analyze Indicators of Compromise (IOCs). This tab 
aggregates data from various threat intelligence sources to identify 
malicious IP addresses, domains, or URLs. Here you can search for the 
IOCs you've found during your investigation.

Here's how to utilize the Threat Intel tab:

**Navigate to the Threat Intel Tab:**

- Head to the Threat
Intel tab on the LetsDefend platform. This tab consolidates threat
intelligence data for easy access during investigations.

**Search for the IOC:**

- In the search bar on
the Threat Intel tab, type the suspicious IP address or URL you found in Log Management. LetsDefend will query its threat intelligence database
to determine if the IOC is associated with any known malicious activity.

**Review the Results:**

- Review the results of
the threat intelligence query. LetsDefend will provide information on
whether the IOC has been flagged as malicious or if it has a history of
involvement in cyber threats.

## Note down the findings

Once you have completed the log analysis, record your findings and note the IOC found.

## Summary

In this lesson, we have 
learned how to perform network and log analysis to check for signs of 
malicious command and control access.

We can determine if further compromise has occurred by analyzing log data and identifying connections to C2 addresses.

## Next Chapter

In the following lesson, 
we will continue our investigation by performing endpoint analysis which
 involves examining processes, terminal, and browser activity on the 
affected endpoints to identify any further indicators of compromise.

