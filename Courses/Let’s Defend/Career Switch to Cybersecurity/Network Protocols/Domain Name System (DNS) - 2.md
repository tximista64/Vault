---
tags:
  - networking
  - dns
  - windows
  - linux
  - course/lets-defend
---

# Domain Name System (DNS) - 2


## **Hosts File**

The hosts file is a registry file included with Windows and Linux. It
 is possible to use the hosts file, which was used before the DNS 
protocol was developed, in today's current operating systems as well. In
 DNS queries made over the system, the contents of the hosts file is 
checked first.  If a record related to the address in the query is in 
the hosts file, it means that this record is valid.

**Note:** The location of the hosts file in Windows is: "C:\Windows\System32\drivers\etc\hosts", in Linux it is "/etc/hosts".

For example, let's practice the situations where the record is and is
 not included in the hosts file for the connection to the 
"letsdefend.io" address.

The contents of the hosts file are as follows if the record is not included:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/6.Domain+Name+System+(DNS)+-+2/dnsprotocol1.png)

As seen in the image above, there are no active records in the hosts file.

**Note:** Lines starting with the “**#**” sign in the hosts file are comment lines.

Let's try to access the "letsdefend.io" address via the browser:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/6.Domain+Name+System+(DNS)+-+2/dnsprotocol2.png)

As seen in the image above, the "**letsdefend.io**" website has been accessed successfully.

Let's add a new record to the hosts file and forward the DNS requests
 made to the "letsdefend.io" address to our localhost address. For this,
 the hosts file should be edited as follows:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/6.Domain+Name+System+(DNS)+-+2/dnsprotocol3.png)

As seen in the image above, a new record has been added and the file has been saved.

**Note:** It is necessary to have the administrator privileges to make changes on the Hosts file.

After this change, let's try to access the "letsdefend.io" address via the browser:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/6.Domain+Name+System+(DNS)+-+2/dnsprotocol4.png)

As seen in the image above, although we tried to access the 
"letsdefend.io" address via the browser, we reached the page of the web 
server in our own locale. It is the registry in the hosts file that 
causes this.

## **Making a DNS Query with Dig**

The Dig tool allows to make DNS queries which works from the command 
line on Linux. For example, let's query DNS with the Dig tool:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/6.Domain+Name+System+(DNS)+-+2/dnsprotocol5.png)

As can be seen in the image above, the DNS query has been completed successfully and the response has been returned.

For those who do not have access to the Linux command line, there is an online implementation of the dig tool:

**Dig Online:** [https://www.digwebinterface.com/](https://www.digwebinterface.com/)

For example, let's do the previous practice over the Dig online service:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/6.Domain+Name+System+(DNS)+-+2/dnsprotocol6.png)

As seen in the image above, the DNS query has been successfully 
applied with the online dig service and the response has been received.

## **Making a DNS Query with Nslookup**

Another tool that can make DNS queries is the "nslookup" tool. This 
tool can work on both Windows and Linux command lines. For example, 
let's do a DNS query using the nslookup tool:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/6.Domain+Name+System+(DNS)+-+2/dnsprotocol7.png)

As seen in the image above, the DNS query has been completed successfully and the response has been returned.

We have covered the hosts file and the applications that help 
implement DNS queries. We will talk about the “Telnet Protocol” in the 
next part of the training.

