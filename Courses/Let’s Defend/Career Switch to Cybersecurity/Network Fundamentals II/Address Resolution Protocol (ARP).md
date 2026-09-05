---
tags:
  - networking
  - arp
  - mac-address
  - course/lets-defend
---

# Address Resolution Protocol (ARP)


### What is Address Resolution Protocol (ARP)?

Address Resolution Protocol (ARP) is a network protocol which works 
on the datalink layer and has an important role in the communication of 
devices. The main task of the ARP protocol is to ensure that Logical and
 Physical addresses are matching with each other and to identify the MAC
 address of a device with a known IP address.

### Working Structure of the ARP Protocol

When two devices in a network start to communicate with each other, 
the target device’s MAC address and IP address must be known. The ARP 
protocol helps determine the MAC address of a device with a known IP 
address. The following image shows how this process takes place:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-23.png)

The device A sends the “**ARP Request**” (Broadcast) 
packet to all devices in the network. None of the devices replies back 
to this request except for the device with the IP address in the ARP 
Request Packet as they all can see that the IP address in the ARP packet
 does not belong to any of them. Seeing its own IP address, device B 
sends its own MAC address through an "ARP Reply" packet to the device 
sending the ARP Request.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-24.png)

**Note** : IP addresses and MAC addresses on the visuals are written as representative ones.

### ARP Table

In the previous image, the device A acquired the MAC address of the 
device C using the ARP protocol. This acquired MAC address is kept in 
the ARP table on the device A for a certain period of time. Similarly, 
all devices in the network hold the IP address and MAC address 
information of other devices in the network in the ARP tables for a 
certain period of time. Thanks to the ARP tables, it is determined 
whether the MAC address information of the target device is on the 
device to send the network packet. As in the examples above, it is a 
“Dynamic” process to save the MAC address directly in the ARP table by 
asking the devices in the network directly. Another type of ARP table 
registration process is the “static” registration process. Necessary 
values ​​in the ARP table are entered manually via the command line to 
add a static type of record. You can see the type of records when you 
display the ARP table of the device.

## Displaying the ARP Table on Windows

The “arp -a” command is used to see the ARP table on Windows. For example, let's see by applying the command:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-25.png)

As shown in the image above, the command has been applied successfully and the records on the ARP table are displayed.

## Displaying the ARP Table on Linux

The “sudo arp” command is used to see the ARP table on Linux. For example, let's see by applying the command:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-26.png)

As shown in the image above, the command has been applied successfully and the records on the ARP table are displayed.

### ARP Protocol Header

The ARP protocol has its own header structure. As seen in the example
 below, there are many fields in the header of the protocol. The 
information of the protocol is included in these fields. The following 
image shows the header and fields of the ARP protocol:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-27.png)

Each Field is briefly explained in the following titles:

## Hardware Type

The value in Hardware Type field indicates the network type. In other
 words, it includes the value that shows the protocol in the datalink 
layer. It is “2 byte” long. For example, the value “0x0001” here in this
 field indicates that it has “ethernet”.

**Note:** The value starting with “0x” means “**Hexadecimal**”.

## Protocol Type

The value in the Protocol Type field indicates the value that shows 
the protocol in the network layer. It is “2 byte” long. For example, the
 value “0x0800”  here in this field indicates that it is “Internet 
Protocol” (IP).

## Hardware Length

Hardware Length field shows the length of hardware address. It is “1 
Byte” long. For example, since the MAC address is used as hardware 
address for ethernet, the “6” value is included in this field because 
MAC addresses are 6 byte long.

## Protocol Length

Protocol Length field shows the length of the protocol address. It is
 “1 Byte” long. For example, since the IPv4 address is usually used for 
the IP protocol, the “4” value is included in this field because IPv4 
addresses are “4 byte” long.

## Operation Code

Operation Code field is the area where the task of the frame of the 
ARP protocol. It is “2 byte” long. For example, if there is “1” value in
 this field, it is an “ARP Request” type and if there is “2” in this 
field, it is an “ARP Reply” type.

## Sender Hardware Address

Sender Hardware is the field with the hardware address of the device 
that sends the frame. For example, this is the field where the sender’s 
MAC address is for Ethernet. The length of this area varies according to
 the protocol. The length of the 'Sender Hardware Address' should be 6 
bytes if the Ethernet protocol is used.

## Sender Protocol Address

Sender Protocol Address field is where the sender’s protocol address 
is. For example, it is the field where the sender’s IP address is 
written for the IP protocol. The length of this area varies according to
 the protocol. The length of the 'Sender Protocol Address' should be 4 
bytes if the IP protocol is used.

## Target Hardware Address

Target Hardware is the field where the hardware address of the device
 that will receive the frame. For example, it is where the recipient's 
MAC address is written for Ethernet. The length of this area varies 
according to the protocol.

## Target Protocol Address

Target Protocol Address field is where the Protocol address of the 
device that will receive the frame. For example, it is the area where 
the IP address of the recipient for the IP protocol is written. The 
length of this area varies according to the protocol.

### Reviewing the ARP Protocol with Wireshark

There are some tools with a graphical user interface (GUI) that help reviewing network packets in detail. One of these is “**Wireshark**”. Let's see each field described above through Wireshark:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-28-edited.png)

As seen in the image above, the fields of the ARP protocol have been displayed successfully through Wireshark.

**Note:** You can access the PCAP file in this example in the “Course Files” field at the end of the course.

We have covered the basics of the ARP Protocol in this part of our 
training. Topics we have covered are what the ARP protocol is, its 
working structure, table, and header fields of the ARP Protocol. We will
 cover “**Internet Protocol (IP)**” in the next part of the training.

