---
tags:
  - linux
  - linux-fundamentals
  - user-management
  - permissions-management
  - course/lets-defend
---

# User Management and Groups


**Users and Groups**

In order to be able to perform any operation on Linux, it is absolutely 
necessary to have a user. That's why Linux users are very important. The
 target of the attacker trying to take over the target Linux system is 
to seize the most authorized user account. The most authorized user on 
Linux is the "root" user. The root user has no restrictions on the 
system. The root user should be very careful while running commands on 
the system because if the root user runs a wrong command, it may have 
irreversible results that impact the system in a negative way. For 
example, the worst-case scenario would be to delete all files under the 
root directory(“/”). If the command to delete all files under the root 
directory(“/”) is executed with root user privileges, unfortunately, the
 entire system will be deleted and the command will run successfully as 
the command is run in root user privileges. In this case, all 
configurations and files will be lost instantly. If the system is not 
backed up, completely irreversible results will occur.

The target for attackers is always to have the privileges of the root 
user. Because normal users do not have read and write rights on every 
file on the system. The attacker, who wants to see some critical file 
contents, will first want to increase the privileges of the user he has 
obtained. So it will implement privilege escalation attack techniques. 
It is vital that the SOC analyst, who investigates the Linux system, 
monitors the user movements and commands in the system. In case of any 
anomaly, the analyst should be able to take the necessary actions.

**whoami command**

The whoami command is the command that shows which user is operating on the command line being worked on.

As seen in the image above, a command-line of the Debian user is 
processed in the output of the whoami command. Generally, attackers use 
the whoami command to see which user is operating on the system they 
obtain from the command line.

You can use this interactive shell for practice:

**The Concept of UID (User ID) ve GID (Group ID)**

In Linux, each user and group has its own identification number. The 
identification number for users is called UID (user id) and GID (group 
ID) for groups.Id values ​​are used in definitions for operations on the
 system.

The "id -u" command can be used to learn the user's UID value. For example, let's see the UID of the debian user:

As seen in the image above, the UID value of the debian user is 1000.

In Linux-based operating systems, the "root" user has a UID of "0" by 
default. Users newly added to the operating system usually start from 
the "1000" UID value and increase with the increments of 1. Generally, 
service users have a UID value between "1" and "999".

**Finding out the groups the user belongs to**

The "id" command can be used to see the groups that the user belongs to.

The groups that the debian user is included are seen in the image above.

**/etc/shadow File**

"/etc/shadow" file is an important file on the system that keeps the 
encrypted versions of the passwords of the users. If the attacker can 
read the contents of this file, he can obtain the encrypted passwords of
 all the users in it. This file also contains a lot of user information.

First, let's try to read the "/etc/shadow" file with a user with normal privileges:

As seen in the image above, the debian user receives an authorization 
error when he/she tried to read the contents of the "/etc/shadow" file. 
It is because the “debian user” is not a user with root privileges. To 
understand why this error is encountered, let's look at the owner and 
file permissions of the "/etc/shadow" file:

As seen in the image above, the owner of the shadow file is the root 
user. Looking at the file permissions, read permission is not granted 
for other. So the file contents could not be read by the debian user. In
 such cases, there are some methods to read files that are accessible to
 the root user.
 

One of these methods is to apply the sudo command, which allows to act 
as the root user. The sudo command stands for "superuser do". The sudo 
command is a command that allows normal users to act as root. The user 
must be in the sudo group to be able to execute this command. In order 
to use the sudo command, it is necessary to know the password of the 
current user because this password information will be requested when 
the sudo command is executed. For example, let's read the contents of 
the file "/etc/shadow" using the sudo command with the debian user 
included in the sudo group:

As you can see in the image above, a password is requested when the sudo
 command is applied. If the password entered is correct, the command is 
run successfully:

As seen in the image above, the file content has been read successfully.
 Shadow file has a specific format. The information is contained is in 
an order and meaningful. The "/etc/shadow" file contains the following 
information, respectively:

