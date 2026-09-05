---
tags:
  - siem
  - log-analysis
  - soc
  - course/lets-defend
---

# Alerting


We have collected, processed and stored logs up to this point. Now, we need to detect abnormal behavior using the data we have and generate alerts.

Timely occurrence of alerts varies depending on our search speed. For a log created today, we want to create a warning immediately instead of generating an alert after 2 days. Therefore, as we mentioned in our previous article, a suitable storage environment should be created. The alarms we will create for SIEM will usually be suspicious and need to be investigated. This means that the alert must be optimized and not triggered in large numbers (except in exceptional cases). Here are some ways to create an alert:

By searching stored data
Creating alarms while taking logs

Example alerts that can be created:

New user added to global administrator
15 Login failed in 3 minutes with the same IP address

In order to create a quality alert, you must understand the data you have. Some of the techniques for making better log searches are blacklisting, whitelisting and long tail log analysis.

Blacklist

It can be used to catch undesirable situations. For example, we can collect the prohibited process names (Example: mimikatz.exe) and write them to a list. Then, if a process in this list appears in the logs, we can create an alert. Similarly, an alert can be generated when there is a device that creates and accesses a banned IP list. It is easy to manage and implement, but very easy to bypass. For example, if the name mimikatz2.exe is used instead of mimikatz.exe, no alert will occur.

Whitelist

Unlike blacklist, it is used for desired situations. For example, a list of IP addresses with normal communication can be kept. If communication is made with an address other than this list, we can generate an alert. This method is highly effective but difficult to manage. The list needs to be constantly updated.

Long Tail Log Analysis

This method assumes that the behaviors that occur constantly are normal. In other words, if an "Event ID 4624 An account was successfully logged on" log is constantly occurring on a device, with this method we should take it as normal and approach the least occurring logs with suspicion.

picture: [https://respond-software.com/](https://respond-software.com/)

Good post about long tail log analysis: [https://threatpost.com/long-tail-analysis-hope-cybercrime-battle/155992/](https://threatpost.com/long-tail-analysis-hope-cybercrime-battle/155992/) You can catch suspicious situations and create alerts using these 3 methods.

