---
tags:
  - brute-force
  - access-control
  - siem
  - course/lets-defend
---

# How to Avoid Brute Force Attacks?


To protect your organization from brute force attack, enforce the use of strong passwords.

You can find some best practices for passwords below:

- Never use information that can be found online (like names of family members).
- Have as many characters as possible.
- Combine letters, numbers, and symbols.
- Minimum 8 characters.
- Each user account is different.
- Avoid common patterns.

Here are some ways you can protect users from brute-force attacks as administrators of an organization:

**Lock Policy** - After a certain number of failed login attempts, you can lock accounts and then unlock them as an administrator.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-5.png)

**Progressive delays** - You can lock accounts for a limited time after a certain number of failed login attempts.

**Recaptcha** - With tools such as Captcha-reCAPTCHA, 
you can make it mandatory for users to complete simple tasks in order to
 log on to a system.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-4-1024x520.png)

**Strong Password Policy** - You can force users to define long and complex passwords and force them to change their password periodically.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-3.png)

**2FA** - It is the method where a
 second verification is required from the user with an additional 
verification mechanism (SMS,mail,token,push notification, etc.) after 
entering the username and password.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Brute+Force+Attacks/images/image-2-1024x609.png)

## **4.1. Brute Force Attack Detection**

Specific rules are usually defined on SIEM systems to detect brute 
force attacks. When defining these rules, we consider how many 
unsuccessful login attempts are made by the user within a certain period
 of time. While analyzing the relevant alarms, the logs of the trial 
protocol/application are examined and the necessary inferences are made.
 Examples of some brute force attacks are given below.

