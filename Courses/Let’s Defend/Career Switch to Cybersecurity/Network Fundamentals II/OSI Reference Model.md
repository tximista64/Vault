---
tags:
  - networking
  - osi-model
  - network-fundamentals
  - course/lets-defend
---

# OSI Reference Model


The OSI reference model is briefly explained in the first part of the 
network training series. In this section, the OSI reference model will 
be discussed in more detail.

### What is OSI Reference Model?

The Open Systems Interconnection (OSI) reference model was developed 
by ISO (International Organization for Standardization) to provide 
network communication between different operating systems in 1984. OSI 
reference model makes easier to understand network structures.

### Data Flow in the OSI Model

The OSI Model has a hierarchical and layered architecture. The data 
flow moves in a certain direction between the layers in the OSI model.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-12.png)

## Data Encapsulation and Decapsulation

Some header information of the layers is added to the raw data during
 the data flow in the OSI model as it is needed on the recipient's side.
 The process of adding header information for each layer next to the raw
 data coming out of the application is called “**encapsulation**”.
 The opposite of this process, which takes place on the sender's side, 
is also carried out on the recipient's side. Header information for each
 layer is included in the total data from the application layer to the 
physical layer. Therefore, on the recipient's side, in the opposite 
direction (from the physical layer to the application layer), each layer
 receives its own header information and transmits it to the upper layer
 it is responsible for. In this way, raw data is obtained and processed 
within the application.

This process is called “**decapsulation**” on the recipient’s side.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-13-1024x634.png)

### Protocol Data Unit (PDU) in OSI Model

Each layer in the OSI model has a different data set in the 
encapsulation/decapsulation process. This dataset has special names for 
some layers as you can see in the image below:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-14.png)

*(Image Source : https://commons.wikimedia.org/wiki/File:Osi-model-jb.png)*

### OSI Layers

There are a total of 7 layers in the OSI model with separate tasks. 
There is a hierarchical order between these layers and each layer serves
 the next layer.

## 1- Physical Layer

The physical layer is the one that hosts the data transmission task. 
The data is transmitted in the form of digital (as bits 0 and 1) or 
analog signals.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image.jpeg)

*(Image Source : https://www.keydence.com/blog/functions-of-the-data-network-cable/)*

Examples of physical communication channels are twisted pair cables, 
coaxial cables, fiber optic cables and wireless communication. The tasks
 of the physical layer are:

- To ensure the sent data to be received as it was sent by the sender.
- To start, maintain, and finalize the data movement by making
mechanical and electrical definitions between the source and the
destination.
- To decide whether to send the data in the digital or analog signal form.

## 2- Datalink Layer

Datalink layer is where physical addressing is carried out. “FDDI, 
SLIP, X.25, ATM, Token Ring, Frame Relay, HDLC, PPP and Ethernet” are 
some of the protocols used in the transmission of data in this layer. 
The tasks of the datalink layer are:

- To ensure the physical addressing (with ARP protocol)
- To ensure the error control (with CRC)
- To ensure the access to the physical layer and determine the destination of the data to be sent using network units
- To ensure reliable data transmission between physical connections using physical addresses (MAC addresses)

## 3- Network Layer

Network layer is where the logical addressing is carried out. This 
layer processes the data received from the previous layer and transmits 
the data to the transport layer, which is the upper layer. “**IP, IPX, ICMP, IGMP, BGP, OSPF and RIP**” are some of the protocols used in this layer. The functions of the network layer are:

- To ensure data transmission between two logical nodes.
- To implement logical addressing that defines each node.
- To define the routing mechanism that provides data transmission between computers on different networks.

## 4- Transport Layer

Transport layer is the one that is responsible for data transmission 
and transmission security. This layer is the last OSI layer for error 
checking. “**TCP, UDP and ATP**” are some of the protocols used in this layer. The tasks of the transport layer are:

- To ensure that the transmission between two nodes is at the appropriate speed for both nodes through the flow control.
- To detect corrupted data and prevent its transmission through error control.

## 5- Session Layer

Session Layer is is the one where the installation, management and 
termination of connections among computers are carried out. In addition,
 Session Layer controls the data flow in the protocols on its own layer.
 “**RPC, NetBIOS and SQL**” are some of the protocols and applications used in this layer.

## 6- Presentation Layer

Presentation Layer is the layer in which data screening is performed. “**ASCII, Binary and EBCDIC**” are some of the data display types. This layer may also be responsible for compression and encryption of the data. “**GIF, JPEG, TIFF, ASCII, HTML and MPEG**” are some of the data formats used in this layer.

## 7- Application Layer

Application Layer is the first layer in which the applications in 
front of the users are processed. The operations in the application are 
usually included in this layer. “**FTP, HTTP, TELNET and SMTP**” are some of the protocols used in this layer.

In this part of our training, we have covered the basics of OSI 
reference model and the layers included in this model that ensure the 
healthy communication of systems. We will cover “**Media Access Control (MAC) Address**” in the next part of the training.

