---
tags:
  - sysmon
  - windows
  - log-analysis
  - soc
  - course/lets-defend
---

# Sysmon



## Download Sysmon

- Go to [Windows Sysinternals page.](https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon)
- [Download Sysmon.](https://download.sysinternals.com/files/Sysmon.zip)
- Extract it.

## Download the Configuration File

- Download the [xml file.](https://github.com/olafhartong/sysmon-modular/blob/master/sysmonconfig.xml)
- Save it in the Sysmon's folder.

## **Install It**

- Launch Powershell in administrator.
- Install it with "sysmon.exe -accepteula -i YOURFILE.xml".

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Building+a+SOC+Lab+at+Home/04-Sysmon/Images/install01.png)

Please review the '[Log Analysis with Sysmon](https://app.letsdefend.io/training/lessons/log-analysis-with-sysmon)' course to obtain further information on Sysmon.

