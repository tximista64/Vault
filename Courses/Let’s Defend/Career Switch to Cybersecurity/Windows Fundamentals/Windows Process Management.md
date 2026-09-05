---
tags:
  - windows
  - process-management
  - course/lets-defend
---

# Windows Process Management


**What is Process?**

A process is a program under execution in an active program. Processes 
are the units of commands/programs running on the operating system. 
Mainly the processes are examined during the live Windows host review. 
Examination and analysis of memory essentially actually mean the 
analysis of processes. Each process has its own identification number in
 the Windows environment which is called "Process ID" (PID) and they are
 logged in each process operation.

**Process Tree**

Running a program is a process. From this process, another process can 
be created. There is a parent-child relationship between the two 
processes.

**Process:** A process is a program under execution in an active program.

**Parent Process:** In computing, a parent process is a process that has created one or more child processes.

**Child Process:** A child process in computing is a process created by another process (the parent process).
A parent process may have multiple child processes, but a child process only one parent process.

**Sources:**https://www.geeksforgeeks.org/difference-between-process-parent-process-and-child-processhttps://en.wikipedia.org/wiki/Child_processhttps://en.wikipedia.org/wiki/Parent_process
The hierarchical representation of parent processes and child processes 
is called the "Process Tree". There are some useful tools available for 
viewing the Process Tree. "Process Hacker" is one of the many of them. 
Process hacker is a free and open source tool. With this tool, all 
processes running in the Windows operating system can be monitored in 
real-time. The "Process Hacker" tool can be downloaded from:

**Process Hacker:** https://processhacker.sourceforge.io

For example, let's see the "process tree" with the help of Process Hacker:

As seen in the image above, The "Process Hacker" tool displays the processes in Windows in hierarchical order.

As seen in the image above, "explorer.exe" is the parent process with the following 3 child processes:

Tvnserver.exeProcessHacker.exeSnippingTool.exe
Although all of these processes are totally different processes, there 
is a parent-child relationship between all these. In this window, it is 
clearly seen that there are processes with or without child processes 
and even some with no child processes.

**Windows Legitimate Processes**

There are many Windows native processes with different tasks. Let’s see 
some of the important processes from a security point of view due to 
their current authorizations, and the user and system information they 
contain.

**wininit.exe**
The “wininit.exe” process is known as the “Windows Initialization 
Process”. It is responsible for starting the Service Control Manager 
(services.exe), Local Security Authority process (lsass.exe), and Local 
Session Manager (lsm.exe). It is located under the “C:\Windows\System32”
 folder. It is created during system boot. It is the process that works 
with the privileges of the most authorized user (NT AUTHORITY\SYSTEM) on
 the system.

**services.exe**

The “services.exe” is the process responsible for starting and stopping 
services. “Svchost.exe”, “dllhost.exe”, “taskhost.exe”, and 
“spoolsv.exe” are child processes of the “Services.exe” process. It is 
located under the “C:\Windows\System32” folder. It is the process that 
works with the privileges of the most authorized user (NT 
AUTHORITY\SYSTEM) on the system. There should only be 1 "services.exe" 
process at a time in the process tree under normal conditions. If there 
are multiple "services.exe" processes or if there is a process with a 
similar name, it should be investigated further as it may be a process 
that belongs to a malicious activity.

**Note:** We will cover the “services on Windows” topic later in the training.

**svchost.exe**

“Svchost.exe” is a generic host process name for services that run from 
dynamic-link libraries. Because DLL files are non-executable files, they
 are run with svchost for triggering the services of the operating 
system. “svchost.exe” is responsible for the usage and management of 
multi-dll services for the optimization of system sources. All DLL-based
 services share the same svchost process. Every svchost process occurs 
with executing unique services. It's parent process is “services.exe”. 
And "Services.exe" is the child process of "wininit.exe".

