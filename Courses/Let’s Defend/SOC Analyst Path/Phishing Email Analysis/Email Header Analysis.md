---
tags:
  - phishing
  - email-security
  - soc
  - course/lets-defend
---

# Email Header Analysis


In the previous lesson, we looked at what a phishing email is, what the 
header information is, and what it does. Now, when we suspect that an 
email is phishing, we will know what we should do and what the analysis 
process should be like.

Here are the key questions we need to answer when checking headings during a Phishing analysis:

- Was the email sent from the correct SMTP server?
- Are the data "From" and "Return-Path / Reply-To" the same?

The e-mail examined in the rest of the article:

**Note:**

Connect to the lab machine with the connect button below. 
Use the "C:\Users\LetsDefend\Desktop\Files\Mail-Analysis.zip" file to 
analyze the email. (File Password: infected)

**Was the email sent from the correct SMTP server?**

We can check the "Received" field to see the path the email took. As 
you can see in the image below, the email came from the server with the 
IP address "101[.]99.94.116".

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/received-header.png)

If we look at who is sending the mail ("sender"), we can see that it is coming from the domain "letsdefend.io".

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/email-from.png)

So, under normal circumstances, "letsdefend.io" should be using 
"101[.]99.94.116" to send mail. To confirm this, we can query the MX 
servers that "letsdefend.io" is actively using."

"mxtoolbox.com" will help you by showing you the MX servers used by the domain you are asking for.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/mxtoolbox.png)

If we look at the image above, the domain "letsdefend.io" uses Google
 addresses as its email server. So there is no relation with the 
addresses emkei[.]cz or "101[.]99.94.116".

This examination showed that the email did not come from the original address, but was spoofed.

**Are the 'From' and 'Return-Path / Reply-To' details the same?**

Except in exceptional cases, we expect the sender of the email and 
the recipient of the replies to be the same. Here is an example of how 
these parts are used differently in phishing attacks:

Someone sends an email (Gmail, Hotmail, etc.) to LetsDefend with the 
same last name as someone who works for Google, LetsDefend tells the 
employee that they have issued the invoice and they need to pay to their
 XXX account. It inserts the real Google employee's email address in the
 "Reply-To" field so that the fake email address will not stand out when
 the email is replied to.

Going back to the email we downloaded above, all we need to do is 
compare the email addresses in the 'From' and 'Reply-to' sections.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/reply-to.png)

As you can see, the data is different. In other words, if we want to 
reply to this email, we will send a reply to the gmail address below. 
Please note that just because this data is different doesn't always mean
 that it's definitely a phishing email, we need to look at the event as a
 whole. In other words, in addition to this suspicious situation, if 
there's a malicious attachment, URL, or misleading content in the 
content of the email, we can understand that it's a phishing email. In 
the next lesson, we will analyze the data in the body of the email.

