---
tags:
  - xss
  - web-security
  - log-analysis
  - course/lets-defend
---

# Detecting Cross Site Scripting (XSS) Attacks


## **What is Cross-Site Scripting (XSS)?**

Cross-site scripting (XSS) is a type of injection-based web security 
vulnerability that can be incorporated into legitimate web applications,
 allowing malicious code to be executed.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Web+Attacks/images/xss.png)

Today, most frameworks used to develop web applications have taken 
preventative measures against cross-site scripting attacks. However, we 
still see XSS vulnerabilities today because frameworks are sometimes not
 used, or the framework itself has an XSS vulnerability and the data 
coming from the user is not sanitized.

### **Types of XSS**

There are 3 types of XSS. These are:

1. **Reflected XSS (Non-Persistent)**: This is a non-persistent type of XSS where the XSS payload must be present in the request. It is the most common type of XSS.
2. **Stored XSS (Persistent)**: This type of XSS is where
the attacker can permanently upload the XSS payload to the web
application. Compared to other types, Stored XSS is the most dangerous
type of XSS.
3. **DOM Based XSS**: DOM Based XSS is an XSS attack where the attack payload is executed as a result of modifying the DOM
"environment" in the victim's browser used by the original client-side
script so that the client-side code runs in an "unexpected" manner.
(OWASP)

## **How does XSS work?**

Like other web attack methods, XSS is a vulnerability that is caused 
by a lack of data sanitization. It occurs when the data received from 
the user is sent in the response without being sanitized.

Let's look at an example to understand XSS attacks better.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Web+Attacks/images/XSS-vulnerable-code.png)

First, we'll examine the piece of code above. What it does is 
actually quite simple. It simply displays whatever is entered in the 
'user' parameter. If we enter "LetsDefend" as the 'user' parameter, we 
will see the words "Hello LetsDefend".

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Web+Attacks/images/XSS-image-1.png)

So far there is no problem. If we enter the appropriate data in the 
user parameter, we are greeted with a warm welcome. But, as we have 
already seen, there is no control mechanism for the user parameter. This
 means that whatever we put in the "user" parameter will be included in 
the HTTP response we receive back.

So what would happen if we didn't enter a normal value, but instead a payload that would trigger a popup?

Payload: **<script>alert(1)</script>**

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Web+Attacks/images/XSS-popup.png)

Because whatever is put in the 'user' parameter is included directly 
in the HTTP response, the javascript code we wrote worked and a pop-up 
window appeared on the screen.

This is exactly how XSS works. Because the value entered by the user 
is not validated, the attacker can enter any javascript code and get the
 result they want. Another question is, what if the attacker wants to 
redirect the user to a malicious site?

Payload: **<script>window.location=’https://google.com’</script>**

https://letsdefend.io/xss_example.php?user=%3Cscript%3Ewindow.location=%27https://google.com%27%3C/script%3E

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Web+Attacks/images/XSS-google-redirect-1.png)

Of course we are not going to direct you to a web application. 
Directing you to Google will be sufficient as an example. When the user 
clicks on the URL he will be directed to Google instead of the perfect 
LetsDefend web application.

