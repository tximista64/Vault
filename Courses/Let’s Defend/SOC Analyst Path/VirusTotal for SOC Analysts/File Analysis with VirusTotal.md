---
tags:
  - virustotal
  - malware-analysis
  - threat-intel
  - soc
  - course/lets-defend
---

# File Analysis with VirusTotal


While reviewing the alert of a SIEM or other security solution, you may have 
noticed a suspicious file and want to analyze it. To view the file 
analysis results of different AV companies, you can upload the file on 
VirusTotal and find out if AV products detect this file as malicious.

- **Please note that** uploaded files can be downloaded by premium VirusTotal users. Because of this if you suspect that file may have
contains sensitive informations, you shouldn't upload to VirusTotal.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-1-1024x539.png)

[https://www.virustotal.com/gui/file/415ba65e21e8de9196462b10dd17ab81d75b3e315759ecced5ea8f5812000c1b](https://www.virustotal.com/gui/file/415ba65e21e8de9196462b10dd17ab81d75b3e315759ecced5ea8f5812000c1b)

In order to interpret the results in more detail, it is necessary to 
look at various areas. In the image below, it is stated that 42 of 58 
security companies have detected this file as malicious.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-2.png)

In the section with tags, there is information about how the file is 
classified. For example, it was stated that the file we uploaded 
contains "macro" and was "obfuscated".

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-3.png)

### **Detection**

In the Detection section, you can view the label with which the vendors marked the file as malicious.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-4-1024x378.png)

### **Details**

Here you can find some basic information about the file and details 
about its VirusTotal history. For example, the “Basic Properties” area 
contains file hash information and more.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-5-1024x273.png)

In the "**History**" field, there are the dates of the first and last analysis of the file in VirusTotal.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-6.png)

As a SOC Analyst, you can draw very important conclusions from this 
field. For example, there is a phishing attack on your institution and 
you analyze the attachment in the email. After you upload the file to 
VirusTotal, if you see that this file has been analyzed before you, you 
can draw the conclusion that this malware was not written specifically 
for your institution. (Not exactly, but more likely.)

Similarly, if you come across a file that has been analyzed before, 
you can understand that this attack was done on different institutions.

### **Relations**

This is the tab that shows detailed information about the domain, IP,
 URL, and other files that the suspicious file in your hand communicates
 with. The data shown here is scanned by security vendors within 
VirusTotal and you can see the results.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-7.png)

You can usually use this tab to check for a suspicious address that 
the file is communicating with. At the same time, you can detect 
suspicious communication activities faster by viewing its reputation 
with the “Detections” score. There is an important point to note: new 
generation malware does not always exhibit the same behavior. They try 
to bypass security solutions by taking different actions in different 
systems. For this reason, the addresses you display in the relations tab
 may not give the entire list that the malware wants to communicate 
with, you should be aware that this list may be incomplete.

### **Behavior**

What determines whether a file is malicious is its activities. In the
 "Behavior" tab, you can see that different manufacturers list the 
activities that the scanned file has done. Among these activities, you 
may encounter many behaviors such as network connections, DNS queries, 
file reading/deletion, registry actions, and process activities.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-8.png)

In section 1, you can specify which manufacturer you want to see the 
results of. Section 2 contains the activities performed by the scanned 
file. For example, if you look at the image above, you can see that the 
file makes four HTTP requests and a few DNS queries.

**IMPORTANT NOTE:** As we mentioned earlier, today's 
malware may not always exhibit the same behavior. For example, malware 
that cannot communicate with the command and control center (CC) may not
 activate itself. If the command and control center of the malware you 
want to analyze is not active, dynamic and static analyzes may not yield
 a clear result. In such cases, you should find old analysis reports 
made in environments such as VirusTotal and examine the behavior as in 
the "Behavior" tab.

### **Community**

You can see the comments added by the community in this area. 
Sometimes, there are those who share important details about how the 
suspicious file was obtained, what needs to be considered during the 
analysis, or undetected. For this reason, checking the "Community" tab 
can be of great benefit.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-9.png)

In general, we talked about why you should look at which areas after 
uploading and scanning a file. This way you can better interpret 
VirusTotal outputs.

