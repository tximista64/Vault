---
tags:
  - siem
  - log-analysis
  - soc
  - course/lets-defend
---

# Log Collection


First
 of all, we need data for the SIEM solution to detect threats. That's 
why the log collection process is one of the most important parts of the
 SIEM architecture, because without the log SIEM would be useless.

**What is Log and Logging?**

In computing, a log file is a file that records either events that 
occur in an operating system or other software runs, or messages between
 different users of a communication software. Logging is the act of 
keeping a log. In the simplest case, messages are written to a single 
log file.
*definition: wikipedia.org*

It contains a basic log, time, source system and a message. For example,
 when we look at the content of the "/var/log/auth.log" file on an 
Ubuntu server, we can see the source, time and message information.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/SIEM+101/images/authlog1.png)

Our goal at this point is to transfer logs from various places (Hosts, 
Firewall, Server log, Proxy, etc.) to SIEM. Thus, we can process all 
data and detect threats at a central point. Logs are generally collected
 in the following 2 ways:

- Log Agents
- Agentless

### Log Agents

In order to implement this method, a log agent software is required. 
Agents often have parsing, log rotation, buffering, log integrity, 
encryption, conversion features. In other words, this agent software can
 take action on the logs it collects before forwarding them to the 
target.
For example, with the agent software, we can divide a log with 
"username: LetsDefend; account: Administrator" into 2 parts and forward 
it as:

- message1 = "username: LetsDefend"
- message2 = "account: Administrator"

**Pros of the method**

- It is a tested, and a working application by the developers
- Has many additional features like automatic parsing, encryption, log integrity, etc.

**Cons of the method**

- As the additional features are activated,
resource consumption increases. That requires the system's resources
such as CPU, RAM to be increased, so the cost increases.

**Syslog**

It is a very popular network protocol for log transfers. It can work 
with both UDP and TCP, and can optionally be encrypted with TLS. Some 
devices that support syslog: Switch, Router, IDS, Firewall, Linux, Mac, 
Windows devices can become syslog supported with additional software.

You can have your log agents transfer logs with Syslog. For this, you must first parse your logs in syslog format.

**Syslog Format:**

Timestamp - Source Device - Facility - Severity - Message Number - Message Text

![](https://ld-images-2.s3.us-east-2.amazonaws.com/SIEM+101/images/09fig02.gif)

Also, the maximum packet size that can be sent with Syslog UDP is 1024 bytes. For TCP it is 4096 bytes.

**3rd Party Agents**

Most SIEM products have their own agent software. 3rd party agents 
have more capabilities than syslog because of the features they support.
 Some agents:

- Splunk: universal forwarder
- ArcSight: ArcSight Connectors

These agents are easy to integrate into SIEM and have parsing features.

**Popular open source agents:**

- Beats https://www.elastic.co/beats/
- NXLog https://nxlog.co/

### Agentless

Agentless log sending process is sometimes preferred as there is no 
installation and update cost. Usually, logs are sent by connecting to 
the target with SSH or WMI.
For this method, the username and password of the log server are 
required, therefore there is a risk of the password being stolen.
Easier to prepare and manage than the agent method. However, it has 
limited capabilities and credentials are wrapped in the network.

**Manual Collection**

Sometimes there are logs that you cannot collect with existing agent 
software. For example, if you cannot read the logs of a cloud-based 
application with the agent, you may need to write your own script.

### Summary

As you can see, there are various ways to collect logs. These are agents
 and agentless. In cases where the agents on the market are not 
sufficient, you should write your own scripts.

