---
tags:
  - networking
  - icmp
  - tcp-ip
  - course/lets-defend
---

# Internet Control Message Protocol (ICMP)



### What is Internet Control Message Protocol (ICMP)?

The ICMP is the protocol that sends the errors, warnings, and control
 messages during the transmission of packets to the sender device.

### Features of the ICMP Protocol

- Works with the IP protocol.
- The ICMP messages are usually created in the following cases:
    - When the IP packets cannot reach their target.
    - When the gateway devices are too busy to transmit packets.
    - When there is a shorter way for the packets to go.
- The ICMP protocol does not make the IP protocol more secure.
- All applications using the IP protocol must support the ICMP protocol.
- Not all of the ICMP messages provide information about error
control. Some ICMP messages are used to obtain computer network tests
and network information.
- The ICMP protocol produces error messages only for the IP packets.
The ICMP protocol does not produce error messages in case of errors
related to transmission of ICMP messages.
- ICMP messages do not contain information about what to do to fix the error even though they show the error messages. This is a situation
that is determined by the computer that receives the error message.

### ICMP Applications

1. **Ping:**

Ping is an application used to find out if the device in the network 
is communicated by using ICMP messages. For example, let's apply the 
ping command on Windows:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-30.png)

As shown in the image above, ICMP Ping Request was sent with “1” 
Packet with the parameter “-n”. As we see the reply packet comes back to
 the sent packet there is a network communication with the target 
address.

**Note:** In some networks, ICMP messages are blocked 
through the firewall configurations in terms of security. Therefore, 
there will be no response to the Ping command in such a network, but the
 network communication should still be ongoing with the target device.

1. **Traceroute**

Traceroute is an application used to determine the route that the 
packets follow until they reach to their destinations. All the details 
of the roadmap that the packets follow are revealed through this 
application. For example, let's see the application on Windows:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-31.png)

As shown in the image above, the IP addresses of the network devices 
which are passed until reaching to “Google.com”have been displayed 
successfully through the “Tracert” command.

We have covered the basics of ICMP Protocol in this part of our training. We will cover “**Routing**” in the next part of the training.

