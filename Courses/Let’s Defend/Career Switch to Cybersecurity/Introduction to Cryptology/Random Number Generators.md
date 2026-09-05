---
tags:
  - cryptography
  - random-number-generators
  - course/lets-defend
---

# Random Number Generators


In cryptography, there are many criteria for the algorithm to be secure. 
One of these criteria is related to the randomness of key generation. 
For a crypto algorithm to be strong in cryptography, it is important 
that the key is long enough and random. Many random number generator 
methods have emerged to make the key random.

There are three types of Random Number Generators:
True Random Number Generators (TRNG)Pseudorandom Number Generators (PRNG)Cryptographically Secure Pseudorandom Number Generators (CSPRNG)
**True Random Number Generators (TRNG)**

True Random Generator is a method that generates random numbers based on
 real physical operations. An example of this type of random number 
generation is a coin flip or a dice toss. Although it is an effective 
method in terms of randomness, it is not a preferred method in terms of 
applicability and speed.

You can use the following address online for coin flipping:
**Coin Flipping:** https://www.random.org/coins/ 

**Pseudorandom Number Generators (PRNG)**

The Pseudorandom Number Generator method needs an initial random value 
to ensure randomness. This value is called “seed”. This value can come 
from the TRNG method. It generates random numbers step by step according
 to some mathematical calculations over this first value. By applying 
the same mathematical calculation recursively, a number is generated at 
each step. Compared to the TRNG method, its application in practice is 
much easier and faster. But it is not secure and unpredictable enough 
for use in cryptography. Because if the first value is determined, it is
 not possible to talk about completely random values, since the value 
calculated in each step will be the same every time. For example, the 
"rand()" function in the C programming language can be given as an 
example of generating a number of types of PRNG.

**Cryptographically Secure Pseudorandom Number Generators (CSPRNG)**

Cryptographically Secure Pseudorandom Number Generators (CSPRNG) is an 
unpredictable variant of PRNG. As in the PRNG method, it is not possible
 to predict and calculate the next value (0 or 1 bit) to be produced 
mathematically. The PRNG methods are frequently used in software 
testing, but CSPRNG is a cryptography-specific method.

Those who want to learn more about CSPRNG can visit the following 
address:
**CSPRNG:** https://en.wikipedia.org/wiki/Cryptographically_secure_pseudorandom_number_generator 

**Generating Random Value via Linux Command Line** 

It is possible to generate random numeric values ​​using the Linux 
command line. In this section, two different methods will be explained:

**Random Number Generation with $RANDOM**

This method is an example of PRNG. To generate random numbers with "$RANDOM" on Linux, the command can be applied as follows:

**Command:** sudo echo $RANDOM

For example, let's see by executing the command:

As can be seen in the image above, random numbers were successfully 
generated. In this method, random number generation is between “0-32767”
 values.

**Random Number Generation with /dev/random**

This method is an example of PRNG. The "od" command and parameters can 
be used to generate numbers with "/dev/random" on Linux. For example, 
max. Let's generate two different numeric values, 2 bytes and 3 bytes 
long:
**Command:** od -An -N2 -i /dev/random

As can be seen in the image above, random number generation in 2 
different lengths has been successfully applied. The “-N” parameter 
allows for specifying the length.

Those who wonder how CSPRNG type random value generation is implemented 
on Linux can examine the following address:
**CSPRNG Linux:** https://medium.com/@phil_k/one-liner-csprng-in-your-friendly-linux-console-be02b3bc5a1f 

In this part of the tutorial, what Random Number Generators are, their 
types, and their application on the Linux command line was discussed. In
 the next part of the training, the subject of “Base64 
Encoding/Decoding” will be explained.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/rand1.png)

- True Random Number Generators (TRNG)
- Pseudorandom Number Generators (PRNG)
- Cryptographically Secure Pseudorandom Number Generators (CSPRNG)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/rand2.jpg)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/rand3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/rand4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/rand5.png)

