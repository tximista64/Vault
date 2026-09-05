---
tags:
  - networking
  - ftp
  - wireshark
  - network-forensics
  - course/lets-defend
---

# File Transfer Protocol (FTP) - 2

## FTP Protocol Review with Wireshark

There are some tools with a graphical user interface (GUI) that allow
 network packets to be examined in detail. One of these tools is the 
"Wireshark" tool.

You can download the Wireshark tool from the following address:

**Wireshark:** [https://www.wireshark.org/download.html](https://www.wireshark.org/download.html)

In the images below, when the network packets of the FTP protocol are
 examined over Wireshark, it is seen that some operations are performed.
 Let's examine each one of these steps.

**Note:** You can access the pcap file in the example from the "Course Files" area at the end of the page.

First of all, it is seen that the login to the FTP server is done:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/3.File+Transfer+Protocol+(FTP)+-+2/ftpprotocol1.png)

As can be seen in the image above, when you right-click on the first 
FTP packets in the pcap file and click on “Follow TCP Stream”, the 
commands for FTP traffic can be seen as follows:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/3.File+Transfer+Protocol+(FTP)+-+2/ftpprotocol2.png)

As seen in the image above, the login process has been successfully 
completed with the "letsdefend" username and "password1" password.

After the login process, the directory listing process is done with the "LIST" command:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/3.File+Transfer+Protocol+(FTP)+-+2/ftpprotocol3.png)

As can be seen in the image above, it is seen that the directory 
listing process is successfully completed after the "LIST" command. By 
moving to the next stream, the listed directories can be seen:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/3.File+Transfer+Protocol+(FTP)+-+2/ftpprotocol4.png)

As seen in the image above, the files and directories are listed successfully.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/3.File+Transfer+Protocol+(FTP)+-+2/ftpprotocol5.png)

In the next stream, it is seen that the "message.txt" file has been transferred. File transfer was completed successfully.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/3.File+Transfer+Protocol+(FTP)+-+2/ftpprotocol6.png)

The next stream shows the "message.txt" content.

In this part of the training, the FTP protocol review on Wireshark is
 discussed. In the next part of the training, the topic of “Secure Shell
 Protocol (SSH)” is discussed.

**Course Files**

