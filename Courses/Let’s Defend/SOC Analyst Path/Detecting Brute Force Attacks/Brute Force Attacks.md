---
tags:
  - brute-force
  - password-cracking
  - network-security
  - course/lets-defend
---

# Brute Force Attacks


Brute force attack is the name given to the activity performed to find any 
username, password or directory on the web page or an encryption key by 
trial and error method.

src: https://www.hackingarticles.in/password-crackingms-sql/

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-1.png)

The duration of the attack will vary according to the length of the 
sensitive data sought. If attempts are being made for a simple password 
or a username, this may take a short time or it may take years for 
complex expressions.

We can basically explain brute-force attacks into two categories.

## **1.1. Online Brute force attacks**

In online brute force attacks, the attacker and the victim are online
 at the same time and contact each other depending on the situation. It 
is also possible to categorize these attacks as Active and Passive.

### **1.1.1. Passive Online Brute Force Attacks**

In passive online brute force attacks, the attacker and the victim 
are on the same network, but do not have direct contact with each other.
 Usually, the attacker tries to obtain the password in passive ways 
without establishing a one-to-one connection with the victim machine. We
 can give the following examples of this type of attack.

**Man in the Middle:** In this attack style, traffic 
related to the environment and the target machine is listened to and the
 password etc. is attempted to be captured.

**Sniffing:** Sniffing style attacks are effective if 
there is a connection on the same network and a network tool such as a 
hub is used in the system because the hub sends a package to all the 
ports the whole LAN can see this package. If tools such as switches are 
used, then these tools will filter what is to be sent to the target 
system, and sniffing is not effective here.

### **1.1.2. Active Online Brute Force Attacks**

In active online brute force attacks, the attacker communicates 
directly with the victim machine and makes the necessary trials to the 
relevant service on the victim machine. For example, user/password 
attempts made to a web server, email server, SSH service, RDP service or
 a database service can be given as an example for this title.

This is a very advantageous method for simple passwords, but it 
usually doesn't work for strong passwords in the short term. It may 
cause situations such as account lockout and disabling the target 
system.

## **1.2. Offline Brute force attacks**

Offline brute-force attacks are used for previously captured 
encrypted or hashed data. In this type of attack, the attacker does not 
need to establish an active connection directly with the victim machine.
 Attacker can perform an offline attack on the password file that he/she
 somehow gained access to. The password information to be attacked can 
be obtained in different ways. For example;

- By capturing packets on wireless networks
- Capturing a package with a mitm attack
- Dumping hashes from db with a SQLi weakness
- SAM or NTDS.dit database on Windows systems

Usually, these attacks are carried out in 3 different ways.

### **1.2.1. Dictionary Attacks**

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image.png)

This is a problem caused by the use of a common password. This is an 
attack method that usually occurs as a result of more than one person 
using the same password accidentally. First, the attacker creates a 
dictionary for himself/herself from the passwords he/she will try. 
He/she can find a prepared dictionary on the internet or create it as 
he/she wishes. Then, each word in this dictionary is tested on the 
target system as a password.

### **1.2.2. Brute Force Attacks**

Brute force attacks are a method performed by trying all 
possibilities in a certain range one by one. For example, if the 
password we are looking for consists of up to 5 characters, the attacker
 tries all the possibilities one by one, including 1 digit, 2 digits, 3 
digits, 4 digits and 5 digits (including uppercase and lowercase 
letters, digits and special characters). If an attack is made to find a 
complex password, the attack time may be quite long depending on the 
condition of the hardware used.

### **1.2.3. Rainbow Table Attacks**

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-1024x576.jpeg)

We should keep in mind that all password possibilities in a certain 
range are calculated with the relevant function in a rainbow attack. For
 example, we should calculate the MD5 values of all possible passwords 
up to 4 digits in advance.

In this attack type, the attacker quickly compares the pre-calculated
 hash file with the password summary he/she wants to crack and obtains 
the password if there is a  match. The biggest problem here is to 
calculate these hashes or to somehow get access to the calculated form. 
For example, high processing power and disk space is needed to create a 
rainbow table for a password containing all possibilities up to 8 
digits.

