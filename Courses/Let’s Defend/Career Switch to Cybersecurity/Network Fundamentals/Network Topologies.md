---
tags:
  - networking
  - network-topologies
  - course/lets-defend
---

# Network Topologies


Network
 topology is a visual map to understand the physical or logical 
structure of a computer network. The locations of the devices and cables
 in the network are among the factors that determine the network 
topology. There are many benefits to having a network topology. For 
example, it is possible to see which other device(s) in the network will
 be affected if a device on the network fails to perform its task. If we
 are looking at a network topology of a large network, it is possible to
 see the subnets in the network and the devices it is connected to.

Network topology is divided into 2 types: 
**Physical Topology**

It is a type of topology in which all devices and components in the 
network are drawn in terms of their exact locations. Looking at this 
topology, it is seen which cabling is made over which paths and devices.
 What is seen in the drawing has a physical counterpart. For example, if
 there is a network device in the path from device A to device B, this 
device is seen in the physical topology. 
**Logical Topology**

It does not show the exact location of the devices in the topology like 
physical topology. It often contains fewer elements than physical 
topology. Because data flow is important in logical topology. For 
example, data going from device A to device B may not be included in the
 topology if it passes over device C between device A and device B, and 
device C has no effect on the data that would need to be displayed on 
it. In this topology, it is the path of the data flow that is desired to
 be emphasized rather than the physical placement of the devices.

Some topologies are described in the following topics:

**Ring Topology**

It works in a closed loop logic. The sent data travels around the ring 
in one direction until it reaches the destination. Each node passes the 
incoming data over it and ensures that it reaches the target. There is 
no hierarchical relationship between nodes.

**Star Topology**

Each node in the Star topology is connected to a central node. All data 
flow is done through the central node. Star topology is one of the most 
common computer network topologies.

*(GIF Source: youtube.com)* 
**Mesh Topology**

It is a network topology where there is no central node and each node 
can be directly connected to the other. Mesh topology is not a suitable 
topology for large networks. It is divided into 2 types:

**Full-Mesh**

In the Full-Mesh topology, each node in the network is connected to all 
other nodes by cabling separately. In this topology, it is unlikely that
 the connection between two nodes will be broken. Because there are 
alternative ways of connecting.

*(GIF Source: gifer.com)* 
**Partial-Mesh**

In the Partial-Mesh topology, although each node is not directly 
connected to all other nodes, they are largely interconnected. Just like
 in Full-Mesh topology, there are alternative ways to reach the target 
node in case of disconnection.

*(GIF Source: ejlaturnas.wordpress.com)* 
**Bus Topology**

Bus topology is a topology where nodes are located on a common path and 
data transmission is made with a bidirectional connection on this path. 
In the bus topology, each node receives every transmitted data even if 
it does not belong to it. Since there is no hierarchical order among the
 nodes, there is no transmission priority.

**Point-to-Point Topology**

Point-to-point topology is the simplest topology and consists of two 
nodes connected together. For example, a passing call between two phones
 creates a point-to-point topology, or a direct connection between two 
computers creates a point-to-point topology.

**Tree Topology**

Tree topology is a hybrid network topology formed by connecting star and
 bus topology. Tree topology has a hierarchical order and each node can 
have any number of subnodes.

*(GIF Source: i.pinimg.com)* 

In this part of the training, what the network topology is, its types 
and some network topologies are discussed. In the next part of the 
training, the subject of the “OSI Reference Model” will be explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/topology1.gif)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/topologies-table-1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/topology2.gif)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/topologies-table-2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/topology3.gif)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/topology4.gif)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/topology5.gif)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/topologies-table-3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/topology6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals/images/topology7.gif)

