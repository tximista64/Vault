---
tags:
  - networking
  - vlan
  - course/lets-defend
---

# Virtual Local Area Network (VLAN)


### What is VLAN?

VLAN is a part of the network structure that provides logical 
grouping of devices in the network, regardless of the physical state of 
the devices in the network. With VLAN, each department within the 
organization can be separated into a separate subnet, and in this way, 
the devices of each department are located in a different network. For 
example, we can think of each VLAN in the image below as a separate 
department:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-9.png)

Network segmentation through VLANs can be implemented in many 
different ways. For example, as you can see in the image above, network 
segmentation can be implemented by using many switches in large 
companies. In organizations with fewer devices and departments, network 
segmentation can be done by configuring VLANs with a single switch as 
follows:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/Untitled-min-1.gif)

(Image Source : https://www.youtube.com/watch?v=jC6MJTh9fRE)

- (Image Source : https://www.youtube.com/watch?v=jC6MJTh9fRE)

### Features of VLANs

- Since each VLAN is a separate broadcast domain, it contributes positively to network performance.
- Because VLANs provide network segmentation, it brings an additional layer to network security.
- It helps the creation of a flexible and modular network structure.
- Besides the advantages it brings to the network, it is also easy to configure.
- It can reduce network traffic and prevent congestion.
- As it can be configured with only one single switch, there is also support for configuration with multiple switches.
- It saves costs as it does not require additional hardware.
- It simplifies the management of physical devices.
- If the VLAN configurations are not done correctly on the switch, the network may become vulnerable to some attacks (VLAN hopping attacks).

We have covered what VLAN is and its features in this part of our training. We will cover “**Virtual Private Network (VPN)**” in the next part.

