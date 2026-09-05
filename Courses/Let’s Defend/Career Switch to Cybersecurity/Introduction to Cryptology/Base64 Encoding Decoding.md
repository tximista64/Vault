---
tags:
  - cryptography
  - encoding
  - base64
  - cryptanalysis
  - course/lets-defend
---

# Base64 Encoding/Decoding


**What are Base32 and Base64?**

“Base32” and “Base64” is a method of representing binary data with a 
specific character set based on “ASCII”. In other words, it is a data 
representation method.
**ASCII (American Standard Code for Information Interchange):**
 ASCII format is a table that emerged in the name of digital systems 
having a common numerical value between characters. In this way, the 
binary equivalent of a character is the same in all electronic systems. 
To examine the ASCII table, the following address can be visited:
**ASCII Table:** https://www.asciitable.com/ 

Attackers use the "Base32" encoding method for data exfiltration with 
the DNS protocol. It often indicates an abnormal situation when SOC 
analysts see data transmitted in "Base32" format, especially in queries 
related to DNS requests.
**Example Base64 Encoded Data:** YmFzZTY0X2VuY29kaW5n
**Example Base32 Encoded Data:** MJQXGZJTGJPWK3TDN5SGS3TH
**Note:** Base32 and base64 encoding methods are the same 
logic. The examples shown in this topic are shown via “base64” encoding.
 Since base32 and base64 are similar, base32 is not included in the 
training.

**Intended Uses and Features**

“Base32” and “Base64” is an encoding method that allows sending 
text-based data to systems that process binary data type. In this 
encoding method, all data can be kept without data loss. It is an 
effective method to avoid some characters that may cause problems in the
 target system. For example, it provides the ability to transmit data in
 audio or video format to the target system as text-based. It reduces 
the errors that may be encountered during transmission or during data 
processing in the target system. The numbers 32 and 64 at the end of 
their names indicate the total number of characters in the character 
set. For example, the character set in the base64 encoding method 
includes both lowercase and uppercase letters and numbers. The character
 set of the Base32 encoding method does not include lowercase letters 
and some numbers.
**Base64 character set:** 26 lowercase + 26 uppercase + 10 digits + “/” sign + “+” sign = 64 characters
**Base32 character set:** 26 uppercase letters + 6 digits = 32 characters
**Note:** Base64 and Base32 encoding is never an encryption
 or decryption algorithm. It is also not recommended to be used for 
security purposes.

Below are the encoding tables for the "Base64" and "Base32" encoding methods:

Each character in the encoded data in the Base64 encoding method is 
expressed as “6 bits” (2^6=64). In the Base32 encoding method, it is 
expressed as "5 bit" (2^5=32). This means that data of the same length 
gives a longer output with base32 encoding.

**Base64 Encoding Logic**

Below is the step-by-step base64 encoding, explained in detail with an example:

**Step 1**

First, the data to be given to the base64 encoding algorithm is selected. A text has been chosen for clarity: “base64”

**Step 2**

Since bit-based operations will be done, "base64" text is converted to binary:
**Binary:** 01100010 01100001 01110011 01100101 00110110 00110100

The following address can be used for this process:
**Online Converter:** https://www.asciitohex.com/ 

**Step 3**

Data converted to binary format is divided into 6-bits, respectively:

**Step 4**

Each bit sequence separated as 6-bit is found in the base64 encoding table, and the characters are ordered consecutively:

**Encoded Data** = YMFzZTY0

As a result of the above sequential operations, the encoded data was 
successfully created. The decoded data, that is, the "base64" value, in 
which the operations performed are applied exactly the opposite, is 
reached.
**Note:** In the Base64 encoding method, the “padding” 
character is “=” sign. If the length of the input entering the base64 
encoding process is not “3 bytes and its multiples”, “=” sign(s) are 
added to the output as padding bytes. For example, let's encode the text
 "base" with an online base64 encoder (https://www.base64encode.org/):

Since each character is 1 byte, we have given 4 bytes as input. Two “=” 
signs are added to the end of the output to complete it to 6 bytes.

**Base64 Encode/Decode Operations on Linux Command Line**

The Linux command line can be used to encode/decode text/data with 
base64. A tool named “base64” is used for this. For example, let's 
encode the text "base":

As seen in the image above, the "base" text has been successfully 
encoded with the "echo" and "base64" commands. In order to decode with 
Base64, the "-d"(decode) parameter should be used. For example, let's 
convert the above-encoded data back to its original state:

As can be seen in the image above, the decoding process has been successfully applied.

You can find detailed information about Base64 encoding at the following address:
**Base64:** https://en.wikipedia.org/wiki/Base64

In this part of the training, what base64 encoding is, its usage areas, 
base64 encoding working logic, and its application on the Linux command 
line were discussed. In the next part of the tutorial, “Hash Functions” 
will be explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/base1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/base2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/base3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/base4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/base5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/base6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/base7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/base8.png)

