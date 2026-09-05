---
tags:
  - splunk
  - siem
  - windows
  - soc
  - course/lets-defend
---

# Splunk Installation on Windows


For the training, we are gonna install Splunk on a Windows Server 2022 virtual machine.

1- Go to the [Splunk Site](https://www.splunk.com/en_us/download/splunk-enterprise.html?locale=en_us)

2- Create an account

3- Download the MSI installer

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/Install1.png)

4- Read the Licence Agreement I know, this seems useless and no one 
will do it, but YOU need to read it and understand it. It will contain 
all your enterprise information. You need to know what will be done with
 your data"

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/Install2.png)

5- Accept the Licence Agreement
For the training, we going to customize options, so press "Customize 
Options" even if we don’t change the default configurations.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install3.png)

6- Select where you want to install Splunk

7- Install Splunk as a local System

8- Set the credentials

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install4.png)

9- Launch this install and wait

10-Check the Splunk Installation

After the job is done, try to connect to: https://127.0.0.1:8000

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/Install5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/install6.png)

Congratulation, you have installed Splunk!

### Supervision

If you go to services.msc you will find a "Splunkd Service" which has
 a startup type "automatic" and it must be in running status. You can 
monitor this service and status to check your Splunk state.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/service1.png)

