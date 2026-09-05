---
tags:
  - networking
  - ip-addressing
  - course/lets-defend
---

# IP Addressing Mechanism



While
 creating TCP/IP computer networks, a logical address (IP Address) must 
first be assigned to each device in the network. These assignment 
processes are called "IP Addressing Mechanism". If an IP address is not 
assigned to a device in the network, it cannot communicate with devices 
inside or outside the network.

**What is an IP Address?**

IP Address is the ID of the device's network address. Connection 
operations are performed using IP addresses. IP addresses are divided 
into IPv4 and IPv6. Examples of both types of IP addresses are the 
following IP addresses:
**IPv4:** 192.168.4.1**IPv6:** 2001:0db8:85a3:0000:0000:8a2e:0370:7334

**Structure of IP Address**

The IP address consists of 4 bytes (32 bits). A period is placed between
 each byte and is expressed in decimal notation. For example, the image 
below shows the conversion of the IP address between binary 
representation and decimal representation:

Since each byte consists of 8 bits, the 8-bit value must be "0" (zero) 
in order for each byte to receive the minimum value. Similarly, the 
8-bit value must be "1" for each byte to get the maximum value. For 
example, let's calculate the minimum and maximum values ​​that each byte
 in the IP address can take:

**Minimum (Binary)** : 00000000

As can be seen as a result of the calculation, the decimal equivalent of the binary expression "00000000" is "0" (zero).

**Maximum (Binary)** : 11111111

As can be seen as a result of the calculation, each byte of the IP address can take a value between “0-255”.

 

**Classes of IP Address**

IP addresses are divided into 5 classes. In order to learn the class of 
the IP address, the first byte of the IP address is checked. According 
to the decimal value of the first byte, it is understood which of the 
classes the IP address belongs to in the table below.

It is possible to find out which network the device with that IP address
 is included in via its IP address. In order to learn this information, 
first of all, it should be known which class the IP address belongs to. 
Then, the “Network Bits” fields in the table below are checked.

For example, let's find out which class the IP address "192.168.4.1" belongs to and which bytes are the network bits:
**Step 1:** Check the decimal value of the first byte: "192"**Step 2:** According to the table, it is learned which class the value “192” belongs to: “Class C”**Step 3:** According to the table, it is checked which 
bytes of an IP address belonging to the "C" class belong to the network 
bits: "first 3 bytes"
According to the information we have obtained, it can be said that the 
IP addresses with the same first 3 bytes belong to the devices in the 
same network. For example, the IP address “192.168.4.1” and the IP 
Address “192.168.4.2” are on the same network. Because there is a change
 only on the byte where the host bits are located. Network bits have the
 same value: 192.168.4.X

**What is IPv6?**

Today, the number of devices connected to the internet network is quite 
high. Considering that all these devices have an IP address, IPv4 is no 
longer sufficient. For this reason, some technologies (NAT) and IPv6 
have been developed to solve this problem. With IPv6, the use of IPv4, 
which has a limited number of addresses, has begun to decline and leaves
 its place to IPv6. The following table compares IPv4 and IPv6:

*(Image Source: commons.wikimedia.org)* 
**Private IP Addresses**

Some of the IP addresses are reserved for special purposes. These 
reserved IP addresses are IP addresses used in private networks. Private
 networks are networks that are not directly connected to the Internet 
and are connected to the Internet with an intermediary network device. 
For example, home networks and on-premises networks. In-home networks, 
the modem device provides a connection to the Internet and manages the 
packet flow. The modem device has a network interface facing the home 
network and a network interface facing the internet side. The part 
called the private network is the part where the home network interface 
of the modem device is located. The IP addresses of the devices in this 
section are reserved IP addresses that are not used in the internet 
environment. The following table shows the private IP address ranges:

**What is a Localhost?**

Localhost is the IP address range that specifies the device's own 
network address. It is used to access services running locally on the 
device. It is commonly known as the "127.0.0.1" IP address. However, any
 IP address in the range “127.0.0.1 - 127.255.255.255” can be used for 
this purpose. Another name is the "loopback" address.

In this part of the training, what the IP address is, its structure, 
classes, types, and IPv6 are discussed. In the next part of the 
training, “Network Address Translation (NAT)” will be explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/IP1-1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/binary-1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/binary-2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/ip2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/ip3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/ip4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/ip5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/ip6.png)

