---
tags:
  - linux
  - linux-fundamentals
  - networking
  - course/lets-defend
---

# Network Management


**What is “Network” and Why is it Important?**

The network is the path to the target systems for the attackers. This 
path is divided into 2 parts: the path inside the organization and the 
interface facing outside of the organization. The network connections of
 the devices facing the external interface of the organization and the 
network connections of the devices within the organization are critical 
for attack detection and prevention. Network devices or servers can host
 Linux-based operating systems in-house. Therefore, just as it is 
essential to know network management in other operating systems, it is 
also essential to know network management for Linux. Because each device
 in the organization has a task and in order to perform this task, it 
must be in communication with many devices, especially the devices in 
the network where it is located.

This part of the training covers the basics of network management for Linux.

**To Have Knowledge About the Network Interfaces in the System**

On Linux, it is possible to see which network interfaces are active and 
which IP address they are using from the command line. For this, the 
"ifconfig" command is used. For example, let's see the information by 
executing the command:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network1.png)

As seen in the screenshot above, the "ifconfig" command was run by 
giving the "-a" parameter, and the information about the network 
interfaces was displayed successfully. The “-a”(all) parameter is used 
to get detailed information and to see all interfaces. It is clear that 
there are 3 network interfaces named “docker0”, “ens33”, and “lo” 
interfaces and they all are active interfaces as we see the “UP” 
expression next to each interface.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network2.png)

To access the interfaces, they must have their own addresses. These 
addresses are IP addresses. As seen in the image above, all 3 interfaces
 have their own assigned IP addresses.

You can use this interactive shell for practice:

**Assigning Dynamic IP Addresses to Network Interfaces**

Generally, when the system is connected to the network, an IP address is
 automatically assigned to the network interfaces by the network. It is 
the "DHCP (Dynamic Host Configuration Protocol)" protocol that provides 
this automatic process. One or more network devices act as DHCP servers 
in the current network. The DHCP server is responsible for assigning IP 
addresses to all devices in the network. The command that enables 
obtaining an IP address from the DHCP server on Linux is the "dhclient" 
command. For example, let's say we have a network interface named 
“ens33” as in the screenshot below. As you can see, this interface does 
not have an IP address.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network3.png)

Let's assign an IP address to the "ens33" interface with the "dhclient" command:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network4.png)

As seen in the image above, the name of the interface to which the IP 
address is to be assigned is given as a parameter to the "dhclient" 
command. When this command is executed, the DHCP server in the network 
is contacted and one of the idle IP addresses in the IP address pool is 
assigned.

**Disabling Network Interfaces**

A device can have more than one network interface. The need to use one 
or more of these network interfaces may have disappeared over time. 
These network interfaces may be active even when not in use. Network 
interfaces that are forgotten on the device in this way cause the attack
 surface to expand and get targeted by the attackers. Therefore, these 
interfaces should be disabled which mitigates the risk of attacks. On 
Linux, it is possible to disable network interfaces from the command 
line. For example, let's disable the interface named "ens33":

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network5.png)

As seen in the screenshot above, the "ens33" interface has been 
successfully disabled with the "ifconfig" command. After the "ifconfig" 
command, we type name of the interface that we are trying to disable 
following with the "down" expression. This simple command is how we 
disable an active interface in the Linux environment. We had a “UP” 
expression when the interface was active but now, we don’t see the “UP” 
expression so we know that the interface is now disabled and not active 
anymore.

**Enabling Network Interfaces**

Enabling a disabled network interface can also be done on the Linux 
command line. For example, let's enable the "ens33" interface, which was
 disabled in the example above:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network6.png)

As seen in the image above, the interface was enabled by typing "up" 
instead of "down" in the last parameter of the command applied in the 
previous example.

**Assigning a Static IP Address to the Network Interface**

Some applications may use fixed IP addresses when reaching certain 
devices. In such cases, it is the static IP address assignment process 
that provides a fixed IP address. It is possible to assign fixed IP 
addresses to interfaces in the Linux command line. For example, let's 
statically assign an IP address to the "ens33" interface:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network7.png)

Before assigning an IP address statically, the interface must be 
disabled. Then, the name of the interface to which the IP address is to 
be assigned is written as the first parameter to the ifconfig command 
along with the IP address to be assigned as a second parameter. After 
executing the command, the disabled interface is enabled and the static 
IP address assignment is successfully performed. As seen in the image 
above, a different IP address is statically assigned to the interface.

**Viewing the Network Connections**

In Linux, it is possible to view the current network connections and 
their status via the command line using the "netstat" command. Let's 
display the current TCP connections with the "netstat" command:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network8.png)

As seen in the screenshot above, we are able to see all the existing TCP connections successfully using the "netstat" command.

