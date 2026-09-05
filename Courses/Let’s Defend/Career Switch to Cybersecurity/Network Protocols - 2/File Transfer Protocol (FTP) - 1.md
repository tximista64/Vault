---
tags:
  - networking
  - ftp
  - course/lets-defend
---

# File Transfer Protocol (FTP) - 1


## What is FTP Protocol?

File Transfer Protocol (FTP) is a network protocol that provides file transfer between devices.

## Features of FTP Protocol

- According to the OSI model, the FTP protocol is located in the 7th Layer (Application Layer).
- It uses the TCP protocol at the transport layer.
- It has a Client-Server architecture.
- Different operating systems can use it.
- For file transfer with FTP protocol, a connection must be established first.
- While establishing the FTP connection, the authentication process that
provides basic security is performed using a username and password.
- FTP does not encrypt its traffic; all transmissions are in clear text, and
usernames, passwords, commands, and data can be read by anyone able to
perform packet capture (sniffing) on ​​the network. (Source: Wikipedia)
- Provides data representation diversity (like ASCII and EBCDIC).

## FTP Commands

The FTP protocol uses some commands while performing its tasks. Some of these commands are explained below:

1. **USER Command**

The USER command is the command that determines which user to connect to the FTP Server.

1. **PASS Command**

The PASS command is the command that gives the password of the user 
provided with the USER command for the connection to the FTP Server.

1. **HELP Command**

It is the command that provides information about the usage of 
commands. If used without parameters, a list of commands is displayed.

1. **PWD Command**

The PWD command is the command that shows which directory it is working on.

1. **RETR Command**

The RETR command is the command used to initiate the file transfer process.

1. **STOR Command**

It is the command used to transfer the specified file to the server.

1. **LIST Command**

It is the command that lists the names and properties of the directory and files under the current directory.

1. **QUIT Command**

It is the command that terminates the FTP connection.

You can find the detailed list of commands for the FTP protocol at the following address:

**FTP Commands**: [https://en.wikipedia.org/wiki/List_of_FTP_commands](https://en.wikipedia.org/wiki/List_of_FTP_commands)

## FTP Server Return Codes

FTP servers transmit 3-digit return codes in response to commands from FTP clients.

An example of these return codes is in the image below:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/2.File+Transfer+Protocol+(FTP)+-+1/ftp1.png)

Each of the FTP return codes seen in the image above has a different meaning:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/2.File+Transfer+Protocol+(FTP)+-+1/ftp2.png)

You can find the detailed list of FTP Server return codes at the following address:

**List of FTP server return codes**: [https://en.wikipedia.org/wiki/List_of_FTP_server_return_codes](https://en.wikipedia.org/wiki/List_of_FTP_server_return_codes)

## File Transfer with FTP

Transferring files using the FTP protocol is very convenient and 
simple. Some configurations are required to be able to transfer files. 
For example, the port to be used on the system where the FTP server is 
installed (the default FTP port TCP 21 is used in the example below) may
 need to have a firewall rule in the configuration on the firewall to 
allow incoming requests.

**Note:** The topic of firewall configuration on Windows
 is included in the "Windows Fundamentals" training. You can access it 
from the link below:

**Windows Fundamentals**: [https://app.letsdefend.io/training/lessons/windows-fundamentals](https://app.letsdefend.io/training/lessons/windows-fundamentals)

Since FTP protocol has client-server architecture, FTP server must be
 installed on the device that will send the file. Similarly, the FTP 
client application must be installed on the device that will receive the
 file. FTP server and client applications can have a wide variety of 
features. For example, it could be an application running on the command
 line, or it could be an application with a graphical user interface 
(GUI). Being a command line or GUI application has no direct effect on 
file transfer, but being a GUI can provide ease of use.

Another issue is the operating systems on which FTP server and client
 applications are installed. The operating system has little effect on 
FTP file transfer. File transfer between different operating systems can
 be done with FTP. You can install the appropriate FTP server or client 
application on whichever operating system you have.

In the example given below, "Vsftpd FTP Server(Linux - Debian11 - 
Command Line)" is used as FTP server and "Filezilla FTP Client(Windows -
 GUI)" is used as FTP Client.

First, FTP server and FTP client applications must be installed.

For the installation of "Vsftpd FTP Server", the following command can be applied via the Linux command line:

**Install Vsftpd FTP Server on Linux**: sudo apt-get install vsftpd

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/2.File+Transfer+Protocol+(FTP)+-+1/ftp3.png)

The following address can be used for FTP server installation and configuration on Linux:

**Installation and Configuration FTP Server on Linux**: [https://phoenixnap.com/kb/install-ftp-server-on-ubuntu-vsftpd](https://phoenixnap.com/kb/install-ftp-server-on-ubuntu-vsftpd)

To install the "Filezilla FTP Client" application on Windows, the installation file can be downloaded from the address below:

**Download Filezilla FTP Client**: [https://filezilla-project.org/download.php?type=client](https://filezilla-project.org/download.php?type=client)

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/2.File+Transfer+Protocol+(FTP)+-+1/ftp4.png)

**Note:** Since Filezilla FTP client installation 
consists of simple steps with a graphical user interface, detailed 
information is not included in the subject.

The following address can be used for Filezilla FTP client installation on Windows:

**Install Filezilla FTP Client on Windows** : [https://windows.tutorials24x7.com/blog/how-to-install-filezilla-ftp-client-on-windows-10](https://windows.tutorials24x7.com/blog/how-to-install-filezilla-ftp-client-on-windows-10)

After the FTP Client and FTP Server installation is completed, let's 
set activate the "vsftpd" service of the FTP Server with the command 
"sudo service vsftpd start" on the Linux command line:

**Note:** The subject of managing services from the 
command line on Linux is included in the "Linux for Blue Team" training.
 You can access it from the link below:

**Linux for Blue Team**: [https://app.letsdefend.io/training/lessons/linux-for-blue-team](https://app.letsdefend.io/training/lessons/linux-for-blue-team)

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/2.File+Transfer+Protocol+(FTP)+-+1/ftp5.png)

As seen in the image above, the FTP server service has been started successfully.

Let's open the Filezilla FTP client program on the Windows machine:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/2.File+Transfer+Protocol+(FTP)+-+1/ftp6.png)

Let's enter the FTP server information in the section with the 
connection settings on the window seen above and provide the connection 
to the "Quickconnect" button.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/2.File+Transfer+Protocol+(FTP)+-+1/ftp7.png)

As seen in the image above, the connection to the FTP server has been successfully made.

Let's transfer the "message.txt" file on the connected Linux machine to the "D:\Sharing" location on the Windows machine:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/2.File+Transfer+Protocol+(FTP)+-+1/ftp8.png)

As seen in the image above, with the drag-and-drop "message.txt" file has been successfully transferred to Windows.

In this part of the training, what the FTP protocol is, its features,
 FTP commands, FTP server return codes, and FTP file transfer are 
mentioned. The next part of the training covers the continuation of the 
FTP protocol.

