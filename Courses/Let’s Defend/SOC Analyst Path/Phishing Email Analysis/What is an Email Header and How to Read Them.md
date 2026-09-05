---
tags:
  - phishing
  - email-security
  - soc
  - course/lets-defend
---

# What is an Email Header and How to Read Them?


In this lesson, we will explain the header information in an email, how to
 access it, and what you can do with it. It is important to follow this 
section carefully as we will explain how to perform the header analysis 
in the next section.

### What is an Email Header?

The header is a section of the email containing information such as 
sender, recipient, and date. There are also components such as 
'Return-Path', 'Reply-To', and 'Received'. Below you can see the header 
details of an example email.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/email-header.png)

### What does the Email Header do?

**Allows you to identify the sender and recipient**

Thanks to the "From" and "To" fields in the header, you can find out 
who is sending an email and who is receiving it. If we look at the email
 above, which you have downloaded in "eml" format, we can see that it 
was sent from "ogunal@letsdefend.io" to "info@letsdefend.io".

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/sample-subject.png)

**Spam Blocker**

It is possible to detect spam emails using header analysis and 
various other methods. This prevents people from receiving SPAM emails.

**Allows You to Track an Email's Route**

It is important to check the route an email takes to see if it came 
from the correct address. If we look at the example email above, we can 
see that it came from the address "ogunal@letsdefend.io", but it is 
still not certain whether it came from the domain "letsdefend.io" or 
from another fake server that imitates the same name. We can use the 
header information to answer this question.

### Important Fields

**From**

The 'From' field in an Internet header shows the name and email address of the sender.

**To**

This field in the mail header contains the details of the recipient of 
the email, including their name and email address. Such as CC (carbon 
copy) and BCC (blind carbon copy) also fall under this category, as they
 all contain details of your recipients.

To find out more about carbon copy and blind carbon copy, see How to use CC and BCC.

**Date**

This is the timestamp showing when the email was sent.

In Gmail, it usually follows the format day dd month yyyy hh:mm:ss

So if an email was sent on 16 November 2021 at 4:57:23 pm, it would show up as Wed, 16 Nov 2021 16:57:23.

**Subject**

The subject is the topic of the email. It summarises the content of the entire message body.

**Return-Path**

This email header field is also known as Reply-To. When you reply to an 
email, the reply is sent to the address specified in the Return-Path 
field.

**Domain Key and DKIM Signatures**

Domain Key and Domain Key Identified Mail (DKIM) are email signatures 
that help email service providers identify and authenticate your emails,
 similar to SPF signatures.

**Message-ID**

The Message-ID header is a unique combination of letters and numbers 
that identifies each email. No two emails will have the same Message ID.

**MIME-Version**

Multipurpose Internet Mail Extensions (MIME) is an Internet coding 
standard. It converts non-text content, such as images, videos, and 
other attachments, into text so that non-text content can be attached to
 an email and sent via SMTP (Simple Mail Transfer Protocol).

**Received**

The Received section lists each mail server that an email has passed 
through before arriving in the recipient's inbox. It's listed in reverse
 chronological order - the mail server at the top is the last server the
 email message passed through, and the mail server at the bottom is 
where the email originated.

**X-Spam Status**

The X-Spam Status shows you the spam score of an email message.

First, it'll highlight if a message is classified as spam.

It then shows the spam score of the email and the spam threshold for the email.

An email can either meet or exceed an inbox's spam threshold. If it's 
too spammy and exceeds the threshold, it's automatically classified as 
spam and sent to the Spam folder.

*Field Definitions: gmass.co*

### How to Access Your Email Header?

**Gmail**

**1- Open the email in question**

**2- Click on the 3 dots at the top right "..."**

**3- Click on the "Download message" button.**

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/mail-header-gmail.png)

**4- Open the downloaded file with the extension ".eml" with any notebook application**

**Outlook**

**1- Open the email in question**

**2-  File -> Info -> Properties -> Internet headers**

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/outlook-1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Phishing+Email+Analysis/images/outlook2.png)

