---
tags:
  - networking
  - dhcp
  - course/lets-defend
---

# Dynamic Host Configuration Protocol (DHCP)



## What is DHCP Protocol?

Dynamic Host Configuration Protocol (DHCP) enables the devices on the
 network to obtain IP addresses dynamically and to configure the other 
network of the device. It is located in the 7th layer of the OSI model.

## DHCP Process

It takes 4 steps for a DHCP client to obtain an IP address from the DHCP server. These steps are shown in the image below:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/7.Dynamic+Host+Configuration+Protocol+(DHCP)/dhcp1.png)

The events that occur in each step above are as follows:

1. The DHCP client sends a broadcast message to detect the IP address of the DHCP Server in the network.
2. Receiving the network packet, the DHCP Server offers the DHCP client an unused IP address as a response.
3. The DHCP client accepts and confirms the IP address information offered by the DHCP server and reports it to the DHCP server.
4. After the DHCP server learns that the DHCP client has approved the IP address information, it records it on its database.

**Note:** DHCP Server saves the IP address information 
it has sent for a certain period of time for the DHCP client. At the end
 of this period, the DHCP client must request an IP address again.

In this part of the training, what the DHCP protocol is and the 
process of requesting an IP address from the DHCP server is discussed.

