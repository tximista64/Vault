---
tags:
  - homelab
  - active-directory
  - windows-server
  - virtualbox
  - course/lets-defend
---

# Active Directory


## **Download**

Go to [Microsoft Evalcenter.](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022)

Select "Download the ISO file."

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/download1.png)

Download the ISO in 64 bits in English.

# 

## VirtualBox Settings

Create a new virtual machine.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/vm1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/vm2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/vm3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/vm4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/vm5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/vm6.png)

Go to the VM properties.

In the Network tab, change the configuration to use internal network: GREEN

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/vm7.png)

Launch the VM: It will ask you which ISO Virtualbox must mount on the VM, load the Windows Server one.

## Installation of Windows

Select the English language to install. The other settings can be 
adjusted with your favorite configuration but the Windows must be 
installed in English.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/install01.png)

Select "install now."

Select "Windows Server 2022 Datacenter Evaluation (Desktop 
Experience)". For a lab, the GUI can be usefull if you start a fresh 
career in IT.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/install02.png)

Accept software licence.

Select Custom install.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/install03.png)

Select the only drive mount and click "next".

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/install04.png)

Wait until the installation is complete and the system reboots itself.

Set your password. (remember it's a lab, you can have a weak password)

# 

## Configuration of Windows

Connect to your administrator account.

Go to "Open Network & Internet Settings."

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/AD1.png)

Change adapter options.

Select your card properties.

Go to "Internet Protocol Version 4" > Properties.

Assign IP.

Try to join the gateway. (so your LAN INTERFACE in pfsense)

Rename the server with an easy name to remember/use.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/AD7.png)

Restart your VM.

# 

## Installation of Active Directory

Connect to your administrator account.

Select "Add roles and features."

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/ad8.png)

Add a role-based installation.

Select the only server you've got.

Add "Active Directory Domain Services."

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/ad9.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/ad10.png)

Leave the other Windows settings with defaults configurations.

After it is complete, promote this server to a domain controller.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/ad11.png)

Add a new Active Directory Forest.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/ad12.png)

Leave default configurations and give a password.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/ad13.png)

Leave DNS part by default.

Check the NetBIOS domain name.

Leave the default path.

Launch the install.

Reboot when asked for it.

# 

## Configuration of Active Directory

Now you have the Active Directory Server, you need to populate it with misconfiguration to perform analysis. We will use [BadBlood](https://github.com/davidprowe/BadBlood) for this task, Please follow the instructions below:

- Download it on the AD
- Extract it
- Launch Powershell as administrator
- Go to Badblood folder
- Launch Invoke-BadBlood.ps1
- Let the magic happen (this can take several minutes)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/badblound1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/02-ActiveDirectory/Images/Images/badblound2.png)

Now, you have the Active Directory configuration (2500 users, 500 groups, OU, 100 computers, etc.), have fun!

