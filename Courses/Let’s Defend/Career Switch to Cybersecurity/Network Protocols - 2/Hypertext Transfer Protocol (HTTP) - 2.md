---
tags:
  - networking
  - http
  - course/lets-defend
---

# Hypertext Transfer Protocol (HTTP) - 2


## HTTP Response Headers

The sections in the HTTP response sent in response to the HTTP 
request are called response headers. Some of these headers, which are 
included in the HTTP response, are as follows:

1. **Date**

It is the header that indicates the date and time of the HTTP response sent in response to the HTTP request.

1. **Server**

It is the header that contains the server name and sometimes the version information.

1. **Last-Modified**

It is the header that shows the date of the last change made on the resource on the server.

1. **Content-Encoding**

It is the header that tells which encoding algorithms the content sent by the server applies.

1. **Content-Length**

It is the header where the size of the body part in the response sent by the server to the client is informed.

1. **Connection**

It is the header that informs the client whether the network connection will be open at the end of the process.

1. **Content-Type**

It is the header in which the type of content sent to the client is declared.

Some of the HTTP response headers are given above. You can find the 
list and details of the response headers of the HTTP protocol at the 
following address:

**HTTP Response Headers**: [https://en.wikipedia.org/wiki/List_of_HTTP_header_fields](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields)

## HTTP Response Status Codes

HTTP protocol informs the client by using some status codes in 
response messages. Some of these response status codes are as follows:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/6.Hypertext+Transfer+Protocol+(HTTP)+-+2/httpprotocol1.png)

In the image above, some of the HTTP response status codes are 
included. You can find the list and details of the response status codes
 of the HTTP protocol at the following address:

**HTTP Response Status Codes**: [https://en.wikipedia.org/wiki/List_of_HTTP_status_codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)

## HTTP Security Headers

HTTP protocol uses security headers to provide security. Some of these headers are as follows:

- Strict-Transport-Security
- Content-Security-Policy
- X-Frame-Options

**Note**: Although the HTTP protocol tries to provide 
security by using security headers, it is of particular importance that 
the traffic is transmitted as encrypted. They are SSL/TLS protocols that
 provide encrypted transmission of traffic. The specific name of the 
HTTP protocol, which uses SSL/TLS protocols, is HTTPS.

You can find a detailed explanation of SSL/TLS protocols in the cryptology training: [Introduction to Cryptology](https://app.letsdefend.io/training/lessons/introduction-to-cryptography)

## HTTP Protocol Review with Wireshark

There are some tools with a graphical user interface (GUI) that allow
 network packets to be examined in detail. One of these tools is the 
"Wireshark" tool.

You can download the Wireshark tool from the following address:

**Wireshark:** [https://www.wireshark.org/download.html](https://www.wireshark.org/download.html)

In the images below, HTTP request headers and HTTP response headers 
are seen when the network packets of the HTTP protocol are examined over
 Wireshark:

**Note:** You can access the pcap file in the example from the "Course Files" area at the end of the course.

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/6.Hypertext+Transfer+Protocol+(HTTP)+-+2/httpprotocol2.png)

As seen in the image above, a window with HTTP request and response 
headers can be opened by following the "Follow" and "HTTP Stream" steps,
 respectively:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/6.Hypertext+Transfer+Protocol+(HTTP)+-+2/httpprotocol3.png)

As seen in the image above, HTTP request headers, HTTP response 
headers, and body fields in the traffic of HTTP protocol were 
successfully displayed.

In this part of the training, HTTP response headers, HTTP response 
status codes, and HTTP protocol review on Wireshark are discussed. In 
the next part of the training, the subject of “Dynamic Host 
Configuration Protocol (DHCP)” is discussed.

