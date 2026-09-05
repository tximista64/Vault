---
tags:
  - virustotal
  - threat-intel
  - soc
  - course/lets-defend
---

# Scanning URLs with VirusTotal


You can analyze URL addresses as well as file analysis in VirusTotal. All 
you have to do is query the relevant address from the URL section.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-10.png)

In the rest of the article, the malicious address “**thuening[.]de[/]cgi-bin/uo9wm/**”
 will be examined. (Do not directly access this address as it is a 
malicious address. You can follow the lesson by clicking the VirusTotal 
link below that we provided.)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-11-1024x594.png)

[https://www.virustotal.com/gui/url/2bcbc32b84d5d2f6ca77e99232134947377302e7eeee77555672e57f81cd9428](https://www.virustotal.com/gui/url/2bcbc32b84d5d2f6ca77e99232134947377302e7eeee77555672e57f81cd9428)

We encounter a similar interface as in file analysis. You can review the previous article for **Detection** and **Details**, it will be continued with the Links tab without explaining the same fields again.

### **Links**

It is the part where the links that the URL address leads to outside 
are listed. If you look at the image below, you can see that the address
 we scanned is linked to the address in **strato[.]de**.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-12.png)

When we scan the "**letsdefend.io**" address, it is seen that there are links to social media accounts.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/VirusTotal+for+SOC+Analysts/images/image-13.png)

You can make various inferences with the data you will obtain in this
 area. For example, even if the URL address does not directly contain 
harmful content, it may link to harmful addresses, in which case the 
investigation should continue.