![](https://app-ld-img.s3.us-east-2.amazonaws.com/training/img60-google.png)

## **How Attackers Take Advantage of XSS Attacks**

Because XSS is a client-based attack method, it may seem less 
important than other attack methods, but XSS attacks and their impact 
should not be taken for granted.

Attackers can do the following with an XSS attack:

- Steal a user’s session information
- Capture credentials
- Etc.

## **How to Prevent a XSS Vulnerability**

- **Sanitize data coming from a user:** Never trust data
that you receive from a user. If user data needs to be processed and
stored, it should first be encoded with "HTML Encoding" using special
characters, only then can it be stored.
- **Use a framework:** Most frameworks come with preventative measures against XSS attacks.
- **Use the framework correctly:** Almost all frameworks
used to develop web applications come with a sanitation feature, but if
this is not used properly, there is still a chance for XSS
vulnerabilities to occur.
- **Keep your framework up-to-date:** Frameworks are
developed by humans, so they too can contain XSS vulnerabilities.
However, these types of vulnerabilities are usually patched with
security updates. You should therefore make sure that you have completed the security updates for your framework on a regular basis.

## **Detecting XSS Attacks**

As we mentioned in the previous lesson, according to a study by 
Acunetix, 75% of cyber-attacks are conducted through web applications. 
As XSS is one of the most commonly tested vulnerabilities, you will 
encounter it throughout your career as a SOC analyst.

- **Look for keywords:** The easiest way to detect XSS
attacks is to look for keywords such as "alert" and "script" that are
commonly used in XSS payloads.
- **Learn about commonly used XSS payloads:** Attackers
tend to use the same payloads to look for vulnerabilities before
exploiting an XSS vulnerability. Therefore, familiarizing yourself with
commonly used XSS payloads would make it easier for you to detect XSS
vulnerabilities. You can examine some commonly used payloads .
    
    [here](https://github.com/payloadbox/xss-payload-list)
    
- **Check for the use of special characters:** Check data coming from a user to see if any special characters commonly used in
XSS payloads, such as greater than (>) or less than (<), are
present.

### **An Example of Detection**

In this example, we have access logs from an Apache server running 
WordPress. Don't forget to revisit our lesson "Detecting SQL injection 
attacks" for more information about access logs.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Web+Attacks/images/XSS-apache-access-log.png)

Let's examine the access logs provided.

First, let's take a general look at the requests that were made and 
try to understand them. We can see that all the requests were made for 
the "/blog/" page and that only the "s" parameter values were changed. 
If you pay attention to the URLs of the websites you visit, you probably
 have noticed before that when you perform a search in WordPress, the 
words you enter are sent with the "?s=" parameter. The example we are 
looking at shows us that these are searches carried out in WordPress.

It is difficult to find examples that are easy to read, such as the 
example in the lesson " Detecting SQL Injection Attacks ". Instead, we 
usually come across characters that have been converted to %XX as a 
result of URL encoding. We'll do URL decoding next, but first, let's 
look at the URLs and see if we can spot any words.

Looking at the logs, there are javascript-related words such as 
"script", "prompt" and "console.log". The word javascript immediately 
brings XSS to mind. If we decode the URL, we can easily understand the 
requests being made.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Web+Attacks/images/xss-apache-access-log-with-url-decoding.png)

Let's take another look at the access logs after decoding the URLs. 
We can clearly see the XSS payloads and definitely conclude that the 
WordPress application from which we received these access logs has been 
the victim of an XSS attack.

When we examine the requested IP addresses, we find that there is 
more than one. Is there more than one attacker trying to perform an XSS 
attack at the same time? Or is the attacker constantly changing their IP
 address to avoid being blocked by security products such as firewalls 
and IPS? If you check the IP address, you will see that it belongs to 
Cloudflare. Since WordPress has a partnership with Cloudflare, it is 
quite normal that Cloudflare would be the source of the request.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Detecting+Web+Attacks/images/xss-apache-access-log-date.png)

Now, if we look at the dates of the requests, we see that a request 
was made every 3-4 seconds. It is not really possible for a human to try
 to enter that many XSS payloads in such a short time, but it still 
doesn't mean you can be sure that the number of requests made per second
 is excessive. Because we have the user-agent information in this 
example, our job is easier. Once we check the information, we see that 
it belongs to a urllib library. This indicates that these requests were 
made by an automated vulnerability scanner tool.

So was the attack successful?

Without access to the responses, we cannot be sure.

As a result of our investigations:

1. It is clear that the attack was aimed at the web application where the access logs came from.
2. Looking at the number of requests and the user agent information, we determined that the attack was carried out by an automated
vulnerability scanner.
3. As the application is hosted behind Cloudflare, the source IP addresses were not found.
4. We do not know if the attack was successful or not.

