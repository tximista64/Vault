---
tags:
  - cryptography
  - cryptanalysis
  - course/lets-defend
---

# Basic Concepts of Cryptology


**What is Cryptology?**

The science that designs crypto algorithms that provide data security in
 communication infrastructures and research the reliability of these 
algorithms is called "Cryptology". “Cryptology” is a science that is 
based on encryption and decryption, which is usually the expertise of 
mathematicians. For the science of cryptology, it can be said that 
consist of the intersection of mathematics, electrical engineering, and 
computer science. Cryptology science is a very broad science and is 
divided into 2 itself: "Cryptography" and "Cryptanalysis".

**What is Plaintext?**

“Plaintext” is a readable and understandable text or piece of text. 
Plaintext may vary according to the crypto algorithm. For example, if 
the crypto algorithm accepts the "binary data" format as input, the 
plaintext here is binary data. It is the name of the data that will 
enter the crypto algorithm expressed with plaintext. In cryptology, 
plaintext means unencrypted data. For example, the word “cipher” is 
plaintext.

**What is Ciphertext?**

“Ciphertext” is the value produced as a result of the algorithm after 
the plaintext is given as an input to a crypto algorithm. In cryptology,
 ciphertext means encrypted data. For example, if we encrypt the 
plaintext "cipher" with caesar cipher(key=3), we get the ciphertext 
"flskhu".

**Note:** Caesar cipher is described later in the tutorial.

**What is Cryptography?**

“Cryptography” is the whole of the techniques used to transform the 
transmitted information into a form that cannot be understood by 
unauthorized people. Cryptography includes mathematical methods that try
 to provide the basic objectives of information security such as 
confidentiality, integrity, authentication, and non-repudiation.

Cryptography has a long history. The science of "Cryptography" emerged 
to hide the meaning of a message. In other words, “Cryptography” is the 
science that converts plaintext to ciphertext with the crypto algorithm.
 Experts interested in this branch of science strive to develop 
stronger, more difficult, and secure crypto algorithms. The algorithm in
 the encryption process is one of the main focuses. The method used by 
the encryption algorithm is one of the factors that determine the 
reliability of the algorithm.

**What is Cryptanalysis?**

“Cryptanalysis” is a branch of cryptology that examines the security of 
crypto algorithms in order to decrypt the encrypted data and tries to 
find their weaknesses.
“Cryptanalysis” tries to detect mathematical vulnerabilities in the 
crypto algorithm in order to convert ciphertext to plaintext. In other 
words, it aims to break cryptographic algorithms.

That being said, it can be considered a move in line with hacker 
behavior, but generally, it is respected academic researchers who try to
 break such cryptographic algorithms.

Experts in cryptanalysis actually test crypto algorithms developed by 
those who are interested in cryptography and try to find out which 
points are open to attack in the crypto algorithm. It can be said that 
experts who are interested in the science of cryptography do the 
opposite operations according to the experts who are interested in the 
science of cryptanalysis. In this respect, these two professional groups
 are complementary elements of the science of cryptology.

Without experts working on cryptanalysis, it is not possible to 
understand whether crypto algorithms are really safe. Therefore, the 
work of researchers working in this field is crucial.

**What is Encryption?**

The process of converting plaintext into ciphertext is called 
"Encryption". There is an algorithm used mathematically in the 
encryption process.

**What is Decryption?**

The process of converting ciphertext into plaintext is called 
decryption. As in the encryption process, an algorithm is used in this 
process.

**What is the Key?**

The “Key” is a value given as input to encryption and decryption 
algorithms. Using this value, the encryption and decryption process is 
applied.

**What is Encoding/Decoding?**

“Encoding” is often confused with encryption as a concept. In fact, the 
two terms are used for very different purposes. Encoding is the process 
of converting data into a specific character set form. Unlike encryption
 algorithms, it is a conversion algorithm that is used without using key
 values ​​and without security concerns. There is also the opposite of 
the encoding process. For example, one of the most frequently used 
encoding algorithms is the "base64" algorithm.

“Decoding” is the opposite of encoding algorithms. The encoded data with
 the decoding process will turn into previous data.

**Note:** In the following sections of the tutorial, “base64” encoding will be explained in detail.

**The Correct/Incorrect Uses of Concepts**

Cryptology concepts are often misused. In fact, concepts that have 
different meanings can be used together, and conceptual confusion may 
arise. The following image shows the correct and incorrect usage of some
 concepts.

In this part of the training, the basic concepts of cryptology were 
explained. In the next part of the training, the subject of “Types of 
Cryptography” will be explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/basics1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/basics2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/basics3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/basics4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/basics5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/basics6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/basics7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/basics8.png)

