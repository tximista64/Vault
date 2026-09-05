---
tags:
  - ssl-tls
  - cryptography
  - networking
  - course/lets-defend
---

# SSL/TLS Protocol


**What is SSL/TLS Protocol?**

The SSL/TLS protocol is a protocol designed for secure two-party 
communication in computer networks. Generally, the use of the HTTPS 
protocol in web applications is widely known. However, SSL/TLS protocol 
is a protocol that is frequently used in e-mail, instant messaging, and 
VoIP applications. It ensures that the communication between the parties
 remains confidential. The SSL/TLS protocol has 3 main purposes:

**Encryption:** It allows to hide data from parties other than the 2 communicating parties.**Authentication:** It allows to verify that both parties that want to provide secure communication are the correct parties.**Integrity:** It ensures that the outgoing data has not been changed between the 2 parties with which secure communication is provided.

The basis of the SSL/TLS protocol is cryptographically strong crypto 
algorithms. The emergence years of SSL/TLS protocol versions are as 
follows:

“SSL (Secure Sockets Layer)” is the name of the first version of the 
protocol to provide secure communication. Later, the name of the 
protocol was changed to "TLS (Transport Layer Security)". As can be seen
 from the table above, it is noticed that there is a name change 
before/after a certain date.

The recommended version for using the SSL/TLS protocol is "TLS 1.3". 
Although this version is recommended and widely used, some web browsers 
still support the "SSL 3.0" version.

The following image shows the usage statistics of SSL/TLS versions of 
web pages as of May 2022.

Data Source: https://en.wikipedia.org/wiki/Transport_Layer_Security 

When a web page is opened via the browser, the padlock icon on the left 
of the address bar can be used to see the SSL/TLS connection 
information.

Detailed information about SSL/TLS can be seen by clicking the padlock 
icon. The SSL/TLS certificate information of the server is located in 
this section. For example, let's see the "letsdefend.io" SSL/TLS 
information:

It is possible to see information such as the validity date of the 
SSL/TLS certificate in the above window opened via the browser. In order
 to have detailed information, the "Details" tab can also be examined:

As seen in the image above, it is possible to see much information such 
as the Signature hash algorithm and public key from the "Details" tab. 
For example, “SHA256” was used as the signature hash algorithm.

The SSL/TLS protocol uses certificates. Certificates are important to 
ensure secure communication. It is actually SSL/TLS certificates that 
enable encrypted traffic to occur by using HTTPS instead of HTTP on the 
browser. SSL/TLS certificate is a data file on the server. The client 
uses the server's certificate to verify the identity of the server and 
to get the public key from the server to be used in communication with 
the server. The browser uses its own list of certificate authorities to 
verify certificates. If the certificate of the connected server does not
 belong to a trusted certificate authority, the browser considers it 
insecure and warns the user. For example, the image below shows the page
 of the chrome browser that warns the user:

**How does SSL/TLS Principle work?**

Before starting encrypted and confidential data transfer with SSL/TLS 
protocol, the two parties that will communicate must follow the steps of
 some transactions. Communication consisting of all these steps is 
called “SSL/TLS Handshake”. These steps are as follows:

1. The user sends a request to the server.
2. The server sends its public key to the user along with its own SSL/TLS certificate.
3. The user's browser checks and verifies whether the sent certificate is valid.
4. The user's browser generates a randomly generated symmetric key and 
encrypts this symmetric key with the public key sent by the server and 
sends it to the server.
5. The server decrypts the encrypted symmetric key with the private key
 and the symmetric key is sent to the server in a secure manner.
6. From this stage onwards, the server encrypts every data to be sent to the user's browser using this symmetric key.
7. Since the user has this symmetric key, he decrypts the incoming 
encrypted data with the symmetric key and displays the page securely.

Image Source: https://medium.com/@vanrijn/an-overview-of-the-ssl-handshake-3885c37c3e0f

In this part of the training, what the SSL/TLS protocol is and what it 
is used for were discussed. Basically, the working logic of the SSL/TLS 
protocol is explained step by step. In the next part of the training, 
the topic of “Cryptographic Attacks” will be explained.

- **Encryption:** It allows to hide data from parties other than the 2 communicating parties.
- **Authentication:** It allows to verify that both parties that want to provide secure communication are the correct parties.
- **Integrity:** It ensures that the outgoing data has not been changed between the 2 parties with which secure communication is provided.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/ssl1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/ssl2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/ssl3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/ssl4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/ssl5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/ssl6.png)

1. 1. The user sends a request to the server.
2. 2. The server sends its public key to the user along with its own SSL/TLS certificate.
3. 3. The user's browser checks and verifies whether the sent certificate is valid.
4. 4. The user's browser generates a randomly generated symmetric key and
encrypts this symmetric key with the public key sent by the server and
sends it to the server.
5. 5. The server decrypts the encrypted symmetric key with the private key and the symmetric key is sent to the server in a secure manner.
6. 6. From this stage onwards, the server encrypts every data to be sent to the user's browser using this symmetric key.
7. 7. Since the user has this symmetric key, he decrypts the incoming
encrypted data with the symmetric key and displays the page securely.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/ssl7.png)

