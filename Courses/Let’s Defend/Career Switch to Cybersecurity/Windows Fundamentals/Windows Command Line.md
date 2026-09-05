---
tags:
  - windows
  - command-line
  - course/lets-defend
---

# Windows Command Line


**What is the "Command Line"?**

The command line is an intermediary program that receives the commands 
from the user via the keyboard and transfers them to the operating 
system for execution.

**Basic Commands**

In Windows, many operations can be done through the command line. Below 
are some commands that are basically used in the Windows operating 
system.

**1. "Help" Command**
The "Help" is the command that provides detailed information about the 
commands used on the command line. We can see the parameters of the 
commands that we need to get information with the "Help" command. For 
example, let's see the help page for the "dir" command:

The image above shows that the help page for the "dir" command has been successfully displayed on the screen.

**2. "Dir" Command**
The "Dir" is the command that lists the files and the folders under the 
current directory. For example, let's see the files and folders under 
"C:\Users\LetsDefend":

The image above shows that the existing files and folders have been successfully listed with the "dir" command.
 

**3. "Cd" Command**
The "Cd" is the command that is used for directory transitions. For 
example, let's switch from the "C:\Windows" directory to the 
"C:\Windows\system32" directory:

The image above shows that the directory has been switched successfully.

**Note:** If the "Cd" command is used without parameters, it will display the current directory on the screen.

**4. "Date" Command**
The "Date" is the command that is used to view and change the system's 
date information. For example, let's see the date information with the 
"date /t" command:

The image above shows that the date information of the system has been successfully displayed on the screen.

**5. "Echo" Command**

The "Echo" is the command that is used to print to the screen. For 
example, let's print "BlueTeam" to the screen with the echo command:

The image above shows that the printing to the screen has been successfully completed.

**6. "Hostname" Command**
The "Hostname" is the command that is used to see the hostname 
information of the system. For example, let's execute the hostname 
command:

 

The image above shows that the hostname command has been successfully applied and the hostname of the system is displayed.

**7. "Time" Command**
The "Time" is the command that is used to see the system time. For 
example, let's see the system time with the command "time /t":

The image above shows that the system clock has been successfully printed on the screen.

**Network Commands
1. "Ipconfig" Command**
The "Ipconfig" is the command that allows viewing information about 
network interfaces on the system via the command line. For example, 
let's see by executing the command:

The image above shows that the information of the network interfaces in 
the system has been successfully displayed on the screen.

**Note:** In order to get detailed information about all 
network interfaces, the "ipconfig" command should be used with the 
"/all" parameter.

**2. "Netstat" Command**
It is possible to view the current network connections and their 
statuses via the command line. For example, let's see the available 
network connections with the "netstat" command:

The image above shows that the existing connections have been successfully displayed with the "netstat" command.

**Note:** Since the output of the netstat command is too long, only the first part is displayed in the above image.

The explanations of the parameters applied in the command are as follows:

"-a" parameter : Displays all connections and listening ports."-n" parameter : Displays addresses and port numbers in numerical form."-o" parameter : Displays the owning process ID associated with each connection.
**3. "Nslookup" Command**
Devices communicate with each other through numerical values in the IT 
world. Therefore, values ​​that do not correspond to numerical values 
​​need to find their numerical equivalents. For example, when trying to 
access the "letsdefend.io" domain, the IP address of the target DNS 
server must be known or learned. In this case, an intermediary should 
perform a domain name and IP address resolution and report the IP 
address of the DNS server of the desired domain. It is the Domain Name 
System (DNS) protocol that carries out this task. There are some tools 
and commands used for this. For example, let's find the DNS server IP 
address of the "letsdefend.io" address with the "nslookup" tool:

The image above shows that the DNS Server IP addresses of the target have been found successfully.

**4. "Ping" Command**
It may be needed to test the network communication of two different 
devices within the same network. It is possible to find out whether the 
target is accessed with the "ping" command on the command line. Network 
packet(s) are sent to the destination and awaited for the response with 
the "ping" command. In this way, it can be tested whether there is 
network communication with the destination address.

**Note:** As a security measure, the target system may be 
configured to not to respond to the "ping" command to prevent attackers 
from conducting network and host discovery. The examples below assume 
that this is not the case.

For example, let's test whether we have access to the "letsdefend.io" address with the "ping" command:

The image above shows that 3 packets have been sent to "letsdefend.io" 
and a successful response has been received. In this case, it is seen 
that there is access to the target network.

**Note:** "-n" parameter: Number of echo requests to send.

**"Systeminfo" Command**
The "Systeminfo" is the command that provides detailed information about
 the system. For example, let's see the results by executing the 
command:

The image above shows that detailed information about the system has been successfully displayed on the screen.

**Note :** Since the output of the "systeminfo" command is too long, only the first part is displayed in the image.

**File Operations Commands**
This section covers commands for operations performed on files.

**1. "Type" Command**
The "type" is the command that is used to print the file content to the 
screen. For example, let's print the contents of the file "file.txt":

The image above shows that the content of the file "file.txt" has been successfully printed on the screen with the type command.

**3. "Copy" Command**
The "copy" is the command that is used in file copy operations. The 
first parameter in the "copy" command is the path of the file to be 
copied. The second parameter is the target path. For example, let's copy
 the file "file.txt" with a copy in the same directory:

The image above shows that the file "file.txt" was successfully copied and a new file named "copyfile.txt" was created.

**4. "Mkdir" Command**
The "mkdir" is the command that is used to create a new directory. It 
stands for "make directory". For example, let's create a directory named
 "incident" with the mkdir command: 

 

The image above shows that the directory named "incident" has been successfully created using the mkdir command.

**5. "Rename" Command**
The "rename" is the command to rename files. For example, let's rename the file "file.txt" to "file2.txt":

The image above shows that the file name has been successfully changed.

**6. "Move" Command**
The "move" is the command that is used to move files. For example, let's
 move the "file2.txt" file under the directory named "incident":

The image above shows that the "incident" directory is empty before the file migration is carried out.

And as seen in the image above the "file2.txt" file has been successfully moved with the "move" command.

**7. "Tree" Command**
The "tree" is the command that allows listing nested directories with a 
single command. For example, let's list the folders under the 
"C:\Users\LetsDefend" directory:

The image above shows that the nested directories have been successfully listed with the "tree" command.

**8. "Rmdir" Command**
The "rmdir" is the command that is used to delete directories. For example, let's delete the directory named "incident":

When "rmdir" command is run without parameters, directory deletion is 
not performed because the directory to be deleted must be empty in order
 for "rmdir" command to work without parameters. Therefore, it is 
necessary to use the command with a parameter. When the command is run, a
 warning will be prompted and if confirmed, the directory will be 
deleted.

The image above shows that the directory deletion process has been 
successfully carried out with the "rmdir /S incident" command.

**Note:** "/S" parameter: Removes all directories and files
 in the specified directory in addition to the directory itself. It is 
used to remove a directory tree.

We covered what the command line is, the importance of the command line 
in terms of security, and some of the basic commands in this part of the
 training. You can find other helpful commands and further detailed 
information on the Windows command line at the following addresses:

https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commandshttps://ss64.com/nt/

In the next part of the training, "Users and Groups" will be covered.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd8.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd9.png)

- "-a" parameter : Displays all connections and listening ports.
- "-n" parameter : Displays addresses and port numbers in numerical form.
- "-o" parameter : Displays the owning process ID associated with each connection.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd10.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd11.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd12.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd13.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd14.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd15.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd16.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd17.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd18.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd19.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd20.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/cmd21.png)

- https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands
- https://ss64.com/nt/

