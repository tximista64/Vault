---
tags:
  - antivirus
  - endpoint-security
  - soc
  - course/lets-defend
---

# Antivirus Software (AV)


## **What is Antivirus Software (AV)?**

Antivirus Software (AV) is security software that detects malware on 
devices and blocks and removes malware from the system before it harms 
the device.

## **Types of Antivirus Software**

Antivirus software is generally responsible for scanning the system 
for security. Antivirus software can be divided into subtypes according 
to scanning methods:

### **Signature-Based Scanning**

In the signature-based scanning method, the antivirus software scans 
the system to detect malware with a digital signature, and if there is a
 matching signature, it marks the file it scans and matches as malicious
 and clears the file from the system. In this method, digital signatures
 are kept on the system in the database and must be constantly updated 
with up-to-date malware signatures. It is a method that has been used 
from the past to the present and is effective in detecting known 
malware. Although it does not catch every single malware, it can detect 
most of them.

### **Heuristic Scanning**

The heuristic scanning method is a very different malware detection 
method than the previous signature-based scanning method. Instead of 
detecting by signature, it monitors the accesses and behaviors of the 
examined file. In this way, the probability of detecting malicious 
activities is much higher. For example, this behavior is flagged as 
suspicious if the executable file that the antivirus tracks is trying to
 read or modify a system file it shouldn't be able to access. Even if 
its signature is not in the antivirus database as malicious, it may be 
executable malware. This situation is logged by the antivirus.

## **Functions of Antivirus Software**

- To detect malware in the system by constantly scanning the system
- Protecting the system against external threats
- Cleaning detected malware from the system

## **Logic Behind How Antivirus Software Works**

The working logic of antivirus software is shown as follows:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image1.gif)

(Source: [https://www.youtube.com/watch?v=jW626WMWNAE](https://www.youtube.com/watch?v=jW626WMWNAE))

## **The Importance of Antivirus Software for Security**

Antivirus software, which has a long history, is of great importance 
in terms of security. Periodic security scans on systems are one of the 
most basic security procedures to be performed. Antivirus software is 
one of the most effective ways to detect known malware and quickly clean
 it from the system. If an institution does not have antivirus software,
 it means that security is weak at some point. Using antivirus software 
with an up-to-date malware signature database is necessary to ensure 
security today.

Some popular Antivirus products used in the cybersecurity industry are as follows:

- McAfee
- Symantec
- Bitdefender
- Eset
- Norton

## **What log sources does Antivirus Software have?**

Antivirus software keeps logs of the findings it obtains in its 
periodic scans or a special scan of a specific file. These logs contain 
information about the detected malware. For example, information such as
 the size of the file, the name of the file, its signature, and the type
 of malware can be included in the logs. Thanks to these logs, 
information on retrospective scans and malware detections can be 
obtained.

In this part of the training, what Antivirus software is, its types, 
tasks, working logic, and importance for security were discussed. In the
 next part of the training, “**Sandbox Solutions**” will be explained.

