---
tags:
  - networking
  - dns
  - course/lets-defend
---

# Domain Name System (DNS) - 1


## **What is DNS Protocol?**

In the early times of the internet the hostnames were located in the 
“Hosts” files in the central servers. The IP address of a computer with a
 known hostname used to be found through this file. With the increased 
amount of domains on the internet over time, the size of the hosts file 
increased gradually. The uploading of this file to computers over the 
network was difficult in many aspects and that led to the creation of 
the DNS protocol as a solution to this problem. Today, the hosts file is
 still included in computers and can be used.

**Note:** The location of the hosts file on Windows and Linux and the structure of this file are described in the following sections.

Each website has an IP address and we need to know the IP address of 
the website we need to connect to. There are so many websites and it is 
not possible to remember the IP addresses of these websites. Another 
reason for it is that the format of the IP addresses is not easy to 
remember. Therefore, the DNS is used as a protocol that is responsible 
for the IP address and hostname matching and transformations.

The DNS protocol finds the IP address of the hostname we need to 
connect to. For example, if you want to access to “Letsdefend.io” via 
browser, our system needs to know the IP address of letsdefend.io which 
will be handled by the DNS protocol.

## **What is Domain and Subdomain?**

“**Domain**” is an address used to access websites on the internet that has certain hierarchical structures.

“**Subdomain**” are the sub-sites under the main domain.
 Hierarchically subdomain is located on the left side of the main domain
 address it is separated form it with a “.” (dot). For example, the 
image below shows domain and subdomain:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/5.Domain+Name+System+(DNS)+-+1/dns1.png)

## **Top-Level Domains**

Top-Level Domain (TLD) is the extensions added to the domain names. 
They are separated and determined in accordance with certain purposes to
 the right of the internet addresses. For example, some of the most 
well-known TLDs are as in the image below:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/5.Domain+Name+System+(DNS)+-+1/dns2.png)

The are a lot of different TLDs for different use and purposes. You 
can get more detailed information about TLDs and types at the [following page.](https://en.wikipedia.org/wiki/Top-level_domain)

You can see the list of the TLDs at the [following page.](https://en.wikipedia.org/wiki/List_of_Internet_top-level_domains)

## **Features of the DNS Protocol**

- The DNS protocol is located in the 7th layer (Application Layer) according to the OSI model.
- It uses the UDP protocol in the transport layer.
- DNS consists of a hierarchical structure.
- DNS has a mechanism that works using distributed databases.
- Each organization has its own DNS servers to enable devices to communicate with each other within its own computer network.
- DNS Server usually uses the UDP 53 port.

## **DNS Protocol Working Logic**

When we want to connect to a website a number of highly systematic 
transactions occur within seconds. These are the DNS protocol and DNS 
servers related transactions. The DNS protocol uses DNS servers to 
perform its tasks. DNS Server keeps the Hostname-IP address information 
of websites and responds to the DNS queries for this information. In 
this way, the IP address of the website in the query is transmitted to 
provide network communication. When the DNS protocol cannot perform the 
task, the communication of the devices with each other is interrupted, 
and therefore, the DNS protocol is of great importance for 
communication.

The below image shows the flow of how a system acquires the IP 
address information through DNS to access the “Letsdefend.io” website.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/5.Domain+Name+System+(DNS)+-+1/dns3.png)

Below are the details of every single numbered steps:

1. The computer sends the DNS query to the DNS Server, which is
registered on itself. If it has been accessed to “Letsdefend.io”
previously, the IP address of this website may already be found in the
DNS server. If so, IP address information is obtained from the DNS
Server.
2. If “Letsdefend.io” was not accessed before, DNS
Server cannot find the IP address information and contacts the “Root DNS Server” in order to detect the authorized DNS Server of
“Letsdefend.io”.
3. The “Root DNS Server'' tries to determine
the “Primary DNS Server” which belongs to "Letsdefend.io" from the
database. After the “Primary DNS Server” IP address is determined, it is transmitted to the previous DNS server.
4. The DNS Server,
which is registered on the computer, obtains the “Primary DNS Server”
address, which belongs to "Letsdefend.io", then sends a DNS query to
detect the IP address of the "Letsdefend.io" domain.
5. The DNS query reaches to the “Primary DNS Server” which belongs to “Letsdefend.io" and this DNS query is replied.
6. The DNS Server, which is registered on the computer, sends the IP address
of "Letsdefend.io" to the querying system that needs to access to
"Letsdefend.io". The computer with the IP address can now contact the
target as it has already obtained the information required to access the target website.

## **Types of DNS Records**

There are a lot of different forms and variations of DNS records that
 are registered on the DNS servers. Some of these registration types are
 as in the image below:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/5.Domain+Name+System+(DNS)+-+1/dns4.png)

You can get more detailed information about the types of DNS records at the following page:

[https://en.wikipedia.org/wiki/List_of_DNS_record_types](https://en.wikipedia.org/wiki/List_of_DNS_record_types)

## **DNS Protocol Review with Wireshark**

There are some tools with a graphical user interface (GUI) that allow
 network packets to be examined in detail. One of these tools is the 
"Wireshark" tool.

You can download Wireshark at the [following page.](https://www.wireshark.org/download.html)

An example DNS query and response is shown below through Wireshark:

**Note:** You can access the PCAP file in the example from the "Course Files" area at the end of the course.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/5.Domain+Name+System+(DNS)+-+1/dns5.png)

As seen in the image above, a DNS query was made to find the IP 
address of the "letsdefend.io" website. DNS record type is of type "A". 
Let's see the response returned to the DNS query:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/5.Domain+Name+System+(DNS)+-+1/dns6.png)

As seen in the image above, the DNS query was responded and the IP addresses of the "letsdefend.io" address were found.

**Note:** You can access the PCAP file in the example from the "Course Files" area at the end of the course.

We have covered the basics of DNS protocols, its features, and how it
 works as well as a review of the DNS protocol on Wireshark in this part
 of our training. We will keep learning on the DNS protocol in the next 
part of our training.

