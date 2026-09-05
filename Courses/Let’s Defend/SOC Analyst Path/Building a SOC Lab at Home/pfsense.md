---
tags:
  - homelab
  - pfsense
  - firewall
  - network-security
  - course/lets-defend
---

# pfsense

## **Download**

Go to the [official site.](https://www.pfsense.org/download/)

Download the last stable version of the community edition.

## VirtualBox Settings

Create a new virtual machine.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/setting01.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/setting02.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/setting03.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/setting04.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/setting05.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/setting06.png)

Go to the VM properties.

In Network tab, activate 3 adapters.

Making note of the MAC Addresses of each adapters will be useful for 
future actions. This will be the RED CARD. (external network)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/setting07.png)

This will be the GREEN CARD. (internal network)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/setting08.png)

This will be the orange CARD. (dmz)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/setting09.png)

Launch the VM. It will ask you which ISO Virtualbox must mount on the VM, load the pfsense one.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/setting10.png)

# 

## Installation

Accept the Copyright and Trademark Notices.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/install01.png)

Select "install".

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/install02.png)

- Select your keymap
- Use the default partition (we're in a lab, we just need a firewall)
- Proceed with installation (no miror, no encrypt, nothing)
- Wait until the installation is complete

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/install03.png)

Do not load manual configuration.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/install04.png)

Reboot on the new system.

## Configuration

Now, the server is powered on with the new system.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/conf01.png)

Select 1 to configure interfaces.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/conf02.png)

We can see the MAC Addresses. Remember, we recommended to make a note
 of the MAC addresses. It is always helpful to have/know them.

- Select the RED INTERFACE for WAN
- Select the GREEN INTERFACE for LAN
- Select the last one (ORANGE) for DMZ

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/conf03.png)

Confirm.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/01-PFSENSE/Images/Images/conf04.png)

- Select 2 to configure the IP address
- Leave the WAN interface as DHCP
- Select 2 to change the LAN interface
- Asssign the IP and subnet you want, *the gateway must be "none"* !

This course was prepared by Julien Garcia. You can find his social media accounts below.

Twitter: [geekmunity_FR](https://twitter.com/geekmunity_FR)

LinkedIn: [Julien G.](https://www.linkedin.com/in/jgarcia-cybersec/)

