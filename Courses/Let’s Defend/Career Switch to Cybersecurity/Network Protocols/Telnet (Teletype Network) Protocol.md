---
tags:
  - networking
  - telnet
  - course/lets-defend
---

# Telnet (Teletype Network) Protocol


## **What is the Telnet Protocol?**

Telnet is the protocol that helps accessing devices via the command 
line. It is a protocol that is not widely used anymore as there are no 
authentication policies & data encryption techniques used in place 
which may be a huge security gap in the organizational network.

## **Features of the Telnet Protocol**

- It is located in the 7th layer (Application Layer) within the OSI model.
- It uses the TCP protocol at the transport layer.
- Telnet protocol usually uses TCP port 23.
- It is mostly used for management purposes.
- It is not preferred because it transmits the data traffic in an unencrypted way.

## **Making a Telnet Connection on Windows**

“**Telnet client**“ is not installed on Windows by 
default so it must be installed and activated in the system to be able 
to make connections with telnet protocol.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/7.Telnet+(Teletype+Network)+Protocol/telnet1.png)

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network+Protocols/7.Telnet+(Teletype+Network)+Protocol/telnet2.png)

As seen in the image above, the "telnet client" will become available to use when the necessary settings are activated.

To be able to establish telnet connection, we should type a command 
such as “telnet 192.168.5.100” from the command line. The IP address in 
the command is the IP address of the target device to be connected.

We have covered the Telnet protocol and its features in this part of the training.