- The “-a”(all) parameter is the parameter used to show all the connections.
- The "-t" parameter is used to show only TCP connections.
- The “-n” parameter is used to show addresses numerically without resolving domain names.
- The “-p” parameter is used to show the program name and PID number of the connection.

This helps us detect any suspicious traffic to any unknown or suspicious IP address during the analysis of Linux hosts.

**Viewing the Packet Flow Instantly**

It is possible to instantly monitor incoming and outgoing network 
packets from the command line on Linux. One of the tools that can be 
used for this is the "tcpdump" tool. Let's take a look at the "ens33" 
network interface and watch its packet flow instantly:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network9.png)

As seen in the image above, the "tcpdump" tool was used with the "-i" interface parameter.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network10.png)

And we have successfully produced the tcpdump output with the details of a package in each line.

**Access Control to the Destination IP Address**

We may need to check the network communication of a system using another
 system within the same network. It is possible to find out whether the 
other system is accessible using the "ping" command in the Linux command
 line. With the "ping" command, network packet(s) are sent to the 
destination and awaited a response. In this way, it can be tested 
whether there is network communication with the destination address.

Note: In some cases, as a security measure, the target system may be 
configured not to respond to the "ping" command to prevent attackers 
from doing network and host discovery.

Let's test whether there is an internet connection with the "ping" command:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network11.png)

Any address on the internet can be used to check the internet 
connection. As seen in the image above, 1 package was sent to 
"letsdefend.io" and a successful response was received. In this case, we
 can say that the target network is accessible. The number of packets to
 be sent can be given to the "ping" command with the "-c" parameter.

**Resolving the DNS Server IP Address of the Domain to be Accessed**

In the IT world, devices communicate with each other through numerical 
values. Therefore, values ​​that do not correspond to numerical values 
​​need to find their numerical equivalents. For example, when trying to 
access the “letsdefend.io”, the IP address of the target DNS server must
 be known or learned. It is not possible for the users to memorize all 
the IP addresses they need to access, therefore, we use the "DNS" 
(Domain Name System) protocol through DNS servers as intermediaries to 
perform the domain name and IP address resolution and report back to our
 system so we can connect to the target systems easily. There are some 
tools and commands used for this. Let's see the "dig" tool and find the 
DNS server IP address of "letsdefend.io" using it:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network12.png)

As seen in the screenshot above, the DNS Server IP addresses of the 
target have been found. The same can be done with the "nslookup" tool:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network13.png)

As seen in the image above, the DNS Server IP addresses of the target were successfully reached.

**/etc/resolv.conf File**

In the Linux operating system, the IP address of the DNS server to which
 the domain name resolution requests will be sent can be determined. 
This configuration is done in the “/etc/resolv.conf” file. For example, 
let's read the "/etc/resolv.conf" file contents:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network14.png)

As seen in the image above, the server address to which DNS requests 
will be sent is typed. DNS server address can be changed by manually 
changing the contents of this file.

Note: Changes made in the “/etc/resolv.conf” file are deleted after 
rebooting the system. If permanent changes are desired, changes should 
be made in the “/etc/systemd/resolved.conf” file.

**/etc/hosts File**

When trying to access to a domain in Linux, the IP address of the target
 must be resolved first. In this IP address resolution process, local 
records are checked first. If the IP address of the target is known and 
registered on the system, the IP address of the target is obtained 
before a request is sent to the DNS server. These records are located in
 the "/etc/hosts" file in Linux. For example, let's read the 
"/etc/hosts" file contents:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network15.png)

As seen in the image above, "localhost" and "debian" are defined in the 
host's content. If localhost is desired to be accessed, "127.0.0.1" will
 be used as the IP address. In this section, new records can be added to
 the file content in accordance with the format. For example, if the 
google.com domain is to be added to the records along with letsdefend.io
 IP address, requests made to google.com on the system will go to the 
letsdefend.io IP address instead of the google.com IP address, because 
google.com has been recorded as the letsdefend.io IP address.

**File sharing with Python HTTP Server**

If file transfer between devices within the same network is needed, file
 sharing can be opened easily by using "python" on the Linux command 
line. Let's share files with "Python HTTP Server":

                    
`python3 -m http.server`

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network16-1.png)

When sharing files with Python HTTP Server, the shared files are files 
in the current directory on the command line. It is sufficient to run 
the command in the directory under which the files are to be shared. On 
the device that will receive the file, the IP address and port of the 
device sharing the file should be entered into the browser:

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/network17-1.png)

We have successfully displayed the files in the directory where the file
 is shared are displayed by using the port information along with the IP
 address of the target device. Requests made to the HTTP server can be 
viewed under the command line run. We can see that the file named 
"testfile1" has been accessed in the previous image.

In this part of the training, commands and operations related to network
 management on the Linux command line are explained. The next part of 
the training describes package management.

