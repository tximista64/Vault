---
tags:
  - crowdsec
  - ids-ips
  - windows
  - soc
  - course/lets-defend
---

# CrowdSec


## **Account**

- Go to the [crowdsec site.](https://www.crowdsec.net/)
- Select "create free account".
- Create the free account and log in to CrowdSec.

# 

## Install for Linux

When you're logged in you will have all the information to install the Linux.

## **Install for Windows**

- Go to the [GitHub page.](https://github.com/crowdsecurity/crowdsec/releases/latest)
- Download the .msi file on the Windows computer. (server and workstation)
- Launch it.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install01.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install02.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install03.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install04.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install05.png)

Contrary to Linux, CrowdSec does not support the automatic 
configuration at installation time. If you want to be able to detect 
something other than RDP or SMB brute force, then you will need to 
customize your acquisition configuration.

- Launch Powershell as an administrator in CrowdSec's folder.
- ****Command:** .\cscli collections install crowdsecurity/windows-firewall

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install06.png)

- Open the acquis.yaml file in "C:\ProgramData\CrowdSec\config".
- Add this to it.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install07.png)

- Reboot the computer.

# 

## Advanced Install for Windows

If you want your Crowdsec with block abilities, then you need to install the Windows Firewall Bouncer Installation.

- Go to the [dedicated page.](https://github.com/crowdsecurity/cs-windows-firewall-bouncer/releases)
- Download the bundle file. (contain all dependancies)
- Launch it.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install08.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install09.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install10.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install11.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install12.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install13.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install14.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install15.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/05-CROWDSEC/Images/install16.png)

