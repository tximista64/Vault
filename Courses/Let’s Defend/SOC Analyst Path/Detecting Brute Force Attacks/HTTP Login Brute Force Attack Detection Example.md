---
tags:
  - brute-force
  - web-security
  - log-analysis
  - http
  - course/lets-defend
---

# HTTP Login Brute Force Attack Detection Example


In HTTP login brute force attacks, the attacker usually tries a password 
with a dictionary attack on a login page. In order to analyze this, the 
content of the relevant log file should be opened with a text editor and
 the logs should be examined.

The following screenshot shows an HTTP login brute force attack. It 
is seen that the user found the password by successfully entering the 
password after a certain number of unsuccessful login attempts. Here, 
the difference between the package sizes in the response returned to 
failed login attempts and the package sizes in the response returned to 
successful login attempts is clearly seen.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-10-1024x539.png)

