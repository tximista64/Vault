---
tags:
  - cryptography
  - cryptanalysis
  - cryptographic-attacks
  - course/lets-defend
---

# Cryptographic Attacks



In this part of the tutorial, basic cryptographic attacks are going to be 
briefly discussed. Cryptographic attacks require mastery of technical 
details that make them difficult to understand, depending on the crypto 
algorithm. Cryptographic attacks against each crypto algorithm differ. 
The purpose of this section is to explain what types of cryptographic 
attacks are and what they basically mean with simple examples.

**Cryptanalysis and Attack Types**

Cryptanalysis is a branch of science that falls under cryptology. Those 
interested in this branch of science test the reliability of crypto 
algorithms designed by cryptography experts. The test here is very 
different from a routine test. By discovering attack methods specific to
 the Crypto algorithm, the weakness in the algorithm is exploited and 
the reliability of the crypto algorithm is tested in this way. 
Cryptanalysis is basically examined under 3 headings:

Classical CryptanalysisImplementation AttacksSocial Engineering
**Classical Cryptanalysis**

Classical cryptanalysis tries to obtain the plaintext from the 
ciphertext or to obtain the key from the ciphertext. With this method, 
simple methods are usually used when finding the weakness of the crypto 
algorithm. Structural weaknesses of the Crypto algorithm can be used or 
all possibilities can be tried with brute-force techniques. Generally, 
computers that require high processing power do not need to be used for 
this attack type. Attacks against Historic Ciphers are in this group.

**Brute-Force Attacks**

In Brute-Force attacks, the attacker tries to determine the correct key 
value by trying all possible key possibilities on encrypted data he has 
captured. By checking whether the data obtained as a result of each key 
attempt is meaningful, he can understand whether he has obtained the 
key. Although there are many different criteria in this type of attack, 
the key length and the processing power of the attacker are important. 
If the length of the key is not long enough and the attacker has the 
processing power to do this attack, it may be possible to obtain the key
 in a short time. In order to prevent such attacks cryptographically, 
the length of the key value of the crypto algorithm should be such that 
it cannot be found by brute-force techniques. The crypto algorithm, 
which is developed assuming that the attacker has high processing power,
 can make it a more reliable crypto algorithm. A simple example is the 
brute-force attack:

Let’s say there is a login panel like the image above. A password is 
required to access this panel. Let's say the password is 1 character 
long and consists of numbers only. In this case, the possibilities will 
be very small. All possible passwords are as follows: 
“0,1,2,3,4,5,6,7,8,9”

By trying these 10 possibilities, it can be determined which one is the 
correct password. For example, the correct password is "9". It can be 
figured out by trying all values ​​from 0 to 9, it is not successful for
 the values ​​between "0-8", but for the value "9". The result of being 
successful in this example is being able to log into the system. Such an
 example was given to explain the subject better, but the result of a 
brute-force attack on encrypted data is that meaningless data becomes 
meaningful.

**Letter Frequency Analysis**

If we had used the brute-force attack in the previous title on the 
Caesar cipher, the probability number of key values ​​would be 26, that 
is, it would be as many as the number of letters in the alphabet. If an 
encryption method is used as a substitution cipher instead of a Caesar 
cipher in the form of a different letter for each letter, an attack 
method that is more effective than a brute-force attack can be used: 
“Letter Frequency Analysis”. This analytical method makes it possible to
 obtain the plaintext using the weaknesses of the crypto algorithm. In 
the substitution cipher, each letter corresponds to a fixed letter. This
 reveals an analytical weakness. For example, one of the most used 
letters in English is statistically the letter "E" (about 13%). The 
second most used letter is the letter "T" (about 9%). If a letter 
analysis is made in the encrypted text, which is in the hands of the 
attacker, it can be easily seen how much each letter is. The letter 
corresponding to the letter "E" will be the letter with the highest 
number in the text. For example, let's examine the following plaintext 
and ciphertext:

