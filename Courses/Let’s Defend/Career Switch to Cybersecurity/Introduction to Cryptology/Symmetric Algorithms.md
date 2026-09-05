---
tags:
  - symmetric-encryption
  - cryptography
  - course/lets-defend
---

# Symmetric Algorithms


**Symmetric Cryptography Basics**

Let's see an example to understand symmetric cryptography:

Suppose we have two users who want to communicate over an insecure 
channel: “Alice” and “Bob”. Let's consider the insecure channel here as 
the internet environment. In addition, there is a user named “Oscar” who
 is the malicious attacker. An attacker named Oscar hacked the router 
device Alice or Bob used to communicate and can monitor all traffic 
passing through the router. Alice and Bob have to transmit important 
critical documents of the company they work for through this insecure 
channel, but what cryptographic algorithm should be in order to do this?

In the image above, Alice is sending an unencrypted message to Bob. The 
“x” in the image denotes plaintext. In this case, Oscar, who monitors 
the traffic in between, can read the sent message. This is not a secure 
way. In such a case, symmetric crypto algorithms are used as a solution.

In the image above, “x” refers to plaintext and “y” refers to 
ciphertext. Before sending the message she wants to send to Bob, Alice 
encrypts it using the symmetric encryption algorithm. The key owned by 
Alice and Bob is used in the encryption process. This key is shared 
between Alice and Bob over the secure channel. Since the insecure 
channel is not used for key sharing, Oscar cannot obtain the key. When 
Alice sends the message encrypted with the key to Bob via the insecure 
channel, the encrypted message also reaches Oscar. But Oscar needs the 
key to make the encrypted message he has obtained meaningful. There are 
some methods that Oscar can apply to decrypt the encrypted message. 
However, if this crypto algorithm is strong and does not allow attacks 
that will allow him to obtain the key, a secure message transfer will be
 made between Alice and Bob. When the encrypted message passes to Bob's 
side, the decryption algorithm is used, which allows doing the opposite 
of the encryption algorithm with the same key. Thus, Bob converts the 
encrypted message into readable form.

The reality here is that encryption and decryption algorithms are known 
to everyone. The first thought is that keeping encryption/decryption 
algorithms secret would be better for security. However, on the 
contrary, secret algorithms are not tested by cryptanalysis experts, so 
they are insecure crypto algorithms. The only thing that needs to be 
kept secret in a strong crypto algorithm is the key.

In this scenario, only the privacy issue is addressed. However, Oscar 
could have changed the message so that the changed message was 
transmitted to Bob. Later in the tutorial, we will talk about 
cryptographic algorithms that enable message integrity to be checked.

In this part of the training, the working principle and benefits of 
symmetric crypto algorithms were explained. In the next part of the 
training, the subject of “Historical Ciphers” will be explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/symm1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/symm2.png)

