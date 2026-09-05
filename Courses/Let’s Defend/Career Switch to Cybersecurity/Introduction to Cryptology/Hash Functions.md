---
tags:
  - hash-functions
  - cryptography
  - cryptanalysis
  - course/lets-defend
---

# Hash Functions



**What are Hash and Hash Functions?**

Hash functions are a special type of function that performs certain 
operations mathematically and in computer science, which operates on 
bits. Hash functions are not encryption/decryption algorithms. 
Therefore, the hash function does not need a key to perform operations. 
Hash functions are functions that work fast and have easy calculation 
features. In this way, it can work in a short time even on large files.

The hash function takes an input and produces an output as a result of 
the calculations in the algorithm. This output is called "Hash". The 
length of the input can be variable while the length of the output is 
fixed length. One of the important features of hash functions is that 
they produce a different hash for each different input. For example, the
 hash of the bit string "00110101" and the hash of the bit string 
"00110100" are different. The difference of even a single bit affects 
the result produced by the hash function, that is, it makes the value of
 the hash different. The reliability of the hash function depends on 
producing different hashes for different inputs. For example, if two 
different inputs cause the same hash, as in the image below, the hash 
function loses its reliability. The situation where two different inputs
 produce the same hash is called "collision".

**Note:** The hash values ​​in the image above do not 
belong to a real algorithm, they are written as a representation to 
describe the collision example.
  

**What are the Purposes of using it?**

There are many ways of using Hash functions. Hash functions pass very 
large inputs or files through bit-based operations, resulting in a short
 and unique hash as a result of the algorithm. The hash produced as a 
result of the hash function can be used as the digital identity of the 
data. For example, hash values ​​are used to distinguish malware. You 
can get information about the malware when you query the hash of the 
malware in known large-scale malware archives. For example, by searching
 the hash on “virustotal.com”, you can access the previously made 
malware analyzes of the relevant malware with hash information.

Another purpose of using hash functions is integrity check. If a problem
 has occurred in the transmission of the data or file and there has been
 a change in the bits of the file/data, hashes are used to understand 
this. Sometimes attackers can specifically replace real files with fake 
ones. In this case, it should be verified whether the file is the 
original file or not. One way to find out that the file is intact is to 
use hash functions. For example, let's say we have a file with the 
extension "iso" downloaded from the Internet: 
"linuxmint-20.3-cinnamon-64bit.iso"
**Download  Page:** https://linuxmint.com/edition.php?id=292 

First, we need to download the file. Then, let's click on the section below to see the hash values ​​of the file:

  

The hash values ​​of the Linux mint installation files are as follows: 

The hash of the iso file that we downloaded from the web page is as 
above. The "sha256sum" command can be used in any Linux terminal to 
calculate the sha256 type hash of the downloaded file:

As can be seen in the image above, the same hash value given on the 
website was reached with the "sha256sum" command. If the hash values 
​​are the same, it indicates that the file has not been modified and is 
the original file.

**The Role of Hash Functions in Cyber ​​Security**

Hash functions are very important in terms of cyber security. On Linux 
and Windows systems, users' password information is not kept as 
cleartext on the system. That would be a very insecure method. Passwords
 are kept in the form of hashes on the systems. Hash functions are 
different from other crypto algorithms. One of these differences, 
perhaps one of the most important, is that hash functions are 
unidirectional. Being one-way means that the input given to the hash 
function cannot be obtained over the hash.

**An Example of Hash Function: MD5**

Although hash functions are general algorithms that work with similar 
logic, there are some differences between them. For example, the length 
of the hash produced by each hash function is a different and fixed 
value. Examples for the MD5 hash function are given in the image below:

The MD5 hash function produces a "128-bit" hash. There are many ways to find the hash of an input:

**Using online services**

For example, you can type the input you want to generate the MD5 hash on
 the following web page: https://www.miraclesalad.com/webtools/md5.php 

**Leveraging the Linux command line**

The MD5 hash of the desired input can be generated via the Linux command
 line. For this, the "echo" and "md5sum" commands are used together: 

As seen in the image, the MD5 hash of the "LetsDefend" input has been successfully generated.
**NOTE:** You can use the "md5sum filename" command to calculate the MD5 hash of a file on the Linux command line.

For those who want to examine other hash functions, there is a list at the following address:
**List of Hash Functions:** https://en.wikipedia.org/wiki/List_of_hash_functions 

In this part of the training, what the hash functions and hash are, 
their purpose of use, and examples of the MD5 hash function were 
discussed. In the next part of the training, the subject of “Digital 
Signatures” will be explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/hash1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/hash2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/hash3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/hash4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/hash5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/hash6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/hash7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/hash8.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/hash9.png)