**Plaintext:**
 Having a certification is one of the popular factors that affect the 
recruitment process. Human resources specialists or the hiring managers 
who are authorized in the recruitment process consider the certificates 
of the candidates. Having a certificate or multiple certificates will be
 advantageous in order to stand out among other applicants. In some 
cases, having a certificate(s) may be mandatory depending on the 
requirements posted on the open position.

**Ciphertext:**
 Kdylqj d fhuwlilfdwh lv rqh ri wkh srsxodu idfwruv wkdw diihfw wkh 
uhfuxlwphqw surfhvv. Kxpdq uhvrxufhv vshfldolvwv ru wkh klulqj pdqdjhuv 
zkr duh dxwkrulchg lq wkh uhfuxlwphqw surfhvv frqvlghu wkh fhuwlilfdwhv 
ri wkh fdqglgdwhv. Kdylqj d fhuwlilfdwh ru pxowlsoh fhuwlilfdwhv zloo eh
 dgydqwdjhrxv lq rughu wr vwdqg rxw dprqj rwkhu dssolfdqwv. Lq vrph 
fdvhv kdylqj fhuwlilfdwh(v) pdb eh pdqgdwrub ghshqglqj rq wkh 
uhtxluhphqwv srvwhg rq wkh rshq srvlwlrq.

When we look at the number of letters in plaintext, we see a table as follows:

**Note:** The following tool can be used to see the number of characters in the input.

**CharacterCounter:** https://github.com/smh67dmrc/CharacterCounter 

When we look at the number of letters in the ciphertext, we see a table like this:

**Note:** Characters other than 26 letters are ignored (spaces, parentheses, and punctuation).

Let's compare the first 3 letters in both tables in order:

**Plaintext:** e, t, a

**Ciphertext:**  h, w, d

As can be seen, a result consistent with the above-mentioned statistics 
was encountered. The letter "h" is the letter "e" which is the most used
 letter. The second most frequently used letter is the letter "w" 
against the letter "t". If an analysis is made on the alphabet:

As seen in the image above, all 3 letters examined have the same shift 
value: "3". Thus, as a result of cryptanalysis, it was determined that 
the entire text above was encrypted using "Caesar Cipher(ROT 3)". With 
the Cyberchef tool, control can be achieved via the link below:

**CyberChef:** https://tinyurl.com/bdzjvep5 

**Implementation Attacks**

Implementation attacks are an advanced type of attack that requires 
technical knowledge to implement. For example, obtaining the secret key 
according to the measurement of the electrical power consumption of the 
processor using the secret key is such an attack. In such an attack, it 
may be possible to obtain the secret key with signal processing 
techniques by following the power. In other words, such attacks are 
called "Side Channel Attacks".

**Social Engineering**

Social Engineering is the general name of a type of attack that is 
caused by the vulnerability of the person himself. Apart from 
Cryptology, this topic is very common and has many creative techniques. 
It is mostly used in terms of cryptology, which is mentioned under this 
title. For example, "social engineering" methods can be used to obtain 
the secret key necessary to obtain an encrypted text. Bribery, 
blackmail, and classical espionage methods can be given as examples. 
Using force to learn the secret key is also included in these methods. 
One of the frequently used methods is to persuade the person over the 
phone. Around a scenario, the attacker can achieve the goal based on a 
logical reason. For example, an attacker who says he is from the IT 
department may ask the person for their secret key or direct password 
for software updates. In order for the attacker to be successful in this
 attack, it is usually sufficient to convince the other party. Although 
it is a non-technical method and a simple method, many people can be 
persuaded by this type of talk. It is one of the methods that still 
remains popular today. In order to be protected from such an attack, 
people should be invested and the awareness of the employees should be 
increased.

In this part of the tutorial, cryptanalysis and cryptographic attacks were discussed.

- Classical Cryptanalysis
- Implementation Attacks
- Social Engineering

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/attack1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/attack2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/attack3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/attack4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Introduction+to+Cryptology/images/attack5.png)

