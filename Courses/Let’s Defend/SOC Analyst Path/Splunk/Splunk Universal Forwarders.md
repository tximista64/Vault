---
tags:
  - splunk
  - siem
  - windows
  - soc
  - course/lets-defend
---

# Splunk Universal Forwarders


For the training, we are going to install the universal forwarder in the 
default configuration. Our goal is to send Windows logs to Splunk.

- Go to the Windows computer

- Download the [setup file](https://www.splunk.com/en_us/download/universal-forwarder.html)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install7.png)

- Read the Splunk General Terms
- Download the MD5

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install8.png)

- Open the md5 file to have the checksum: at this time is: 83a09c64537832701320609e665e3e7
- Check your MD5 with this PowerShell command "Get-FileHash
.\splunkforwarder-9.0.0.1-9e907cedecb1-x64-release.msi -Algorithm md5"
to confirm you've got the right installer.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install9.png)

Launch the setup

Read the Licence Agreement

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install10.png)

Accept the Licence Agreement

Select "an on-premises Splunk Enterprise instance" because we have to install Splunk on an on-premise server.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install11.png)

Once again, we use the default configuration. Maybe in your company, 
you will use a service account to run the Universal Forwarder.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install12.png)

- Give a username to Universal Forwarder.

- Give the server IP or Hostname and the port to the receiving indexer. I
 use the IP because I have no DNS in my lab. We don't have to change any
 configuration during Splunk installation so the port used is 9997

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install13.png)

Why do we give IP in receiving indexer and not in the deployment 
server? Because we don't have a Deployment server. A deployment server 
is a server that can send a configuration for your universal forwarder.

- Launch the install

### Check Universal Forwarder for Windows Installation

- Go to services.msc

- Check if "SplunkForwarder Service" is up.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install14.png)

- Check if communication is open with Powershell command: "Test-NetConnection -Computername Splunk_IP -port 9997"

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install15.png)

Congratulation, you have installed Splunk!

### Check on Splunk

- Go to your Splunk Server

- Go to Settings > Forwarder management

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/forwarder1.png)

You must see your Windows Computer on this page.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/forwarder2.png)

If you don't see your computer after a few minutes, try to restart 
the Splunk Universal Forwarder service, and check if the connection 
between client and server is okay.

