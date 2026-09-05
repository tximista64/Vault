---
tags:
  - windows
  - permissions-management
  - course/lets-defend
---

# Permissions Management on Windows


Permission management is one of the most important topics to ensure the overall 
operating system security. The system’s permissions management must be 
configured carefully. Each system has its own permissions management 
configuration. Windows has its own permissions management features as 
well. We will cover details about permissions management and how to 
manage permissions specific to Windows in this part of the training.

**File and Folder Permissions**

Each user has its own profile and permissions to prevent unauthorized 
access to files/folders. Normally, every file/folder gets its 
permissions from the parent folder in the Windows environment. This 
hierarchy continues up to the root directory of the hard drive. A user's
 ability to operate on a file is managed by the granted permissions.

**Viewing File permissions**

File permissions operations can be performed via the Graphical User 
Interface (GUI) easily. For example, suppose we have a file named 
“file.txt” whose owner is the “LetsDefend” user. Let's right-click on 
the file and open the "properties" window and switch to the "security" 
tab:

As seen in the image above, the file permissions have been successfully 
displayed. This “properties” window contains the list of users and 
groups and displays the permissions for the selected user/group. If the 
check mark indicating that the user is allowed for specific permissions 
types is grayed out, that means that this file inherits its permissions 
from another folder. If permissions are changed manually, then the 
checkmark will be in black color.

**Permissions Types**

There are 6 different permissions types when managing file permissions: 
Full Control, Modify, Read&Execute, Read, Write, and Special 
permissions. The following table provides more information on the 
permissions types:

*(Image Source: microsoft.com)*
**Changing file permissions**

Changing the file permissions requires one to be the owner of that file. For example, let's see who owns the file “file.txt”.

Let’s right-click on the file and open the "properties" window, then click the "advanced" button in the "security" tab:

The image above shows that the owner of the file is the "LetsDefend" 
user. Since we are logged into the system as the “LetsDefend” user, we 
can make changes on the permissions on this file. First, let's read the 
"file.txt" file content:

As we can see in the image above, we are able to access the file 
successfully and read it. Let's remove the "Read" permissions of the 
"LetsDefend" user to prevent his/her access to this file. In the 
security tab of the file’s properties window, let's select the 
"LetsDefend" user and make changes to the file permissions with the 
"Edit" button:

We put a checkmark for the reading abilities of this user under the 
“deny” column that will ensure that the files will not be accessed by 
the “LetsDefend” user. Let's try to read the "file.txt" after making the
 changes as in the image above:

When we tried to open the file, we receive an error message indicating 
that we don't have permission to access the file.

Users without administrator privileges on the Windows environment are 
normally not able to access other directories that don’t belong to them.
 For example, let's login to the "user2" account and try to access the 
directory of the "user1" account:

As we see in the image above, we receive an error message indicating 
that we don't have permission to access to this folder. When we click on
 the "Continue" button to access, it requires us to login with the 
administrator credentials:

Even if the user logs in with the administrator credentials he/she may 
still not be able to access the file without the read permissions on the
 file. For example, let's disable all privileges for user "user2" by 
changing the "file.txt" permissions of the "LetsDefend" user:

After editing the permissions as above, let's create a new file named 
"file2.txt" belonging to the "LetsDefend" user and leave all the 
permissions active for the "user2" user:

Let's login to the system with the "user2" account and open the folder 
belonging to the "LetsDefend" user and try to read both files:

As we can see in the image above, the file "file2.txt", to which the 
"user2" account has the access permissions, has been successfully 
accessed and read.

The file "file.txt", which the user "user2" does not have permission to 
access, could not be accessed and read. From the security aspect of the 
file permissions management, the attacker would possibly try to get into
 the authorized users’ accounts to be able to gain the access to the 
target folder/file content. The SOC analyst should closely monitor the 
activities of users who have access to files containing critical 
information to be able to detect violations in a timely manner.

**User Account Control (UAC)
What is User Account Control (UAC)?**

User Account Control (UAC) is a security feature in Windows operating 
systems to prevent unauthorized access. With this feature, certain 
changes and operations cannot be made without administrator permission. 
The error message for the administrator permission request in the 
example above is due to this feature. Although it increases the system 
security, this feature can be bypassed and violated by attackers from 
time to time. While it is not a good practice to rely only on this 
feature to ensure system security, it is also not a good practice not to
 use this feature. While performing security hardening of the system, 
"User Account Control" configurations should be applied carefully and 
correctly, like many other features.

**What is the difference among UAC levels in Windows?**

We can access the UAC settings, see different levels, and make changes 
through the “Security and Maintenance” in the settings menu in the 
Windows operating system:

 
UAC has 4 different levels:

**1. Always notify**

At this level, you are notified before applications and users make 
changes that require administrative permissions. This is the most secure
 setting and the most annoying.

**2. Notify me only when apps try to make changes to my computer (default)**

This is the default level, and UAC notifies you only before programs 
make changes that require administrative permissions. This is less 
secure than the first setting because malicious programs can be created 
to simulate the keystrokes or mouse movements made by a user and change 
Windows settings.

**3. Notify me only when apps try to make changes to my computer (do not dim my desktop)**

This level is identical to the previous setting except for the fact 
that, when a UAC prompt is shown, the desktop is not dimmed and other 
desktop apps can interfere with it. This level is even less secure as it
 makes it even easier for malicious programs to simulate keystrokes or 
mouse moves that interfere with the UAC prompt.

**4. Never notify me**

At this level, UAC is turned off, and it doesn't offer any protection 
against unauthorized system changes. If you don't have a good security 
suite you are very likely to encounter security issues with your Windows
 device. With UAC turned off it is much easier for malicious programs to
 infect Windows and take control.

*(UAC Levels Source: https://www.digitalcitizen.life/uac-why-you-should-never-turn-it-off)*

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm8.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm9.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm10.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm11.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm12.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm13.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm14.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm15.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm16.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/perm17.png)

