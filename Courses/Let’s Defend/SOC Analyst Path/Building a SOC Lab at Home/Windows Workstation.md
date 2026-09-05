---
tags:
  - homelab
  - windows
  - active-directory
  - virtualbox
  - course/lets-defend
---

# Windows Workstation

## **Download**

- Download the [tool offered by Microsoft.](https://go.microsoft.com/fwlink/?LinkId=691209)
- Launch it.
- Accept the software license.
- Select "create an installation support" to make an ISO.
- Select the English language.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/download1.png)

- Select "ISO file."
- Save the file on your computer.

## VirtualBox Settings

Create a new virtual machine.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/vm1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/vm2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/vm3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/vm4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/vm5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/vm6.png)

Go to the VM properties.

In the Network tab, change the configuration to use the internal network: GREEN

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/vm7.png)

Launch the VM: It will ask you which ISO Virtualbox must mount on the VM, load the Windows Server one.

# 

## Installation of Windows

Select the English language to install. The other settings can be 
adjusted with your favorite configurations but Windows must be installed
 in English!

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/install1.png)

Select "install now".

Select "I don't have a product key". (or enter the one you have)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/install2.png)

Select Windows 10 Pro version.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/install3.png)

Accept the license terms.

Select a custom install.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/install4.png)

Select the only drive you have and select "Next".

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/install5.png)

- Wait until the installation is complete and the system reboots itself.
- Select your region.
- Select your keyboard layout.
- Select "I don't have internet" in the left bottom corner.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/install6.png)

Select " Continue with limited setup" in the left bottom corner.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/install7.png)

- Name your local account and secure it with a password.
- Setup your 3 security questions.
- Set all other options to the minimal value. (no location, no track, etc.)

## Configuration of Windows

- Connect to your administrator account.
- Go to "Open Network & Internet Settings".
- Change the adapter options.
- Select your card properties.
- Go to "Internet Protocol Version 4" > Properties.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/setting01.png)

Assign IP.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/setting2.png)

Try to join the gateway. (so your LAN INTERFACE in pfSense)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/setting3.png)

Rename the server with another name you can remember easily.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/setting4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/setting5.png)

Restart your VM.

# 

## Add Your Workstation to the Domain

- Go to "Advanced system settings".
- Select "Change".

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/setting6.png)

- Select "Domain" and give your netbios domain name.
- Give your Administrator domain account credentials.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/03-Windows_Workstation/Images/setting7.png)

