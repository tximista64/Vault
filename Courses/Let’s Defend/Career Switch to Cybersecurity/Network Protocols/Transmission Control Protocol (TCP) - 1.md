---
tags:
  - networking
  - tcp
  - tcp-ip
  - course/lets-defend
---

# Transmission Control Protocol (TCP) - 1


## **What is Transmission Control Protocol (TCP)?**

Transmission Control Protocol (TCP) is a network protocol that 
provides reliable and steady data transmission between applications. 
According to the OSI model, it is located in the 4th layer.

## **The Features of TCP Protocol**

- Ensures the data transmission between the two applications.
- Allows multiple connections.
- There is no data transfer before the connection is established.
- Priority and security definitions can be made for the data sent.
- Makes an error control.
- Provides flow control.

## **Establishing the TCP Connection (Three-way Handshake)**

TCP connection must be established in order to transfer data through 
the TCP protocol. The establishment of the TCP connection indicates that
 the sender and the recipient are both ready for the data transfer.

The TCP connection established before the data transfer is called “**Three-Way Handshake**“. Three-Way Handshake consists of the following steps:

- The sender party who wants to establish the TCP connection sends the TCP segment set to the “**SYN**” flag to the recipient side.
- After receiving this segment, the recipient party transmits a TCP segment set to the “**SYN**” and “**ACK**” flags to the sender.
- As a final stage, the sender part of this segment sends the TCP segment set to the “**ACK**” flag back to the recipient and the connection is established.

The image below shows how the TCP connection is established between the sender and the recipient:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/2.Transmission+Control+Protocol+(TCP)+-+1/tcp1.png)

**Note**: SYN and ACK Flags are 1 bit areas within the TCP protocol Header.

## **TCP Data Flow and Transmission Reliability**

The segments sent in the TCP protocol are in the form of eight-bit 
data. The TCP protocol tracks each bit sent and received by marking it. 
It waits for a response from the recipient for each piece of data it 
sends by marking. After the reply from the recipient, the next piece of 
data is sent and in the same way, a response from the recipient is 
expected for the next piece of data sent. With this marking system, the 
TCP protocol ensures the transmission reliability and transmits the data
 in a complete and sequential manner.

The TCP protocol sets a random number during connection establishment. This number is called the “**Initial Sequence Number (ISN)**”.
 This number is used for the first data transfer on the TCP connection. 
Then, the new numbers are created by adding the number of bytes sent on 
this number. Each of these newly emerged numbers is called a "**Sequence Number**".The
 TCP protocol knows whether the segment is received by the receiver 
according to these numbers. For example, in the image below, it is set 
as “ISN=0”. After sending the segment in “1024” byte size, the segment 
confirmation was transmitted to the sender with the ACK number from the 
receiver and the sequence number value was updated. If the segment with 
ACK number 1024 did not come from the recipient, data transfer would not
 continue and the previously sent TCP segment would be sent again and 
the segment with ACK number 1024 would be expected to arrive.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/2.Transmission+Control+Protocol+(TCP)+-+1/tcp2.png)

TCP protocol is a network protocol that provides reliable 
transmission. The three-way handshake described in the previous topic is
 one of the mechanisms that ensure transmission reliability in the TCP 
protocol. The main mechanism that ensures the transmission reliability 
of the TCP protocol is based on a structure that confirms whether each 
TCP segment has been sent or not. Thanks to this systematic segment 
sending, if there is a TCP segment that cannot be sent for any reason, 
that segment is sent again and delivered to the receiving party. For 
example, the following image shows how the TCP protocol behaves in the 
case of a transmission error:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/2.Transmission+Control+Protocol+(TCP)+-+1/tcp3.png)

## **Terminating TCP Connections**

Terminating TCP connections takes place in 4 steps:

1. The party that wants to terminate the TCP connection sends the TCP segment with the “**FIN**” flag set to the target device.
2. After receiving the TCP segment, the target device sees that the "**FIN**" flag is set and sends the TCP segment with the "**ACK**" flag set in response.
3. The target device sends the TCP segment with the “**FIN**” flag set to the device that wants to terminate the connection.
4. As the last step, the device that wants to terminate the connection sends the TCP segment with the "**ACK**" flag set in response to the incoming TCP segment and the TCP connection is terminated.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/2.Transmission+Control+Protocol+(TCP)+-+1/tcp4.png)

**Note:** FIN and ACK flags are 1-bit fields in the TCP protocol header. TCP connections can also be terminated with the “**RST**” flag. TCP connection terminated using the RST flag is an immediate and one-sided connection termination. In other words, the “**RST**” flag is used to reset the connection.

## **TCP Connections**

TCP connections are frequently used by applications that transmit 
TCP-based transmission on the device. Some information about the 
protocol is used so that applications can connect with the TCP protocol.
 Each TCP connection consists of **“Source IP Address-Source Port Number”, “Destination IP Address-Destination Port Number”** information.

**What is Port?**

Ports are the communication points that applications use to 
communicate with each other. Many services can exist on a server at the 
same time. Port numbers make the incoming requests clear and tell us 
which services they belong to. The port is essentially a number which 
can take a value between “0-65535”. Some port numbers are used by some 
protocols by default. Port numbers and IP addresses form the socket 
address. For instance, the expression 
“192.168.5.100:8080”(IP_Address:Port_Number) contains two separate 
pieces of information separated by “:”

- IP Address
- Port Number

**Default TCP Ports**

Below are examples of default ports for the most well-known protocols:

- FTP : 21
- SSH : 22
- Telnet : 23
- SMTP : 25
- DNS : 53
- HTTP : 80
- POP3 : 110
- SMB : 445

You can reach further information regarding Default TCP Ports at the following link:

**Default Ports**: [https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)

In this part of the training, we have covered the basics of the TCP 
protocol, its features, how the TCP connections are established and 
terminated, as well as the TCP data flow reliability. We will continue 
covering the TCP protocol in the next chapter of our training.

