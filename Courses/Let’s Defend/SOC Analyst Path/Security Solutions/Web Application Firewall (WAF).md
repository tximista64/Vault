---
tags:
  - waf
  - soc
  - course/lets-defend
---

# Web Application Firewall (WAF)


## **What is a Web Application Firewall (WAF)?**

Web Application Firewall (WAF) is security software or hardware that 
monitors, filters, and blocks incoming packets to a web application and 
outgoing packets from a web application.

## **Types of WAF**

There are several types of WAF products:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image-11.png)

### **Network-based WAF**

Network-based WAF is a security product that is hardware-based on the
 relevant network. It needs staff to write rules on it and to maintain 
it. Although it is an effective WAF product, it is more expensive than 
other WAF products.

### **Host-based WAF**

Host-based WAF is a cheaper product than network-based WAF. It is a 
WAF with more customization possibilities. Considering that it is a 
software product, it consumes the resources of the server it is on. It 
may be more difficult to maintain and the systems on it must be securely
 hardened.

### **Cloud-based WAF**

Cloud-based WAF is a much more convenient and easy-to-apply security 
solution than other WAF products purchased as an external service. Since
 the maintenance and updates of the WAF product belong to the service 
area, there are no additional costs such as cost and maintenance. 
However, it is a matter to be considered that the cloud-based WAF 
product that is serviced has sufficient customizations suitable for you.

## **How does a web application firewall (WAF) work?**

A WAF manages inbound application traffic according to existing rules
 on it. These requests, which belong to the HTTP protocol, are either 
allowed or blocked per the rules. Since it works at the application 
layer level, it can prevent web-based attacks. In the image below, the 
working logic of the WAF product is shown in a basic sense:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image-12.png)

Before going to the web application, HTTP requests from users are met
 in the WAF product. According to the rule set on the WAF product, as 
shown in the image below, some requests are not allowed to pass, and 
thus requests that create malicious traffic are blocked. Here, it is 
very important how the rules on the WAF define the attack, otherwise, it
 is possible to block incoming normal requests even though they do not 
show malicious behavior. This shows that the WAF product is not used 
efficiently and correctly, so it may result in not being able to prevent
 the attack at some points.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image-13-1024x395.png)

The image above, it is shown how an action is taken on the WAF product against normal and malicious requests.

## **The Importance of WAF for Security**

Today, applications in almost every sector are available in local 
networks or open to the Internet. Ensuring the security of web 
applications, which are widely used in the IT world, is of critical 
matter. Serious data leaks or security breaches can occur on unsecured 
web applications. To prevent all these security breaches, WAF products 
are placed in front of web applications. Even the presence of the WAF 
product in front of the web applications is not sufficient to ensure 
application security, while the absence of the WAF product is not 
recommended at all.

Some popular WAF products used in the cybersecurity industry are as follows:

- AWS
- Cloudflare
- F5
- Citrix
- Fortiweb

In this part of the training, what WAF is, its types, its working 
logic, and its importance for security were discussed. In the next part 
of the training, the subject of **“Load Balancer”** will be explained.