(Source: https://alparslanakyildiz.medium.com/fundamental-windows-processes-6341696cf4f0)

“Svchost.exe” is located under the “C:\Windows\System32” folder. This is
 the process running on the system with “NT AUTHORITY\NETWORK SERVICE” 
or NT AUTHORITY\SYSTEM” privileges.

**lsass.exe**

The “lsass.exe” (Local Security Authority Subsystem Service) is the 
process responsible for critical security operations such as confirming 
or rejecting users' passwords during login in the Windows operating 
system. In addition, this process works actively during the password 
changes of users. This process is critically important as it contains 
the user passwords in the system. The attacker gaining access to the 
system can obtain the user's password by leveraging this process. There 
is a free tool called “mimikatz” developed by “Benjamin Delpy” and 
users' passwords can be obtained from the "lsass.exe" process with the 
help of the “Mimikatz” tool. It can be accessed at the following 
address:

**Mimikatz:** https://blog.gentilkiwi.com/mimikatz

“lsass.exe” is located under the “C:\Windows\System32” folder. It is the
 process that works with the privileges of the most authorized user (NT 
AUTHORITY\SYSTEM) on the system.

**winlogon.exe**

The “Winlogon.exe” is the process that performs the login and logout 
operations of the users in the Windows operating system. It is the 
process that works with the privileges of the most authorized user (NT 
AUTHORITY\SYSTEM) on the system. “Winlogon.exe” is located under the 
“C:\Windows\System32” folder.

**explorer.exe**
The “Explorer.exe” process is the parent process of almost every process
 that has a graphical user interface (GUI) in the Windows operating 
system and opens as a window. For example, this process kicks in when 
Windows explorer is started. Under normal circumstances, one 
"explorer.exe" process is expected. “Explorer.exe” is located under the 
“C:\Windows\” folder. This process runs with the privileges of the user 
who is currently logged in to the system.

**Task Manager**

“Task Manager" is the application that enables to see and manage the 
processes on Windows operating system. The processes can be viewed and 
terminated with the help of the “Task Manager”. It has a graphical user 
interface (GUI) as it is seen in the image below:

As we can see in the screenshot, a window where you can get information 
about the status of the running processes has been opened. The 
"processes" tab of the task manager application provides limited and 
general information about processes. Detailed information about the 
processes can be viewed under the "details" tab.

As seen in the image above, the "details" tab provides more detailed information about the processes.

**Process Operations Commands**

Windows process operations are generally performed via the Graphical 
User Interface (GUI). In some exceptional cases, we may need to perform 
process operations via the command line. Let’s see some of the important
 commands that we may need to use for various tasks:

**Tasklist command**

The "Tasklist" command allows us to see the list of processes running on
 the system. For example, let's see the processes by executing the 
command:

As seen in the screenshot above, the "Tasklist" command helps us display the information of the running processes on the system.

**Note:** Only the first part is displayed in the above 
screenshot as the information on the running processes on the system is 
too long to display.

**taskkill command**

The "Taskkill" is the command used to terminate the processes running in
 the system. In order to execute this command, the “PID (Process ID)” 
value of the process to be terminated must be known. The PID value is a 
numerical identification value given to the processes by the system in 
order to distinguish the processes from each other. For example, let's 
see the PID value of the "osk.exe (screen keyboard)" process we want to 
terminate:

As seen in the image above, the PID value of the "osk.exe" process is seen as "2812".

**Note:** The Pipe(|) sign allows you to give the output of
 one command as an input to another command. The “findstr” command 
(string search) is the command used in searches.

Let's give the PID value as a parameter to the "taskkill" command and 
end the process:

As we can see in the screenshot above, the process named “osk.exe” with a
 PID value of 2812 was successfully terminated with the “taskkill /PID 
2812” command.

We have covered the terms process, child process, parent process, and 
the concept of the process tree as well as some important processes 
running on Windows, the management of Windows processes through the 
graphical interface, the management of Windows processes through the 
command line, and the Windows processes in terms of security in this 
part of our training. The next part of the training will be about 
“Windows Services”.

- https://www.geeksforgeeks.org/difference-between-process-parent-process-and-child-process
- https://en.wikipedia.org/wiki/Child_process
- https://en.wikipedia.org/wiki/Parent_process

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/proc1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/proc2.png)

- Tvnserver.exe
- ProcessHacker.exe
- SnippingTool.exe

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/proc3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/proc4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/svchost1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/proc5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/proc6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/proc7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/proc8.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/proc9.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/proc10.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/proc11.png)

