---
tags:
  - sandbox
  - malware-analysis
  - soc
  - course/lets-defend
---

# Sandbox Solutions


## **What is Sandbox Solutions?**

Sandbox is a technology used to run/open and examine executable files
 or file types with different extensions (pdf, docx, and xlsx, etc.) 
that are thought or known to be malware in an isolated environment. 
Thanks to the Sandbox, precautions are taken against the problems that 
may arise when the file is run/opened on a live system.

## **The Benefits of Sandboxing**

- It does not put hosts and operating systems at risk.
- Detects potentially dangerous files.
- Allows testing of software updates before they go live.
- It allows fighting against 0-day vulnerabilities.

## **The Importance of Sandboxes for Security**

Malware types encountered in the past are now trying to access 
systems with more different and advanced methods by designing themselves
 in a better way. Therefore, technologies that provide security against 
advanced attack tools and malware are also created. Sandboxes should be 
used to see malware behaviors and take precautions accordingly. Here's 
how a sandbox works:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image-8.png)

Some popular Sandbox products used in the cyber security industry are as follows:

- Checkpoint
- McAfee
- Symantec
- Trend Micro
- Proofpoint

## **What data sources do sandboxes have?**

Each sandbox product holds its unique data. However, it can be said 
that the information that sandboxes can keep in the data presented to 
the user due to their duty is about the analysis they make. For example,
 when the sample.exe file is run in the sandbox environment, information
 such as the run time of this file, the files the program accesses after
 running, its behavior, the date/time information of these operations, 
and the hash information of this file may be included in the data 
provided to the user by the sandbox product.

In this part of the training, what Sandbox is, its benefits, and its 
importance for security were discussed. In the next part of the 
training, **“Data Loss Prevention (DLP)”** will be explained.

