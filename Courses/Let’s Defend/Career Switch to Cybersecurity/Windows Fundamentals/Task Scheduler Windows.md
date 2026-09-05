---
tags:
  - windows
  - task-scheduler
  - course/lets-defend
---

# Task Scheduler Windows


**What is a scheduled task?**

A scheduled task is the execution of certain operations on the system at
 certain time intervals or at certain times. For example, we may need to
 check the system information at certain time intervals. Scheduled tasks
 implement these types of tasks in the Windows operating system. Once an
 attacker gains access to the Windows system, he/she can utilize the 
scheduled tasks to ensure persistence by making the system send 
connection requests to his/her own system in order not to lose access to
 the system. This requires adding a new task to the scheduled tasks. 
When detecting threats, the SOC analyst should monitor the scheduled 
tasks closely to be able to detect suspicious scheduled tasks.

**Managing Scheduled Tasks with the GUI**

It is possible to view and manage scheduled tasks via the graphical user
 interface (GUI). For example, let's see the scheduled tasks by 
following the steps below:

Let's open the "Run" application with the "Windows + R" key combination 
and type the application name we want to run: "taskschd.msc"

The window on the above screenshot will open when the “Task scheduler” 
program is run. Let's click on the "Task Scheduler Library" on the 
navigation panel on the left:

The screenshot above shows that the list of scheduled tasks in the 
system and the details of each scheduled task have been successfully 
displayed.

**Creating a new scheduled task**

It is possible to create a new scheduled task with the task scheduler 
application. Click on the "Create Task" button on the navigation panel 
on the right to create a new scheduled task:

After filling in the name and description of the task in the window that
 opens, go to the "Actions" tab and add the action that the scheduled 
task will do:

If there is no "action" in this section adding a task cannot be completed. Let's add a new action with the "New" button.

Let's type the path of the executable file belonging to the command line
 in the "Program/script" section of the window to ensure that the 
command line opens when the scheduled task runs.

As seen in the screenshot above, the process has been completed 
successfully and a new scheduled task was added. To run the scheduled 
task, we can right click and select “Run”:

 
As seen in the option to run the task above, many operations such as 
running, stopping, making changes to the task and deleting the task can 
be performed on scheduled tasks on this program. The menu on the right 
navigation panel contains the options for operations on this program 
which has a very user friendly interface.

**Managing Scheduled Tasks with Command Line**

It is possible to manage scheduled tasks via command line. For this, the "schtasks" command is used.

**View scheduled tasks**

When the "schtasks" command is used without parameters, it will show all
 scheduled tasks. For example, let's see it by executing the command:

As seen in the screenshot above, the scheduled task and all other 
scheduled tasks that we added via the graphical interface in the 
previous example were successfully displayed on the screen.

**Note:** Since the output of the command is too long, only the first part is visible in the image.

**Getting information about the scheduled task**

We can get information about specific scheduled tasks when the 
"schtasks" command is used with parameters. For example, let's see the 
information of the scheduled task we added with the command "schtasks 
/Query /TN TrainingTask":

As seen in the screenshot above, only the information of the specific 
scheduled task is displayed on the screen. The “/TN” is the parameter 
that belongs to the specific task.

**Enable the Scheduled Task**
Disabled scheduled tasks can be enabled with the "schtasks" command. For
 example, let's enable the task named "TrainingTask" with the command 
"schtasks /Change /ENABLE /TN TrainingTask":

The screenshot above shows that the scheduled task that was disabled 
before has been successfully enabled (Status: Ready). The “/Change 
/Enable” parameters in the applied command are used to change the status
 of the task.

**Running the scheduled task via command line**

Scheduled tasks can be run with the "schtasks" command. For example, 
let's run the scheduled task named "TrainingTask" with the command 
"schtasks /Run /TN TrainingTask":

The above screenshot shows that the scheduled task has been run 
successfully. The “/Run” parameter in the command indicates that the 
scheduled task is set to execute on “run” .

**Terminating the scheduled task via the command line**

Scheduled tasks can be terminated with the "schtasks" command. For 
example, let's terminate the scheduled task named "TrainingTask" with 
the command "schtasks /End /TN TrainingTask":

As you can see in the screenshot above, the scheduled task has been 
successfully terminated. The “/End” parameter in the command indicates 
that the termination process will be applied on the scheduled task.

**Deleting scheduled task via command line**

Scheduled tasks can be deleted with the "schtasks" command. For example,
 let's delete the scheduled task named "TrainingTask" with the command 
"schtasks /Delete /TN TrainingTask":

Screenshot above shows that the scheduled task has been deleted 
successfully. Before deleting the scheduled task on deletion, the user 
is prompted as a warning to confirm the deletion. If the user confirms 
the action, the scheduled task is deleted. The “/Delete” parameter in 
the command indicates that the deletion will be applied on the scheduled
 task.

In this part of the training, we have covered the scheduled tasks in 
Windows, their structure, importance in terms of security and how they 
are managed via the graphical user interface as well as the command 
line. The next part of the tutorial will cover the “Windows Registry” 
topic.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task8.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task9.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task10.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task11.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task12.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task13.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/task14.png)