Username.Encrypted password.Date of the last password changed - expressed as the number of days 
since Jan 1, 1970. If there is a 0 that means the user should change 
their password the next time they log in.Minimum password age - Days that a user will have to wait before being able to change their password again.Maximum password age - Maximum number of days before a user has to change their password.Password warning period - Number of days before a password is going to expire.Password inactivity period - Number of days after a password has expired to allow login with their password.Account expiration date - the date that the user will not be able to log in.Reserved field for future use.*(Source: https://linuxjourney.com/lesson/etc-shadow-file)***/etc/passwd File**

The /etc/passwd file is a file where the entire user list in the system 
can be seen. It contains detailed information about users. Unlike the 
shadow file, the “/etc/passwd” file can be read by normal users. For 
example, let's see the permissions of the file "/etc/passwd":

As seen in the image above, other has read permission, so normal users 
can read this file. For example, let's read this file with debian user:

As seen in the image above, the file content of "/etc/passwd" could be 
read successfully with the privileges of the debian user. The 
"/etc/passwd" file contains the following information, respectively:

UsernameUser's password - the password is not really stored in this file, 
it's usually stored in the /etc/shadow file. You can see many different 
symbols that are in this field, if you see an "x" that means the 
password is stored in the /etc/shadow file, a "*" means the user doesn't
 have login access, and if there is a blank field that means the user 
doesn't have a password.The user ID - as you can see root has the UID of 0The group IDGECOS field - This is used to generally leave comments about the 
user or account such as their real name or phone number, it is 
comma-delimited.User's home directoryUser's shell - you'll probably see a lot of users defaulting to bash for their shell*(Source: https://linuxjourney.com/lesson/etc-passwd-file)***To Create a New User**

It is possible to create a new user with the "useradd" command in the Linux command line:

As seen in the image above, a new user named tempuser has been 
successfully created with the useradd command. When the /etc/passwd file
 content is checked, the new user information appears to have been 
added.

**To Delete an Existing User**

It is possible to delete an existing user with the command "userdel" in the Linux command line:

As seen in the image above, the tempuser user was successfully deleted and removed from the /etc/passwd file.	

**Changing User Password**

It is possible to change users' passwords with the "passwd" command. For example, let's change the letsdefend user's password:

As you can see in the image above, the password of the "letsdefend" user has been successfully changed.

**User Switch in Command Line**

It is possible to switch the user on the command line with the "su" 
command. The name of the user to be actively used is entered as a 
parameter with the "su" command. For example, let's switch to the 
"letsdefend" user:

As seen in the image above, the transition from the "Debian" user to the
 "letsdefend" user has been successfully done with the "su" command. 
After the "su" command is executed, the password of the user to be 
switched is requested and if the correct password is entered, the 
intended user is now active on the system. If the "su" command is run 
without parameters, it will default to root user. If the root user's 
password is known, the root user's command line can be obtained.

In this part of the training, information about users and user 
transactions are detailed. In the next part of the training, archive 
file types are explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user7.png)

- Username.
- Encrypted password.
- Date of the last password changed - expressed as the number of days
since Jan 1, 1970. If there is a 0 that means the user should change
their password the next time they log in.
- Minimum password age - Days that a user will have to wait before being able to change their password again.
- Maximum password age - Maximum number of days before a user has to change their password.
- Password warning period - Number of days before a password is going to expire.
- Password inactivity period - Number of days after a password has expired to allow login with their password.
- Account expiration date - the date that the user will not be able to log in.
- Reserved field for future use.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user8.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user9.png)

- Username
- User's password - the password is not really stored in this file,
it's usually stored in the /etc/shadow file. You can see many different
symbols that are in this field, if you see an "x" that means the
password is stored in the /etc/shadow file, a "*" means the user doesn't have login access, and if there is a blank field that means the user
doesn't have a password.
- The user ID - as you can see root has the UID of 0
- The group ID
- GECOS field - This is used to generally leave comments about the
user or account such as their real name or phone number, it is
comma-delimited.
- User's home directory
- User's shell - you'll probably see a lot of users defaulting to bash for their shell

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user10.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user11.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user12.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/user13.png)

