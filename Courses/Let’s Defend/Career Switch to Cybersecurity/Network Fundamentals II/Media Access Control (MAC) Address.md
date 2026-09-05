---
tags:
  - networking
  - mac-address
  - course/lets-defend
---

# Media Access Control (MAC) Address


### What is Network Interface Card?

Network Interface Card is a hardware that ensures establishing and 
maintaining the network connections and communications in computers. The
 inbound and outbound network packets in network communications are 
received/transmitted thanks to Network Interface Cards. There are many 
types of NIC hardware in various sizes and features. For example, there 
are NICs that provide Wireless communications. Wi-Fi is a feature that 
“Wireless NIC” hardware makes available. In short, network 
communications would not be possible without Network Interface Cards.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-1-1024x636.jpeg)

### What is MAC Address?

The Media Access Control (MAC) address is the physical address 
required for network communication. IP address and MAC address take part
 together to provide network communication which cannot be established 
without either of them available on a device. MAC addresses are placed 
on NICs during production. Each of the NIC hardware produced has a 
unique MAC address.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/mac-gif.gif)

*(Image Source : https://www.youtube.com/watch?v=TIiQiw7fpsU)*

The MAC address is “6 Byte” (48 bit) long and is expressed as Hexadecimal. The address below is an example of a MAC address:

**MAC Address** : 2C:54:91:88:C9:E3

The first 3 Byte of the MAC address is obtained from the relevant 
organizations specific to vendors. The last 3 bytes are determined by 
the vendor. In this way, each MAC address becomes a unique one.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-22.png)

### Vendor Detection through MAC Address

You can determine the vendor that the MAC address belongs to using 
online services. For example, let's apply it on the following address:

**MAC Vendors** : [https://macvendors.com/](https://macvendors.com/)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-21-1024x280.png)

This is how the online application looks upon accessing the site:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-20-1024x288.png)

As you can see on the image above, the vendor information for the requested MAC address displayed successfully.

Another website that can be used for this purpose is “[https://macaddress.io](https://macaddress.io/)”.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-19-1024x368.png)

This is how the online application looks upon accessing to the site. Let’s enter the MAC address:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-18-1024x496.png)

As seen in the image above, the information about the MAC address has been successfully displayed.

It is also possible to find the vendor’s information without using 
these online services, there are lists for this. For example, in the 
following page, we can query the first 3 Byte of the MAC address and 
obtain the vendor information:

**MAC Vendors List**  :  [https://gist.github.com/aallan/b4bb86db86079509e6159810ae9bd3e4](https://gist.github.com/aallan/b4bb86db86079509e6159810ae9bd3e4)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-17.png)

**Note:** Since the list is long, only the first section is shown in the image above.

Vendor information of some MAC addresses may not be found through 
online services or lists. Therefore, it is always good to check multiple
 sources instead of a single one which will increase the likelihood of 
finding vendor information of the MAC address we are looking for.

### Displaying the MAC addresses of Network Interfaces on Windows

We can utilize the “**ipconfig /all**” command over the 
command line to be able to display the MAC addresses on Windows. For 
example, let's see the MAC address by applying the command:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-16.png)

As seen in the image above, the MAC address of the Windows system has been displayed successfully.

### Displaying the MAC addresses of Network Interfaces on Linux

We can utilize the “**ifconfig**” command over the 
command line to be able to display the MAC addresses on Linux. For 
example, let's see the MAC address by applying the command:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Fundamentals+II/images/image-15.png)

As seen in the image above, the MAC address of the Linux system has been displayed successfully.

In this part of our training, we have covered what the Network 
Interface Card (NIC) and MAC addresses are and their structures, as well
 as the vendor information of MAC addresses and how to find the MAC 
address on Windows & Linux. We will cover “**Address Resolution Protocol (ARP)**” in

