---
tags:
  - networking
  - ssh
  - course/lets-defend
---

# Secure Shell Protocol (SSH)



## What is SSH Protocol?

SSH protocol is a remote access protocol that provides secure access to devices.

## Features of SSH Protocol

- According to the OSI model, the SSH protocol is in the 7th Layer (Application Layer).
- It uses the TCP protocol at the transport layer.
- It has a Client-Server architecture.
- Different operating systems can use it.
- The SSH protocol uses TCP port 22 by default.
- It is one of the protocols that is frequently preferred and provides secure remote access to devices.
- While establishing the SSH connection, the authentication process that
provides basic security is performed using a username and password.
- In SSH connections, network traffic is transmitted as encrypted.

## Establishing an SSH Connection

Connecting to the target system remotely using the SSH protocol is 
quite simple. Moreover, it provides cryptographically secure 
communication. Some configurations are required for the SSH connection 
to occur. For example, the port to be used on the system where the SSH 
server is installed (in the example below, the default SSH port is TCP 
22.) may need to have a firewall rule in the configuration on the 
firewall to allow incoming requests.

**Note:** The topic of firewall configuration on Windows
 is included in the "Windows Fundamentals" training. You can access it 
from the link below:

**Windows Fundamentals:** [https://app.letsdefend.io/training/lessons/windows-fundamentals](https://app.letsdefend.io/training/lessons/windows-fundamentals)

The following address can be used for SSH server installation and configuration on Linux:

**Installation and Configuration SSH Server on Linux:** [https://linuxhint.com/enable-ssh-linux-mint/](https://linuxhint.com/enable-ssh-linux-mint/)

Since SSH protocol has a client-server architecture, an SSH server 
must be installed on the device to be connected. Similarly, the SSH 
client application must be installed on the device to be connected. SSH 
server and client applications can have a wide variety of features. For 
example, it could be an application running on the command line, or it 
could be an application with a graphical user interface (GUI). Being a 
command line or GUI application has no direct effect on the connection, 
but being a GUI can provide ease of use.

Another issue is the operating systems on which SSH servers and 
client applications are installed. The operating system has little 
effect on the SSH connection. SSH connection can be established between 
different operating systems. You can install the appropriate SSH server 
or client application on which operating system you have.

In the example given below, "OpenSSH Server(Linux - Debian11 - 
Command Line)" is used as an SSH server, and "Powershell (Windows - 
Command Line)" is used as SSH Client.

First of all, SSH server and SSH client applications must be installed.

For the "OpenSSH Server" installation, the following command can be applied via the Linux command line:

**Install OpenSSH Server on Linux:** sudo apt install openssh-server

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/4.Secure+Shell+Protocol+(SSH)/ssh1.png)

The following address can be used to install an OpenSSH client on Windows:

**Install OpenSSH for Windows:** [https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui)

After the SSH Client and SSH Server are ready, let's set activate the
 "ssh" service of the SSH Server with the "sudo service ssh start" 
command on the Linux command line:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/4.Secure+Shell+Protocol+(SSH)/ssh2.png)

**Note:** The subject of managing services from the 
command line on Linux is included in the "Linux for Blue Team" training.
 You can access it from the link below:

**Linux for Blue Team:** [https://app.letsdefend.io/training/lessons/linux-for-blue-team](https://app.letsdefend.io/training/lessons/linux-for-blue-team)

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/4.Secure+Shell+Protocol+(SSH)/ssh3.png)

As seen in the image above, the SSH server service has been started successfully.

Let's make ssh connection via PowerShell on a Windows machine:

The command to be executed should be as follows:

**Command Format:** ssh username@SSH_Server_IP_Address

The “ssh” applied in the command indicates the application name to be
 run. The part before the “@” sign in the second parameter of the 
command shows which user account will be connected to the target system.
 The part after the “@” sign indicates the SSH Server IP address.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/4.Secure+Shell+Protocol+(SSH)/ssh4.png)

As seen in the image above, after executing the command for the ssh 
connection, the password of the "letsdefend" user is requested and after
 the correct password is entered, the connection to the Linux command 
line is successfully established.

After accessing the Linux command line, it is possible to manage the system by applying many commands.

**Note:** The subject of basic commands that can be 
applied on the command line on Linux is included in the "Linux for Blue 
Team" training. You can access it from the link below:

**Linux for Blue Team:** [https://app.letsdefend.io/training/lessons/linux-for-blue-team](https://app.letsdefend.io/training/lessons/linux-for-blue-team)

In this part of the training, what the SSH protocol is, its features,
 and how to establish an SSH connection are discussed. In the next part 
of the training, the subject of “Hypertext Transfer Protocol (HTTP)” is 
discussed.

