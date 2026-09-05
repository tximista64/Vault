---
tags:
  - brute-force
  - ssh
  - log-analysis
  - linux
  - course/lets-defend
---

# SSH Brute Force Attack Detection Example


Simple passwords used on the server with an SSH brute force attack can be 
easily found by the attackers. If such attacks fail, the attacker will 
only attempt a certain number of failed passwords. If successful, the 
password is entered successfully after a certain number of unsuccessful 
login attempts.

In an example SSH brute force analysis, when we view a linux machine 
log with the contents of the “/var/log/auth.log.1” file and failed login
 attempts, we can see who the failed login attempts belong to.

*cat auth.log.1 | grep "Failed password" | cut -d " " -f10 | sort | uniq -c | sort*

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-6-1024x208.png)

A command such as the one below can be used to locate the IP addresses that made these attempts.

*cat auth.log.1 | grep "Failed password" | cut -d " " -f12 | sort | uniq -c | sort*

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-7-1024x170.png)

Users who successfully log in can also be detected with the following command.

*cat auth.log.1 | grep "Accepted password"*

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-8-1024x223.png)

As can be seen here, successful login attempts are seen with two different users from two different IP addresses.

When the previous failed login attempts are compared, it is seen that
 the "analyst" user did not have an unsuccessful login attempt before 
from the ip address he successfully logged in. However, it is clearly 
seen that many unsuccessful attempts were made with the "letsdefend" 
user at the IP address of 188.58.65.203. This shows us that the attacker
 successfully logged in with the letsdefend user during the brute force.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-9-1024x317.png)

As seen above, successful and unsuccessful logged in users can be 
easily found with basic Linux commands. When these two results are 
examined in detail, it is seen that there is a successful entry after 
many unsuccessful attempts by the letsdefend user from the 188.58.65.203
 IP address.

