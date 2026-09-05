---
tags:
  - windows
  - user-management
  - permissions-management
  - course/lets-defend
---

# Windows Users and Groups


### About the Users and Groups

There are users and groups on the Windows operating system. The 
privileges and duties of users and groups on the system may differ. 
Attackers want to capture the most authorized user on the system. 
Therefore, the users and the groups they belong to are important from a 
security point of view.

Attackers targeting Windows operating systems want to know what user 
privileges they have when they are able to send commands to the 
operating system because what they can do with a lower user profile may 
be limited. The attacker will attempt to attack back to increase the 
user authority after he/she figures out that he/she has access to the 
system with a low user profile. On the defensive side, what the analysts
 should do is to monitor user activities and detect anything suspicious 
within a short period of time.

### "Whoami" Command

"whoami" is the command that shows which user account accessing the 
system. For example, let's see the username by executing the command:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user1.png)

As seen in the screenshot above the username information has been successfully displayed on the screen.

**Note:**

The format in the whoami command output is 
"domain\username". If the host that’s making this search is not included
 in the domain, then the hostname information is displayed instead of 
the domain.

### User Management Commands

"net" is the command to manage users and groups. The "user" or "group" 
parameters after the "net" command indicate that a process will be 
executed on the users or groups.

## 1. "net user" command

"net user" is the command that displays the usernames within the system.
 For example, let's see the usernames in the system by executing the 
command:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user2.png)

As seen in the image above, the names of the users on the system have 
been successfully displayed on the screen.

If detailed information is desired for a user in the system, a username 
should be given as a parameter to the "net user" command. For example, 
let's see the information of the user "LetsDefend":

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user3.png)

As seen in the image above, the information of the "LetsDefend" user has been successfully displayed on the screen.

## 2. "net accounts" command

"net accounts" command allows users to see the configurations related to
 password usage and logon restrictions on the system. For example, let's
 see the command by executing it:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user4.png)

As seen in the image above, some configurations related to all of the 
users on the system have been successfully displayed on the screen.

## 3. "net localgroup" command

"net localgroup" is the command that allows us to perform operations 
related to groups on the system. If it is used with parameters, 
different operations can be executed on groups. When used without 
parameters, it only displays the list of groups on the system. For 
example, let's see the groups on the system by executing the command 
without parameters:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user5.png)

As we can see in the image above, the command has been successfully 
executed and the list of groups on the system has been displayed on the 
screen.

If you want to see the information of a group in the system, the group 
name should be added as a parameter to the "net localgroup" command. For
 example, let's see the information for the "Administrators" group:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user6.png)

As seen in the image above, the information about the "Administrators" group has been successfully displayed on the screen.

### User and Group Management via Graphical User Interface (GUI)

Many of the operations that can be executed on the command line on 
Windows can also be done easily via the Graphical User Interface (GUI). 
It is possible to perform operations related to users and groups via the
 GUI. For example, let's access the program where we can see the list of
 users and groups:

Let's open the "Run" application with the "Windows + R" key combination 
and type the name of the application we want to run: "lusrmgr.msc"

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user7.png)

When the "Local Users and Groups" application, which is used for user 
and group management, is opened, the following window pops open:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user8.png)

The list of the users in the system can be displayed here on this 
application window, by selecting "Users" on the left navigation panel:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user9.png)

As seen in the image above, the user list in the system has been 
successfully displayed. New users can be added through the "Actions" tab
 on the right:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user10.png)

It is also possible to see the list of groups on this application window, by selecting "Groups" on the left navigation panel:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user11.png)

New groups can also be added on the "Actions" tab on the right portion of the menu.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/user12.png)

Detailed information can be obtained about each of the users and groups 
here on this application by simply double-clicking on the user/group 
name.

In this part of the training, we have covered the users and the groups 
on the Windows environment and their importance from the security 
aspects as well as their management via the command line and graphical 
user interface. In the next part of the training, the subject of 
"Permission Management" will be covered.

