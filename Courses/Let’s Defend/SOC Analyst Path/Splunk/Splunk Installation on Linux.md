---
tags:
  - splunk
  - siem
  - linux
  - soc
  - course/lets-defend
---

# Splunk Installation on Linux


For this part, we will use an Ubuntu 22.04 Desktop computer. It will work 
with other distributions and a server one, but since I used the VM for 
other things it will be easier.

### Installation via GUI

1- Go to the Splunk Site

2- Create an account

3- Download the .deb file

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux1.png)

4- Go to your Downloads folder

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux2.png)

5- Right Click on it > Open with Other Applications > Software Install

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux3.png)

Click on the "Install" button and wait.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux4.png)

Then it will install successfully.

### Installation via CLI

1-Go to the Splunk Site

2-Create an account

3-When you try to download it, check the upper right corner

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux_cli1.png)

4-Click on "Command Linux Wget", it will give you the command you need to download it.

5-For this section, I will use the tgz format

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux_cli2.png)

6-Open your terminal

7-Go to your installation folder (/opt for me)

8-Paste the command given a few steps ago

9-Add "sudo" if needed

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux_cli3.png)

10-Go to root user

11-Extract it with this command:

tar xvzf splunk-9.0.1-82c987350fde-Linux-x86_64.tgz

---

12-Launch it: /opt/splunk/bin/splunk start --accept-license

13-Answer the questions

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux_cli4.png)

14-Try to connect to the link given

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux_cli5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux5.png)

15-Check The Splunk Installation

By default, Splunk on Linux doesn't run at the system startup. To make it start, run this command in root:

/opt/splunk/bin/splunk enable boot-start

---

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux_cli6.png)

Restart and check the status:

/opt/splunk/bin/splunk status

---

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/linux_cli7.png)

If you look at the output, Splunk started successfully.

