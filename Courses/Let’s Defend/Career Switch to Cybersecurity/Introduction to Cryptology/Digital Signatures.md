---
tags:
  - cryptography
  - digital-signatures
  - asymmetric-encryption
  - course/lets-defend
---

# Digital Signatures


**What is a Digital Signature?**

A digital signature is a cryptographic feature that allows verifying who
 sent and signed data in the digital environment. It is 
cryptographically based on mathematics and computer science. The 
requirements of the "Non-repudiation" principle included in the previous
 topics in the training are fulfilled with a digital signature. A 
digital signature is a feature used in security events in IT 
infrastructures. At the same time, an integrity check can be done with a
 digital signature. The digital equivalent of wet signatures on 
documents in daily life can be called digital signature. Although there 
are physical and logical differences between them, both serve similar 
purposes.

In the Windows operating system, files with the extension "exe" have a 
digital signature. Thanks to this signature, it is possible to see which
 company or who signed the file and verify it. For example, in the image
 below, it is seen that the Notepad++ setup file is signed by 
“Notepad++”. In order to see the signer, right-click on the relevant 
file and go to the "Digital Signatures" tab from the "Properties" menu:

To see detailed information, the "Details" button can be used:

**Cryptographic Fundamentals of Digital Signatures**

Digital signatures work cryptographically similar to other crypto 
algorithms. Algorithms used in digital signatures should be asymmetric 
crypto algorithms. This is because the same key is used for 
encryption/decryption in symmetric crypto algorithms. In digital signing
 algorithms, 2 different keys are used for signing and signature 
verification: “public key” and “private key”. A private key is a 
personal key used in signing. The reason why this key is used in the 
signing process and kept secret is that it can be signed on behalf of 
the owner of the key. The public key, on the other hand, is used to 
verify signatures that are shared publicly and signed with a private 
key. As seen in the image below, the sender signs the data with its 
private key, while the receiving party verifies the transmitted data 
using the sender's public key.
 

Image Source: https://www.esigngenie.com/blog/electronic-signatures-vs-digital-signatures/

In this part of the training, what digital signatures are and their 
cryptographic foundations were discussed. In the next part of the 
training, the subject of “SSL/TLS Protocol” will be explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/digi1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/digi2_new.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/digi3_new.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/digi4.png)

