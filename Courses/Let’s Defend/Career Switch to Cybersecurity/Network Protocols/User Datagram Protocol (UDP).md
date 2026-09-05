---
tags:
  - networking
  - udp
  - tcp-ip
  - course/lets-defend
---

# User Datagram Protocol (UDP)


## **What is User Datagram Protocol (UDP)?**

User Datagram Protocol (UDP) is another network protocol that 
provides data transmission between applications. It is located in the 
4th layer of the OSI model. Unlike the TCP protocol, the UDP protocol 
does not provide transmission reliability.

## **Features of the UDP Protocol**

- It does not require connection setup before transmission.
- It provides a fast transmission.
- It does not guarantee that the data will be transmitted.
- It contains less information in the header structure.
- It is often used by video applications and real-time applications.
- It doesn't do error checking.
- It doesn't handle flow control.

## **UDP Connections**

UDP connections are frequently used by applications that transmit 
data via UDP. In order for applications to connect with the UDP 
protocol, some information about the protocol is used. Each UDP 
connection consists of “**Source IP Address-Source Port Number”, “Destination IP Address-Destination Port Number**” information.

**Note:** You can find the explanation about the port concept from the previous [TCP domain.](https://app.letsdefend.io/training/lesson_detail/transmission-control-protocol-tcp-1)

**Default UDP Ports**

Below are examples of default ports for the most well-known protocols:

- DNS : 53
- DHCP : 67,68
- SNMP : 161,162

A larger list of default UDP ports can be found at:

**Default Ports** : [https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)

## **UDP Protocol Header**

The fields in the UDP protocol header are much less than other 
network protocols. The following image shows the headers and fields of 
the UDP protocol:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/4.User+Datagram+Protocol+(UDP)/udp1.png)

**Source Port Number**

It is the field that contains the port number of the sender. It is “16 bits” long.

**Destination Port Number**

It is the field that contains the port number of the recipient. It is “16 bits” long.

**Length**

It is the field that contains the total length of the header and data of the UDP segment. It is “16 bits” long.

**Checksum**

The “**Checksum**” field contains the hexadecimal value 
that allows checking whether the integrity of the UDP segment is intact 
during transmission. Unlike the TCP protocol, this field is not 
required. It is “16 bits” long.

## **UDP Protocol Review with Wireshark**

There are some tools with a graphical user interface (GUI) that allow
 network packets to be examined in detail. One of these tools is the "**Wireshark**" tool.

You can download the Wireshark tool from the following [this link.](https://www.wireshark.org/download.html).

Let's see each field of the UDP protocol described above via wireshark:

**Note:** You can access the PCAP file in the example from the "**Course Files**" area at the end of the course.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/4.User+Datagram+Protocol+(UDP)/udp2.png)

As you see in the image above, the fields of the UDP protocol have been displayed successfully through the Wireshark tool.

We have learned what the UDP protocol is, its features and the fields
 in the UDP protocol header in this part of the training and we will 
cover the “DNS Protocol” in next chapter of our training.

