---
tags:
  - edr
  - endpoint-security
  - soc
  - course/lets-defend
---

# Endpoint Detection and Response (EDR)

## **What is EDR?**

Endpoint Detection and Response (EDR) is a security product that is 
installed on endpoint-qualified devices, constantly monitors the 
activities in the system, tries to detect security threats such as 
ransomware & malware, and takes action against malicious activities.

## **Endpoint Devices**

Examples of endpoint devices are:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image-7.png)

## **EDR Core Components**

EDR products can perform many different operations on the endpoint 
device. These are the processes that support each other to ensure the 
security of the device. EDR core components are as follows:

- Endpoint data collection agents
- Automated response
- Analysis and forensics

## **Functions of EDR**

The duties of EDR products are generally as follows:

1. Monitoring and collecting each process on the device that may identify a security threat
2. Analyzing the behavior of threat actors according to the data collected on the device
3. Informing the relevant analyst by taking the appropriate security
action against the threat actor obtained from the collected data.
4. Allow forensic analysis on the device to conduct in-depth investigation of suspicious activities

## **The Importance of EDR for Security**

Ensuring the security of the devices that EDR products need to 
protect has become an essential element to be considered today. Because 
attackers aim to gain access to the network by turning to weak devices 
in terms of security. After gaining access to the network through an 
endpoint, the attacker tries to access more critical systems. In this 
way, if there is an endpoint that does not have an EDR product installed
 and is not sufficiently secure, it can be used by the attacker for 
initial access.

Some popular EDR products used within the cybersecurity industry are as follows:

- SentinelOne
- Crowdstrike
- CarbonBlack
- Palo Alto
- FireEye HX

## **What log sources does EDR have?**

EDR product keeps some information as a log by monitoring the system 
on which it is installed. The processes running on the system are 
monitored and the names of the files accessed by the programs and their 
access information are recorded by EDR as logs. It records which 
programs are run, which files the run programs read, or which file they 
make changes to. Each EDR can obtain various information through the 
system. In general, it can be said that the EDR product monitors and 
logs the sections deemed necessary in terms of security.

For example, in the image below, it is seen that the endpoint security product lists the processes on the device:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image-6-1024x672.png)

Endpoint security product provides some information about the 
processes it lists to the user. Some of this information is size 
information, hash information, and path information, as seen in the 
image above.

In this part of the training, what EDR is, its duties, EDR 
components, and the importance of EDR for security were discussed. The 
next part of the training covers the topic of **“Antivirus Software (AV)”**.

