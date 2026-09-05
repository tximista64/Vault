---
tags:
  - networking
  - network-fundamentals
  - course/lets-defend
---

# Basic Concepts


### Unicast

“**Unicast**” is transmitting network packets to a 
single destination in the network. If a single system transmits network 
packets to a single destination it is called Unicast.

**Note:** Each colored circle in the image below represents a device in the network.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image.png)

### Multicast

“**Multicast**” is the transmission of network packets to multiple destinations within the same network.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-1.png)

### Broadcast

“**Broadcast**”, is when a device in the network transmits network packets to all devices in the network.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-2.png)

### Broadcast Domain

“**Broadcast domain**”, refers to each separate network,
 usually separated by routers. Broadcast domains refer to the areas that
 broadcast messages can reach. Switches can also be used with some 
configurations (VLANs) to specify broadcast domains.

**Note:** VLAN will be covered later in the training.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-3.png)

The image above shows a topology of two separate networks connected 
to two interfaces of a router. Each interface of the router constitutes 
the entire broadcast domain. The router above has two interfaces, so 
there are two different broadcast domains.

### Collision Domain

“**Collision domain**”, are usually much smaller domains
 than broadcast domains. Collision domains are areas that can cause 
collisions between packets using the same data path. For example, since 
packets coming from one port of the hub are sent to all other ports, all
 ports of the hub device as a whole form a collision domain. On the 
other hand the switches are a little different. Since the switches 
transmits target-oriented packets each port of the switches creates a 
separate collision domain.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-4.png)

Each green area in the image above represents a separate collision domain.

### Subnet Mask

**What is Subnet Mask?**

Subnet mask is an address used to detect network addresses and to 
separate networks into subnets. While assigning IP address to every 
single device in the network subnet mask assignment should also be made 
because devices cannot find network addresses without subnet mask. If 
the network address cannot be found it is not possible to transmit 
packets. In short, communication between devices can’t be established. 
The subnet mask is 4 bytes long, just like the IPv4 address, and is 
expressed in decimal notation. For example, the following is a subnet 
mask:

**Example Subnet Mask** : 255.255.255.0

**Default Subnet Masks**

Subnet masks have a default value for each IP address class:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-5.png)

The table above shows the default subnet masks for each IP address 
class. Another representation of subnet masks is the "prefix" 
representation. In prefix notation, the number of “1” bits in the subnet
 mask is specified. These “1” bits are in left-to-right order. In prefix
 notation, the number of bits is written with the “/” sign. For example,
 the binary representation of the “/8” subnet mask is as follows:

**/8** = 11111111.00000000.00000000.00000000

In this example, the 8 bits from the left of the 32 bits representing
 the subnet mask shows the "1" bit, and all the remaining bits shows the
 "0" bit.

All subnet masks and prefix representations are shown in the table below:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-6.png)

**Bitwise AND Operation**

AND is one of the operations performed on the bits. The results of AND operations on the bits are shown in the table below:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-7.png)

**Finding the Network Address**

Bitwise AND operation is used to determine the network address with 
the subnet mask. The IP address and the subnet mask are ANDed. The 
result obtained gives the network address. For example, let's perform an
 AND operation on an IP address and subnet mask as follows:

**IP Address (Decimal)** : 192.168.3.100

**IP Address (Binary)** : 11000000.10101000.00000011.01100100

**Subnet Mask (Decimal)** : 255.255.255.0

**Subnet Mask (Binary)** : 11111111.11111111.11111111.00000000

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-8-1024x443.png)

As seen in the image above, each bit of 32 bits belonging to the IP 
address and subnet mask was sequentially ANDed and the network address 
was obtained as "192.168.3.0".

We have covered the basic concepts of the network as well as the 
subnet mask topics. We have learned how the subnet mask and network 
address are calculated. We will cover “**Virtual Local Area Network (VLAN)**” in the next part of the training.

**Lab Environment**

