---
tags:
  - cryptography
  - cryptanalysis
  - historical-ciphers
  - symmetric-encryption
  - course/lets-defend
---

# Historical Ciphers


**The Substitution Cipher**

The substitution cipher is an old and simple crypto algorithm. 
“Substitution Cipher” is an algorithm that works with the logic of 
replacing letters in the alphabet with another letter. For example, let 
our plaintext be “cipher”. Let the encrypted equivalent of each letter 
in the plaintext be as follows:

**Substitution Table**

According to the letter equivalents above, the encrypted equivalent of 
the "cipher" plaintext is "ynausk". The key in this symmetric crypto 
algorithm is the "Substitution Table". The attacker who has captured the
 encrypted text must know the table in order to decrypt the encrypted 
text. Even if the attacker does not know this table, it is possible to 
decrypt the encrypted text with some attacks. These attack methods will 
be explained in the following sections of the training.

**Shift Cipher (or Caesar Cipher)**

Caesar Cipher takes its name from the Roman leader "Julius Caesar". 
Julius Caesar developed a crypto algorithm to secretly transmit messages
 of military importance at that time, which was quite simple and changed
 each letter by scrolling over the alphabet. Although it is not a 
reliable method today, it may be an effective method at that time. Since
 many of Caesar's enemies were illiterate, it is possible that they 
thought the encrypted text was written in another language and could not
 understand the message.

Shift Cipher is one of the substitution cipher types. Shift cipher is an
 algorithm that works by sequentially shifting letters in the alphabet. 
In this algorithm, the key is the value that indicates how many times 
the alphabet will be shifted.

(Image Source: geeksforgeeks.org)
For example, let's encrypt the plaintext "cipher" with Caesar cipher(key=3):

In the above image, the letters corresponding to the letters of the word
 “cipher” are found respectively and the “flskhu” ciphertext is created.
 In order to decrypt the ciphertext, the opposite of the shift operation
 is done. In this example with the key "3", when 3 letters are shifted 
to the left for decryption, the "cipher" value is obtained and the 
plaintext is successfully reached.

For detailed information about the Caesar cipher, the following address 
can be used:

**Caesar Cipher:** https://en.wikipedia.org/wiki/Caesar_cipher 

The following address can be used to apply encryption/decryption transactions related to Caesar cipher online:
**Online Caesar Encryption/Decryption Tool(CyberChef) :** https://gchq.github.io/CyberChef/#recipe=ROT13(true,false,false,3)&input=Y2lwaGVy

**Online CyberChef Tool**

The sections in the image below constitute the parts of the “CyberChef” 
tool. CyberChef tool is a tool that supports many crypto algorithms and 
encoding.

The sections in the CyberChef tool are described below, respectively:

1- This is the section where the list of Crypto algorithms is located. 
The crypto algorithm to be used should be moved to the "Recipe" section 
numbered "2" by drag-and-drop.

2- In this section, the details of the crypto algorithm should be 
determined. For example, it is used to set the key for the caesar 
cipher.

3- This section is the section where the input should be written.

4- This is the section where the output is shown.

CyberChef tool can be used for many crypto algorithms similar to the one
 shown above. Curious candidates are advised to review and work on this 
tool.

In this part of the training, it is mentioned what the substitution 
cipher is, which is the basis of many historical ciphers. In addition, 
how the most known crypto algorithm caesar cipher works and the use of 
the CyberChef tool was explained. In the next part of the training, the 
subject of “Objectives of Cryptography” will be explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/historical1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/historical2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/historical3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/historical4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/historical5.gif)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/historical6.gif)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/historical7.gif)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/historical8.png)

