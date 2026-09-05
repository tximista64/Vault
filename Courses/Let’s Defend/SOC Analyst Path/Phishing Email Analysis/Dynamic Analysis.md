---
tags:
  - phishing
  - sandbox
  - malware-analysis
  - email-security
  - soc
  - course/lets-defend
---

# Dynamic Analysis


URLs and files in an email need to be checked to make sure they are safe. 
You don't want your data to be stolen by hackers by running these files 
on your personal computer. For this reason, the websites and files in 
the mail should be run in sandbox environments and the changes made to 
the system should be examined to see if they are harmful or not.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/Screen-Shot-2020-08-22-at-10.52.32-1024x498.png)

You can use online web browsers such as Browserling to quickly check 
the web addresses in the email. The advantage of such services is that 
you are not burdened by a possible zero-day vulnerability that would 
impact browsers, as you are not visiting the website on your own 
computer. On the other hand, the disadvantage of using web browsers such
 as Browserling is that if the malicious file is downloaded from the 
website, you will not be able to run it. This could interrupt your 
analysis.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/Screen-Shot-2020-08-22-at-10.45.13-1024x242%20(1).png)

Before going to the links in the email, you should check if there is 
any important information in the URL. If we examine the example in the 
image above, and the user's email address in the email parameter. So 
even if the user does not enter their password on the phishing page, 
when they click on popularshoppingsite[.]com and visit the website, the 
attacker will know that this user is valid.  The attacker can increase 
the success rate of the attack by social engineering the valid users in 
later attacks. Therefore, it is important to change information such as 
email addresses before accessing websites.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/Screen-Shot-2020-08-22-at-10.48.01.png)

Sandbox environments allow you to examine suspicious files and 
websites without the risk of infecting your computer with malware. Many 
sandbox services/products are available for both paid and free use. You 
can choose one or more of these services according to your needs.

Some commonly used sandboxes:

- VMRay
- Cuckoo Sandbox
- JoeSandbox
- AnyRun
- Hybrid Analysis(Falcon Sandbox)

Malware can wait a certain 
amount of time without taking any action to make detection more 
difficult. You have to wait for the malware to take action before you 
decide that the file being scanned is not malicious.

Also, the fact that there are no URLs and files in the email does not
 mean that it is not malicious. The attacker may also send the malware 
as an image to avoid detection by the analysis tools.

