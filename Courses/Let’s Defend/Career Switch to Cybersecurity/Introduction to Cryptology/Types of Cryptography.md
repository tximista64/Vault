---
tags:
  - cryptography
  - symmetric-encryption
  - asymmetric-encryption
  - course/lets-defend
---

# Types of Cryptography


Cryptography
 has evolved continuously from the past to the present. In this 
development process, too many crypto algorithms have been put forward, 
some of which have been accepted and used for many years, and some have 
been forgotten by remaining in the research process without being 
accepted. While developing Crypto algorithms, some techniques have been 
created that reveal unusual methods over time. These techniques have 
become frequently used in subsequent crypto algorithms. These structural
 changes have led to the classification of crypto algorithms.

This section of the tutorial outlines the topics under cryptography.

**Types of Cryptography**

Cryptography is examined under 3 main titles:
Symmetric CiphersAsymmetric CiphersProtocols
**Symmetric Ciphers**

All cryptographic methods created from ancient times until 1976 were 
based solely on symmetric methods. Today, symmetric methods are 
frequently used for data encryption and integrity check.

Symmetric encryption algorithms are cryptographic algorithms that use 
the same key in encryption and decryption operations. For example, after
 you have encrypted the plaintext, you can decrypt the result obtained 
with the same key again. This way you get the same plaintext. For this, 
it is sufficient for the parties who will perform encryption and 
decryption transactions to know the key value. DES, 3DES, and AES crypto
 algorithms can be given as examples of symmetric encryption algorithms.

**Asymmetric Ciphers**

An entirely different type of cryptosystem was introduced in 1976 by 
Whitfield Diffie, Martin Hellman, and Ralph Merkle. In this type of 
cryptosystem, which is introduced as "Public-key cryptography" or 
"asymmetric cryptography", two different keys are used instead of a 
single key. One of these keys is the "secret key" and the other is the 
"public key". Different keys are used in encryption and decryption 
processes for asymmetric crypto algorithms. While “public key” is used 
for encryption, “secret key” or in other words “private key” is used for
 decryption. An example of an asymmetric crypto algorithm is the RSA 
(Rivest–Shamir–Adleman) algorithm.

 (Image Source: https://sectigostore.com/blog/what-is-asymmetric-encryption-how-does-it-work/ ) 

**Protocols**

Cryptographic protocols deal with the implementation of cryptographic 
algorithms. Symmetric and asymmetric crypto algorithms are used in the 
security infrastructure of many software. An example of the protocols in
 which these algorithms are applied is the "Transport Layer Security 
(TLS)" protocol. In this type of cryptographic protocol, symmetric and 
asymmetric crypto algorithms are generally used together. This is called
 “Hybrid Schemes”. The reason for using both types of algorithms is that
 each has its strengths and weaknesses.

In this part of the training, the sub-branches of cryptography were 
explained. In the next part of the training, the subject of “Symmetric 
Algorithms” will be explained.

- Symmetric Ciphers
- Asymmetric Ciphers
- Protocols

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/types1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/types2.png)

