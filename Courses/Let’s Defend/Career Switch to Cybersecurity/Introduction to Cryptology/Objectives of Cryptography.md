---
tags:
  - cryptography
  - information-security
  - course/lets-defend
---

# Objectives of Cryptography


Cryptography serves some purposes, as in every branch of science. Cryptography has 
tasks to meet the needs that arise over time. 4 principles, which are 
among the principles of information security, are also valid for 
cryptography:
ConfidentialityIntegrityAuthenticationNon-repudiation
**Confidentiality**

Data/information sent over communication devices should not be 
understood by unauthorized people. Malicious people should not be able 
to make sense of the data, even if they obtain information that should 
remain between the parties. When the attacker listens to the network 
traffic, encrypted data should appear and this data should be 
cryptographically undecryptable. If encrypted data is somehow decrypted,
 the crypto algorithm used will cease to be reliable. Therefore, the 
developers of the crypto algorithm should design strong crypto 
algorithms considering this situation. This is the "Confidentiality" 
principle in information security principles. While designing 
cryptographic algorithms, it is necessary to design a crypto algorithm 
in line with this principle.

**Integrity**

The attacker can attack the MiTM (Man in the Middle) attack by entering 
between two communication devices and taking over the traffic in 
between. In this case, the data reached by the attacker can be changed 
by the attacker and sent to the target. Apart from preventing this 
attack, which is possible in theory and in practice, it is necessary to 
verify that the integrity of the sent data is intact on the other side. 
In this way, data transmission security is ensured by cryptography. The 
“Integrity” principle, one of the information security principles, tells
 us that in such a case we have to verify that the data is not 
cryptographically compromised. While designing algorithms in 
cryptography, algorithm design should be done by considering data 
integrity.

**Non-repudiation**

Another principle to consider when creating cryptographic algorithms is 
the "Non-repudiation" principle. This principle is responsible for 
ensuring that the sender is not in a position to deny that he has sent 
the information. Evidence that the sending party is sending the 
information must be found in the communication algorithm itself. When 
these principle requirements are not included in the algorithm, it is 
not revealed that fake people act/do not act on their behalf instead of 
real people. For example, if there is an insider threat in an 
institution and the suspect denies that he has done malicious activity, 
the crypto algorithm should have the technical infrastructure to reveal 
the truth. Otherwise, it will be difficult to identify the person 
performing the operation. 

**Authentication**

The parties that will establish the communication must verify that each 
other is the right person. It is very difficult to be sure that the 
party receiving the message is the party the sender wants to communicate
 with. Therefore, cryptography needs to establish a validation mechanism
 to prevent the occurrence of fake parties that technically and 
mathematically replace these two parties. The authentication mechanism 
is one of the most basic security requirements and its use is very 
common. For example, when logging in to social media applications or the
 banking system, whether you are the right person is verified with your 
username and password information. In addition, more advanced security 
measures can be taken. For example, “Two-Factor Authentication(2FA)” is 
one of these security features. With 2FA, one more step of verification 
is done by using SMS or an authenticator application, and security is 
increased. It is the "Authentication" principle that provides this for 
Cryptography.

In this part of the training, it was explained that an algorithm created
 in cryptography should be created based on 4 principles. In the next 
part of the training, the topic of “Random Number Generators” will be 
explained.

- Confidentiality
- Integrity
- Authentication
- Non-repudiation

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/obj1.png)

