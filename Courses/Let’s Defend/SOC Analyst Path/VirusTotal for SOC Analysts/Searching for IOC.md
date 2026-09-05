---
tags:
  - virustotal
  - threat-intel
  - soc
  - course/lets-defend
---

# Searching for IOC



During the investigation, you may receive various IOCs (Indicator of 
Compromise). To find out more about these IOCs, you can search in the "**Search**"
 section of VirusTotal. For example, by searching the hash value of a 
suspicious file here, you can find historical analysis results or other 
different data, if any.

As an example, let's search for the SHA256 value “**415ba65e21e8de9196462b10dd17ab81d75b3e315759ecced5ea8f5812000c1b**”.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-14.png)

As can be seen, we are faced with the result of an analysis made in the past.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-15-1024x406.png)

[https://www.virustotal.com/gui/file/415ba65e21e8de9196462b10dd17ab81d75b3e315759ecced5ea8f5812000c1b](https://www.virustotal.com/gui/file/415ba65e21e8de9196462b10dd17ab81d75b3e315759ecced5ea8f5812000c1b)

Or if we want to search for an IP address, we can similarly search and view its reputation. Example IP address **70[.]121[.]172[.]89**

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-16-1024x531.png)

When we uploaded a file, we could see the IP addresses that the malware was connecting to in the "**Relations**"
 tab. This is also true for the opposite. By searching the IP address, 
you can find the files related to the IP address in the "**Relations**"
 tab. We can get more ideas by looking at the scores of the files. If we
 look at the image below, we can understand that the  IP address we are 
looking for is related to files such as “**SplitPath**”, and “**TestMfc**”.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-17.png)

In short, you can view past VirusTotal results and different files, IPs, and URL associations by searching in the “**Search**” section.

