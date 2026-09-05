---
tags:
  - networking
  - osi-model
  - network-fundamentals
  - course/lets-defend
---

# OSI Reference Model


This part of the training is briefly described. The details of the OSI 
reference model are in the second part of the training series.

**What is the OSI Reference Model?**

The Open Systems Interconnection (OSI) reference model was developed by 
ISO (International Organization of Standardization) in 1978. The OSI 
model is a model created to enable communication between different 
operating systems. With this model, it has become easier to understand 
network structures. It is a reference quality and has a layered 
architecture. Each layer in the OSI model has separate tasks. There is a
 hierarchical order between these layers and each layer serves the next 
layer. The number of layers in the OSI model is 7.

Data transmission is carried out through these layers and the data is 
transmitted to the user. Each layer in the OSI model is explained under 
the following topics.

**1.Physical Layer**

The physical layer is the first layer in the OSI model. In this layer, 
data is transmitted in bits along the communication channels. Since the 
physical layer is only responsible for the transmission of data, it does
 not have any information about the type of data it transmits and what 
it is. The data for this layer consists of ordered bit sequences.

**2.Datalink Layer**

The datalink layer is the 2nd layer in the OSI model. This layer 
processes the bits from the physical layer and prepares them to be sent 
to the next layer. The basic operation in this layer is physical 
addressing. The first layer responsible for error checking in the OSI 
reference model is the "Datalink Layer".

**3.Network Layer**

The network layer is the 3rd layer in the OSI model. The network layer 
is responsible for delivering the data to the destination logical 
address (IP Address). The basic operation in this layer is logical 
addressing.

**4.Transport Layer**

The transport layer is the 4th layer in the OSI model. The transport 
layer is responsible for transmission security. This layer provides many
 additional controls for error-free transmission of data and thanks to 
these controls, data transmission is successfully performed.

**5.Session Layer**

The session layer is the 5th layer in the OSI model. The session layer 
is responsible for providing the necessary services for the presentation
 layer to work. The main operation in this layer is session management.

**6.Presentation Layer**

The presentation layer is the 6th layer in the OSI model. The 
presentation layer is the layer where data is displayed. Two 
communicating nodes must use a common language for data representation. 
Thanks to this layer, the agreement is made in the language used.

**7.Application Layer**

The Application layer is the 7th and final layer in the OSI model. The 
application layer is the layer closest to the user and provides access 
to structures found in the user-level OSI model. 

In this part of the training, what the OSI model is, its structure, and 
layers are discussed. In the next part of the training, “Network 
Devices” will be explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/osi1.png)

