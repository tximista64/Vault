---
tags:
  - linux
  - linux-fundamentals
  - scheduled-tasks
  - course/lets-defend
---

# Scheduled Tasks


**What is a Scheduled Task?**

A scheduled task is the execution of certain operations on the system at
 certain times or time intervals. For example, we may need to receive 
some specific information from the system at certain time intervals. A 
“Scheduled Task” will implement this type of task in Linux. Scheduled 
tasks are called **"cron jobs"** in Linux. It is essentially the 
"cron" service that enables scheduled tasks to run. So if attackers 
accessed the target Linux system they may task the system to perform 
certain operations at certain time intervals by taking the advantage of 
cronjobs. The attackers establish persistence by adding the malware and 
reverse shell commands to the scheduled tasks. The SOC analyst, who 
monitors the Linux systems should always be alert for the scheduled 
tasks in case of suspicious activity. In this way, the SOC analyst can 
detect if the attacker has placed malicious code in the system using a 
“Scheduled Task”.

**Listing All Your Cron Jobs**

The **“crontab -l”** command is used to view the available scheduled tasks. For example, let's see scheduled tasks:

As seen in the image above, there is 1 scheduled task in the last line. Lines starting with a "#" sign are comment lines.

**Structure of Scheduled Tasks (Syntax of crontab)**

Scheduled tasks have the following spelling format:

**Example:** 30 08 * * * /home/pete/scripts/change_wallpaper
The fields are as follows from left to right:
Minute - (0-59)Hour - (0-23)Day of the month - (1-31)Month - (1-12)Day of the week - (0-7). 0 and 7 are denoted as Sunday*Source: https://linuxjourney.com/lesson/cron-jobs*

In the example above, the meanings of the first 5 fields on the left are
 explained. The command should be run following these 5 fields. When 
adding a new scheduled task, it must conform to this format.

**Adding, Deleting, and Editing New Scheduled Tasks**

The **"crontab -e"** command is used for adding, deleting scheduled 
tasks, and changing the existing tasks. When this command is applied, an
 active area appears where changes can be made. Task operations are 
carried out in accordance with the writing format. For example, let's 
add a task definition to save the phrase "Hello Analyst" to the file 
"/home/debian/hello.txt" every 5 minutes by executing the command:

First, We should open up the line where we can add tasks with the "crontab -e" command.

In the screenshot above, we see that there is a scheduled task that was 
added before. In this scheduled task, the phrase "Hello My Friend" was 
requested to be recorded in the "/home/debian/hello.txt" file every 1 
minute. Let's add a similar scheduled task:

After the row of the scheduled task is added, it is saved with **"CTRL + O"**. Let's check if the scheduled task has been added with the **"crontab -l"** command.

As we see in the screenshot above, we have successfully added the new 
scheduled task. Let's see if the scheduled tasks are running after the 
required time has passed, by checking the file contents of the printing 
process:

As we see, the scheduled tasks are running successfully. In order to 
disable scheduled tasks, lines in the relevant file can be deleted or 
commented out by placing a "#" sign at the beginning.

In this part of the training, scheduled tasks and operations on Linux are explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/cron1.png)

- Minute - (0-59)
- Hour - (0-23)
- Day of the month - (1-31)
- Month - (1-12)
- Day of the week - (0-7). 0 and 7 are denoted as Sunday

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/cron2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/cron3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/cron4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/cron5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/changed-image-cron1.png)

