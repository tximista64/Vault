---
tags:
  - networking
  - tcp-ip
  - course/lets-defend
---

# Internet Protocol (IP)


### What is the “IP Protocol”?

Internet Protocol is the protocol that ensures the packet 
transmissions between different networks. It prepares the data to be 
sent to a top transmission layer.

### Features of the IP Protocol

- It performs the process of dividing large packets to be sent under data transmission into smaller pieces (IP Fragmentation).
- There is no flow control mechanism required for reliable transmission.
- It is the most functional structure in the OSI layers.
- The control and security mechanisms belong to the upper layers as
the packets it transmit to the upper layer can be easily imitated.
- The Internet Protocol (IP) works using logical addresses.

### IP Protocol Header

The IP Protocol includes many fields within the header. The following image shows the header and fields of the IP protocol:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-29.png)

## Version

The Version field is where the type of IP packet is defined. It shows
 whether the IP packet is IPv4 or IPv6 according to the value in this 
Field. It is “4 bit” long.

## Internet Header Length (IHL)

It is the field where the length of the IP header, which may be 
variable is shown. The smallest IP Packet Header is 20 bytes. It is “4 
bit” long.

## Types of Service

It is the field where Quality of Service (QoS) parameters are located. It is “8 bits” long.

## Total Length

Total Length field refers to IP header and the total length of the data. It is “16 bit” long.

## Identification

Identification Field shows the ID number of each IP packet. It is “16 bit” long.

## IP Flags

IP Flags is the field that indicates whether IP Fragmentation is implemented on the packet or not. It is “3 bit” long.

## Fragmentation Offset

Fragmentation Offset field indicates how many bytes is the fragmented packet is. It is “13 bit” long.

## Time to Live (TTL)

Time to Live (TTL) indicates the number of hops that the packet can 
take. The transmission of the packet from one device to another means “1
 hop” and the value in TTL in each hop is reduced by “1”. Packet, which 
reaches the “0” value, can no longer be transmitted. TTL Field is “8 
bit” long.

## Protocol

The value in the protocol field indicates the protocol in which the packet is associated in an upper layer. It is “8 bit” long.

## Header Checksum

It is the control value calculated to see whether the IP header has 
been transmitted intact. This value calculated by a specific algorithm 
is used for verification purposes. It is “16 bit” long.

## Source Address

Source Address field is where the IP address that sends the packet. It is “32 bit” long.

## Destination Address

Destination Address field is where the recipient's IP address is located. It is “32 bit” long.

## Data

Data field is the field where the total data from the lower layer is located.

In this part of the training, we have covered what the Internet 
Protocol (IP) is. We will cover the “Internet Control Message Protocol 
(ICMP)” topic in the next part of our training.

