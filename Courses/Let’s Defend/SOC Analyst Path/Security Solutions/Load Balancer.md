---
tags:
  - load-balancer
  - soc
  - course/lets-defend
---

# Load Balancer


## **What is a Load Balancer?**

Attention le load balancer agit comme un reverse proxy tout en utilisant des algorythme pour équilibrer la charge réseaux entre les serveurs

Load Balancer is a hardware or software used to distribute the 
traffic to the servers in a balanced way and is placed in front of the 
servers.

## **Benefits of Load Balancer**

Load Balancer is an important tool for the IT sector with many 
advantages. The benefits of the load balancer device, which plays a 
critical role in the distribution of network traffic, are shown below:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image-16.png)

## **Logic Behind How Load Balancer Operates**

The load balancer detects the most suitable target using some 
important mathematical algorithms while performing the load-balancing 
process and directs the network packets to the appropriate target. In 
this way, the overloading of a server behind the load balancer is 
prevented. For example, the possible traffic flow when no load balancer 
is used is as follows:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image-15-1024x524.png)

(Image Source: [https://www.cloudflare.com/learning/performance/what-is-load-balancing/](https://www.cloudflare.com/learning/performance/what-is-load-balancing/))

As can be seen in the image above, as an undesirable situation, 
“server1” has become overloaded and cannot process packets. This 
situation causes a delay that the user or the client device using the 
server does not want. To prevent this situation, a load balancer should 
be used. For example, the following image shows the possible traffic 
flow when the load balancer device is used:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image-14-1024x495.png)

(Image Source: [https://www.cloudflare.com/learning/performance/what-is-load-balancing/](https://www.cloudflare.com/learning/performance/what-is-load-balancing/))

As seen in the image above, the resources of the system and servers 
are used much more effectively with balanced load distribution, 
preventing delays and loss of access.

## **The Importance of Load Balancer for Security**

The load balancer is a very important component of an organization 
due to its duty. Continuing the services of the organization 
uninterrupted can be very critical for the organization. Therefore, for 
access security, load balancer devices/software should be placed in the 
necessary parts and correctly configured and monitored. Otherwise, the 
services of the organization may be interrupted, causing the 
organization to experience a loss of prestige or financial loss. For 
example, if we consider that DoS/DDoS attacks are aimed at preventing 
the services of the organization, we can more easily understand the 
importance of load balancers in this sense.

**DoS (Denial of Service):** It is called attacking to 
render the service inoperable by sending more network traffic than the 
target system can handle. In short, it can be said to cause disruption 
of the service provided by consuming resources towards the target.

Some popular Load Balancer products used in the cyber security industry are as follows:

- Nginx
- F5
- HAProxy
- Citrix
- Azure Traffic Manager
- AWS

In this part of the training, what a Load Balancer is, its benefits, 
its working logic, and its importance for security were discussed. In 
the next part of the training, the **“Proxy Server”** will be explained.

