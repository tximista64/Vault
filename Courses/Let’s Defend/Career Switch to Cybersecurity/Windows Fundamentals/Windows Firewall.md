---
tags:
  - windows
  - windows-firewall
  - course/lets-defend
---

# Windows Firewall


**What is Windows Firewall?**

Windows Firewall is a security tool that allows blocking or allowing 
incoming network packets to the host machine and outgoing network 
packets from the host machine within the framework of certain rules. 
This will easily block the malicious connections with rules created on 
the Windows firewall. At the same time, destinations that are verified 
as secure connections can be added to the allowed network connections 
through new rules.

Windows firewall is one of the most basic protection methods used to 
prevent attackers from accessing the system. Windows firewall offers an 
effective defense against threats that may be coming from outside of our
 network with the rules added to it. Because attackers know the Windows 
firewall's ability to block network connections, they often focus on 
disabling the firewall or try to add their own rules among the firewall 
rules to bypass the firewall and achieve command and control server 
communication. They continue the attack by sending commands to the 
target system from the command and control servers. Attackers often use 
this method to ensure persistence in the system. While detecting 
threats, SOC analysts should monitor the firewall rules closely to 
detect whether any new firewall rules have been added as a result of an 
attack. They should also make sure that the firewall is not disabled.

**What is Firewall Rule?Firewall Rule:** A rule in Windows Defender Firewall that
 contains a set of conditions used to determine whether a network packet
 is allowed to pass through the firewall.

(Source: microsoft.com)

**Inbound And Outbound Rules**

An inbound rule filters traffic that passes from a network to a local 
computer based on the rules’ parameters. For outbound rules, traffic 
sent from local computers to the network should be filtered according to
 the filtering rules.

(Source: nstec.com)

**Firewall Rules Management with the Graphical User Interface (GUI)**

Windows firewall application can be used to manage Windows firewall 
rules. Rule management can be done easily via the graphical user 
interface. For example, let's open the Windows firewall application:

When the Windows firewall is opened for the first time, a window like 
the one above appears. We can see the inbound and outbound rules 
separately from the left-hand menu in this window:

As seen in the screenshot above, the details about the rules written to 
manage the inbound traffic have been displayed successfully.

As seen in the screenshot above, the details about the rules written to 
manage the outgoing traffic have been displayed successfully.

**Creating a new firewall rule**

Creating a new rule on the Windows Firewall application is quite easy. 
For this, the “New Rule” option in the right-hand section of the 
application is used. For example, let's add a rule that blocks all 
incoming packets on port "TCP 4444" as an inbound traffic rule. First of
 all, you should go to the "Inbound Rules" section from the menu on the 
left, then apply the steps in order with the "New Rule" button:

After clicking on the “New Rule” option, the necessary configuration is done respectively.

In this section, the type of rule should be defined as "Port".

 

In this section, let's mark the "TCP" option and write the port information as "4444".

This section continues by selecting the "Block the connection" option.

In this section, we need to verify the profiles to which the rule will be applied. Let's continue with all selected.

In this section, the name of the rule must be entered, let's name the rule as "TCP Port 4444 Block" and continue.

As seen in the screenshot above, the firewall rule has been added 
successfully. The rule is enabled when it was created and it may be 
disabled from the lower right section of the application window if 
needed.

**Firewall Rules Management with Command Line**

Management of Windows firewall rules can also be done via the command 
line. For this, the "netsh" command is used. For example, let's list all
 firewall rules with the command "netsh advfirewall firewall show rule 
name=all":

As can be seen in the image above, the details of all Windows firewall 
rules have been successfully printed on the screen. The firewall rule 
that we have added before appears at the very beginning.

**Note:** Since the output of the command is long, only the first part is visible in the image.

**Displaying the information of the firewall rule**

In order to limit the output when the command outputs are long, commands
 that produce shorter outputs can be applied in the operations performed
 via the command line. For example, instead of printing all the rules on
 the screen in the previous example, it is possible to see only the 
information of the named rule. The command to be applied for this is as 
follows: “netsh advfirewall firewall show rule name=”TCP Port 4444 
Block””

Let's see the information about the Windows firewall rule we created earlier by applying this command:

As seen in the image above, information about the firewall rule has been successfully printed on the screen.

**Deleting a firewall rule**

It is possible to delete the firewall rule via the command line. For 
example, let's delete the rule we created from the graphical interface 
via the command line with the command "netsh advfirewall firewall delete
 rule name="TCP Port 4444 Block":

As seen in the image above, the firewall rule has been successfully deleted.

Note: When deleting the firewall rule on the command line, the command 
line must be run with administrator rights, otherwise the command will 
not work.

Many different changes can be applied to firewall rules via the command 
line. For example, disable/enable the firewall rule, add a new firewall 
rule, or list only inbound/outbound firewall rules. For these 
operations, the parameters applied in the command must be changed. The 
address below can be used to get more detailed information about the 
"netsh" command and its usage.

**Netsh Command:**  https://ss64.com/nt/netsh.html

In this part of the training, what Windows firewall is, its structure, 
firewall rules management via graphical interface, Windows firewall 
rules management via command line and its importance in terms of 
security are mentioned. In the next part of the training, the subject of
 “Event Logs” is explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw8.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw9.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw10.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw11.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw12.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw13.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw14.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/fw15.png)

