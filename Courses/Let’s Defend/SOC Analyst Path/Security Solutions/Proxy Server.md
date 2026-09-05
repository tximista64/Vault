---
tags:
  - proxy
  - soc
  - course/lets-defend
---

# Proxy Server


## **What is Proxy Server?**

A proxy Server is hardware or software used for many different purposes and acts as a gateway between client and server.

## **Types of Proxy Servers**

There are many types of Proxy Servers:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image-17.png)

### **Forward Proxy Server**

Forward Proxy Server is the most widely used proxy server type. It is
 used to direct requests from a private network to the internet with a 
firewall.

### **Transparent Proxy Server**

A transparent Proxy Server is a proxy server that directs requests 
and responses to the target without making changes to incoming/outgoing 
requests and responses.

### **Anonymous Proxy Server**

Anonymous Proxy Server is a proxy server that enables anonymous browsing on the internet.

### **High Anonymity Proxy Server**

A high Anonymity Proxy Server is a proxy server that makes it 
difficult to track the client with higher confidentiality without 
sending the proxy server type and client IP address information in the 
request.

### **Distorting Proxy Server**

A distorting Proxy Server is a proxy server that tries to hide its 
identity by defining itself as the proxy server of a website. By 
changing the real IP address, the confidentiality of the client is tried
 to be ensured.

### **Data Center Proxy Server**

Data Center Proxy Server is a special proxy server that is used as a 
proxy server that is not connected to the ISP (Internet Service 
Provider) by getting service over data centers. It is a proxy server 
that is insufficient to provide anonymity. It has a quick response 
feature.

### **Residential Proxy Server**

A residential Proxy Server is a proxy server that passes all requests
 made by the client. Thanks to this proxy server, unwanted and 
suspicious advertisements can be blocked. It is more secure than other 
proxy servers.

### **Public Proxy Server**

A public Proxy Server is a free proxy server available to everyone. 
It is ideal for those looking for a cost-free proxy server by 
sacrificing security and speed. It's insecure because it's accessible to
 everyone, and it's also slow.

### **Shared Proxy Server**

A shared Proxy Server is a proxy server that can be used by more than
 one person at the same time. It is preferred for fast connection and 
cost-free use. The disadvantage of this proxy server is that it is used 
by many people at the same time, so the activity of any user can affect 
another. For example, after the activity of one of the users, the IP 
address of this proxy server may be blocked by a server. In this case, 
access to the blocking server cannot be provided by all persons using 
the proxy server.

### **SSL Proxy Server**

SSL Proxy Server is a proxy server in which the communication between
 client and server is provided in a bidirectional encrypted manner. It 
can be said to be safe because it provides encrypted communication 
against threats.

### **Rotating Proxy Server**

A rotating Proxy Server is a proxy server where a separate IP address is assigned to each client.

### **Reverse Proxy Server**

A reverse Proxy Server is a proxy server that validates and processes
 transactions so that the client does not communicate directly. The most
 popular reverse proxy servers are "Varnish" and "Squid".

### **Split Proxy Server**

A split Proxy Server is a proxy server that runs as two programs installed on two different computers.

### **Non-Transparent Proxy Server**

A non-Transparent Proxy Server is a proxy server that works by 
sending all requests to the firewall. Clients using this proxy server 
are aware that requests are sent over the firewall.

### **Hostile Proxy Server**

A hostile Proxy Server is a proxy server used to eavesdrop on traffic between client and target on the web.

### **Intercepting Proxy Server**

Intercepting Proxy Server is a proxy server that allows using proxy server features and gateway features together.

### **Forced Proxy Server**

A forced Proxy Server is a proxy server where blocking and allowing policies are applied together.

### **Caching Proxy Server**

Caching Proxy Server is a proxy server that has a caching mechanism 
on it and returns a response in accordance with this caching mechanism 
in response to the requests sent by the clients.

### **Web Proxy Server**

A web Proxy Server is a proxy server that works on web traffic.

### **Socks Proxy Server**

A socks Proxy Server is a proxy server that prevents external network components from obtaining information about the client.

### **HTTP Proxy Server**

HTTP Proxy Server is a proxy server with caching mechanism for HTTP protocol.

## **Benefits of Proxy Server**

- Private browsing
- Increases user security.
- Allows the client's IP address to be hidden.
- It allows to manage network traffic.
- Together with the caching mechanism, it saves bandwidth.
- It can provide access to places with access restrictions.

## **How Does a Proxy Work?**

Since the proxy server is a network component that is responsible for
 forwarding the requests from the client to the target address, it 
functions by taking place between the two communicating parties. 
Basically, how the proxy server works is shown below.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image-18.png)

As seen in the image above, the requests sent by the client must pass
 through the proxy server before going to the destination. In this way, 
it is ensured that all requests sent by the client pass through the 
proxy server, which is an intermediary network component. Proxy server 
directs incoming requests to the target in accordance with its intended 
use.

The proxy server keeps some log records of its transactions. If 
necessary, some details about network communication can be seen by 
looking at these log records. The log activity on the proxy server is 
roughly as follows:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Security+Solutions/image3.gif)

(Image Source: [https://www.youtube.com/watch?v=5cPIukqXe5w](https://www.youtube.com/watch?v=5cPIukqXe5w))

## **The Importance of Proxy Servers for Security**

Proxy Server can take on important tasks at some points, although it 
varies according to the purpose of use. For example, since the IP 
address field in the request sent by the client is changed with the IP 
address belonging to the proxy server on the proxy server, the IP 
address of the proxy server appears in the destination instead of the IP
 address of the client. In this case, the IP address of the client is 
hidden and security is provided.

As SOC Analysts, we need to pay attention to the traffic coming from 
the Proxy while analyzing the servers. Because the source IP address we 
see does not belong directly to the person concerned, it belongs to the 
proxy server. What we need to do is to find the real source IP making 
the request to the proxy server and continue the analysis with these 
findings.

Another issue is that only some types of proxy servers support 
encrypted traffic. In terms of security, it is very important to 
transmit the traffic as encrypted. It can be said that proxy servers 
with this feature are more secure.

Some popular Proxy Server products used in the cyber security industry are as follows:

- Smartproxy
- Bright Data
- SOAX
- Oxylabs

In this part of the training, what Proxy Server is, its types, 
benefits, working logic, and importance for security were discussed. In 
the next part of the training, the subject of **“Email Security Solutions”** will be explained.

