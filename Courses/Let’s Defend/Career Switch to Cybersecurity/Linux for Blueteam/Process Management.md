---
tags:
  - linux
  - linux-fundamentals
  - process-management
  - course/lets-defend
---

# Process Management


**What is Process?**

The process is the functioning units of the commands/programs running on
 the operating system. While performing a live Linux host review, mainly
 processes are examined. Examination and analysis of memory essentially 
mean the analysis of processes. In Linux, each process has its own 
identification number. This identification number is called "Process ID"
 (PID). This identification number is used in the operations of the 
processes.

**Listing Running Processes**

The "ps" command is used to see the running processes. As we mentioned 
in our article titled File System Hierarchy, information about processes
 is stored in virtual files under the "/proc" directory. The “ps” 
command provides output by reading the information in these files.

For example, let's see the processes running with the “ps” command:

You can use this interactive shell for practice:

As seen in the image above, we have seen the processes running with the 
"ps" command. In the first column, the PID values ​​of the processes are
 seen. The last CMD column contains the name of the running 
commands/programs. When the "ps" command is run without parameters, it 
gives a limited output. This output often does not meet the need. 
Therefore, we can see all processes in detail by using the command with 
parameters. For example, let's see all processes:

As seen in the image above, the "aux" parameter is given to the "ps" 
command. In this way, detailed process information like the one in the 
image below can be obtained:

As seen in the image above with the detailed output, there are many 
columns. The first column contains the user who owns the process. The 
second column contains the PID value, which is the identification number
 of the process. The last column contains the name of the 
command/program that was run. In order to better understand the subject,
 let's examine the most recently run processes through the image below.

As can be seen in the image above, the ps command we run can be seen in 
the bottom line. We see the details of other processes, sorted by PID 
number in the upper rows. To find out what all the columns in this 
detailed output are, you can review the man page for the ps command or 
refer to the following address:

Reference: https://linuxjourney.com/lesson/monitor-processes-ps-command

**Listing Running Processes with Realtime Information**

Processes are functioning units that show instantaneous changes. These 
instantaneous changes cannot be observed in the process output of the 
"ps" command. The only information received is about the processes at 
the time the command is applied. There is a way to monitor processes 
interactively. With the "top" command, processes can be viewed 
instantly. For example, let's execute the "top" command:

As seen in the moving image above, processes can be followed instantly 
with the "top" command. The “q” key is used to exit this interactive 
environment.

**Killing Processes**

In some cases, it may be necessary to intervene in processes. For 
example, the program being worked on may consume CPU and memory, causing
 process congestion. In such cases, it may be necessary to terminate the
 process manually. The "kill" command is used to end the process. For 
example, let's kill a process with the "kill" command:

As seen in the image above, a calculator process called 
"gnome-calculator" is running. The PID number of this process is seen as
 “43215”. Let's kill the process with the kill command using the PID 
number:

As seen in the image above, the "gnome-calculator" process was 
successfully terminated by giving the "-9" parameter to the kill 
command.

In this part of the training, information about the management of 
processes was given. The next part of the training will describe network
 management.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/process1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/process2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/process3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/process4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/process5.gif)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/process6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/process7.png)

