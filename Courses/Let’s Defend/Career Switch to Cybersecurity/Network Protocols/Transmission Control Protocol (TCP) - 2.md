---
tags:
  - networking
  - tcp
  - tcp-ip
  - course/lets-defend
---

# Transmission Control Protocol (TCP) - 2


## **TCP Protocol Header**

There are many protocol-specific data fields in the header of the TCP
 protocol. These data fields contain all the information required by the
 TCP protocol. The following image shows the header and fields of the 
TCP protocol:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/3.Transmission+Control+Protocol+(TCP)+-+2/tcpprotocol1.png)

Each field is briefly explained in the following headings:

**Source Port Number**

“**Source Port Number** ” is the field that the port number of the sender is included. It is “**16 bits**” long.

**Destination Port Number**

“**Destination Port Number** ” is the field that the port number of the recipient is included. It is “**16 bits**” long.

**Sequence Number**

“**Sequence Number**” field is the number used to track the transmissions of TCP segments. If the "**SYN**" flag is set in the TCP segment, this number is the "**Initial Sequence Number**" value. It is "32 bits" long.

**Acknowledgement Number**

“**Acknowledgement Number** ” field is a value that indicates up to which byte the transmission of the sent segments is made. It is "32 bits" long.

**Header Length (HLEN)**

“**Header Length**” is the field that holds the value of the TCP header length. It is “4 bits” long.

**Reserved**

It is the field reserved for future use. It is “3 bits” long.

**Control Flags**

“**Control Flags**” is the field where the values ​​of 
the flags are kept. Each flag is "1 bit" long. Setting a flag means that
 it takes the value "1" in binary. In total, this field is “9 bits” 
long.

- **SYN**: It is the flag used to initiate TCP connections.
- **ACK**: It is the confirmation flag that indicates that the packets are
transmitted. It also indicates to confirm the connection setup.
- **FIN:** It is the flag used to terminate the TCP connection in a controlled manner.
- **RST**: It is the flag used to terminate the TCP connection unilaterally and abruptly. It is used to reset the connection.
- **PSH**: It is the flag set in the packets where the data is sent to the target application.
- **URG**: It is the flag used to notify that there is urgent and priority data.

**Window Size**

“**Window Size**” field is where the maximum data size of the recipient’s buffer capacity is defined. It is “16 bits” long.

**Checksum**

“**Checksum**” is the field that controls whether the 
integrity of the TCP segment is intact during the transmission. It has 
hexadecimal value and it is “16 bits” long.

**Urgent Pointer**

The “Urgent Pointer” field is a value that indicates up to which data
 the urgent bytes are. It indicates up to which data the urgent bytes 
are. In order to use this field, the "URG" flag must be set. It is “16 
bits” long.

**Options**

“**Options**” is the field created to use various TCP protocol additional features. There is no obligation to use. It has no fixed length.

## Establishing a TCP Connection with Netcat

It is possible to establish a TCP connection between devices via the command line with the “**Netcat**”
 tool. Netcat tool is a tool that comes pre-installed on Linux systems 
and is used with the "nc" command. The following example will use two 
different Linux command lines. For example, let's set up the TCP 
connection:

**Note:** In this example, port 5555 is used, a different port number can be used optionally.

First of all, let's open the netcat tool in the “listen” mode to listen to the packets coming to the TCP 5555 port:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/3.Transmission+Control+Protocol+(TCP)+-+2/tcpprotocol2.png)

As seen in the image above, the target to which we will establish the TCP connection with the command "**sudo nc -lvp 5555**" has been successfully put into listen mode.

The meanings of the parameters applied in the command are as follows:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/3.Transmission+Control+Protocol+(TCP)+-+2/tcpprotocol3.png)

The following command is applied on the other linux command line to start the connection:

**Command** : sudo nc 192.168.216.128 5555

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/3.Transmission+Control+Protocol+(TCP)+-+2/tcpprotocol4.png)

The connection will be established successfully after you apply the 
above command unless there are network communication problems. After the
 connection is established, each typed character or word is transmitted 
to the target. For example, let's send it by typing "Hello My Friend":

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/3.Transmission+Control+Protocol+(TCP)+-+2/tcpprotocol5.png)

As seen in the image above, the message was transmitted to the target
 system and displayed on the command line as in the image below.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/3.Transmission+Control+Protocol+(TCP)+-+2/tcpprotocol6.png)

## TCP Protocol Review with Wireshark

There are some tools with a graphical user interface (GUI) that allow
 network packets to be examined in detail. One of these tools is the "**Wireshark**" tool.

You can download the Wireshark tool from the following address:

**Wireshark:** [https://www.wireshark.org/download.html](https://www.wireshark.org/download.html)

Let's see each field of the TCP protocol described above via wireshark:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/3.Transmission+Control+Protocol+(TCP)+-+2/tcpprotocol7.png)

As you see in the image above, the fields of the TCP protocol have been successfully seen over the wireshark tool.

**Note:** You can access the PCAP file in the example from the "**Course Files**" area at the end of the course.

We have covered the basics of TCP protocol header, the TCP connection
 setup with Netcat and the examination of the TCP protocol on Wireshark 
are mentioned in this part of the training. We will be covering “User 
Datagram Protocol (UDP)” in our next chapter.

