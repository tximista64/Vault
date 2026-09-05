---
tags:
  - windows
  - event-logs
  - course/lets-defend
---

# Event Logs


[https://cdn.andreafortuna.org/cheatsheets/Windows_Security_Event_Logs_Cheatsheet.pdf](https://cdn.andreafortuna.org/cheatsheets/Windows_Security_Event_Logs_Cheatsheet.pdf)

**What are Event Logs?**

Event Logs are logs collected through the Windows operating system. 
There are various types of logs in these logs. Application logs, 
security logs and system logs can be given as examples. Event logs are a
 very important resource to understand whether many processes on the 
system have taken place and to have a grasp of the details. SOC analysts
 often make use of event logs when detecting the presence and activity 
of threats on the system. For example, some event logs are as follows:

Powershell activitiesDeleting event logsStarting and stopping servicesCreating a new scheduled taskRDP activityChanging user privilegesFailed login activities

These actions are among the most basic actions seen in any cyber attack.
 Therefore, event log analysis is really important to find the root 
cause of the cyber attack.

**Event Logs Structure**

The number of components of the Windows operating system is quite large.
 Therefore, the event logs are also in large numbers. All these records 
are kept in a certain order. Each record type has an "Event ID" value to
 distinguish it from each other. During the log analysis, filtering can 
be done according to the "Event ID" value in order to work with fewer 
logs and to work on a simpler output.

In Windows systems, there are three main event log titles as "Application", "System" and "Security".

**Application**

It provides log records related to the applications in the system. For 
example, you can find errors received by an antivirus application 
running on the system.

**System**

It is the area where the logs created by the basic components of the 
operating system are located. For example, logs for a driver loads and 
unloads operations can be found here.

**Security**

Records regarding authentication and security are kept here.

**Viewing Event Logs with Event Viewer**

Using the graphical user interface (GUI) while working on event logs can
 provide great convenience. The "Event Viewer" program is used to view 
event logs from the graphical user interface on Windows. For example, 
let's open the "Event Viewer" program:

Let's open the "Run" application with the "Windows + R" key combination 
and write the application name we want to run: "eventvwr"

When the "Event Viewer" program is opened, a window like the one above appears.

In this window, the log type in the desired category can be selected 
from the left section and the analysis can be performed. For example, 
let's examine the logs of failed logins:

For successful and unsuccessful login logs, the "Security" section 
should be opened under the "Windows Logs" tab. As seen in the image 
above, a failed login log has been recorded in the event logs. The 
"Event ID" value for unsuccessful login attempts is "4625". It is not 
easy to keep in mind the Event ID values ​​of all logs. Therefore, an 
Event ID list that can be viewed if needed will be useful. As an 
example, a list such as the following address can be used:

**Event ID List:** [https://andreafortuna.org/2019/06/12/windows-security-event-logs-my-own-cheatsheet/](https://andreafortuna.org/2019/06/12/windows-security-event-logs-my-own-cheatsheet/)
**Filtering Event Logs**

Since the number of event logs recorded on the system can be very large,
 it will be easier to examine by filtering. For example, with the 
"Filter Current Log" option on the right, let's see only the logs of 
failed login attempts:

"4625" Event ID value is written in the place seen in the image above.

As seen in the image above, only logs with Event ID value of "4625" are displayed.

**Viewing Event Logs via Command Line**

Event log analyzes can also be done via the command line. It is the 
"wevtutil" command that allows to examine event logs via the command 
line. For example, let's examine the event logs with the Event ID value 
of "4625":

**Note:** When performing event log inspections on the 
command line, the command line must be run with administrator rights, 
otherwise it will give an authorization error.

**Note:** Since the output of the command is long, only the first part is visible in the image.

As seen in the image above, a log with Event ID value of "4625" was 
successfully printed on the screen. The command used in this process is 
as follows: 

**Command:** wevtutil query-events Security /rd:true /count:1 /format:text /q:"Event[System[(EventID=4625)]]"

The explanations of the parameters applied in the command are as follows:

"query-events" parameter : Query events from a log or log file."/rd" parameter : Reverse direction."/count" parameter : Log count."/format" parameter : Output format."/q" parameter : XPathQuery.
Many other operations can be performed on event logs using "Wevtutil". 
For example, event logs can be deleted via the command line. For more 
detailed information, you can visit the following address:

**Wevtutil:** https://ss64.com/nt/wevtutil.html 

In this part of the training, it is mentioned what Event Logs are, their
 structure, how they are examined through the graphical user interface, 
how they are examined via the command line, how to filter the logs and 
their importance in terms of security. The next part of the tutorial 
covers the topic of "Windows Management Instrumentation (WMI)".

- Powershell activities
- Deleting event logs
- Starting and stopping services
- Creating a new scheduled task
- RDP activity
- Changing user privileges
- Failed login activities

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/evt1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/evt2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/evt3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/evt4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/evt5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/evt6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/evt7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/evt8.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/evt9.png)

- "query-events" parameter : Query events from a log or log file.
- "/rd" parameter : Reverse direction.
- "/count" parameter : Log count.
- "/format" parameter : Output format.
- "/q" parameter : XPathQuery.

