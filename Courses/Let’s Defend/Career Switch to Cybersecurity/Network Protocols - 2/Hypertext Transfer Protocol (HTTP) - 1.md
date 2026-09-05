---
tags:
  - networking
  - http
  - course/lets-defend
---

# Hypertext Transfer Protocol (HTTP) - 1


## What is HTTP Protocol?

Hypertext Transfer Protocol (HTTP) is a network protocol that provides communication between client and server on the web.

## Features of HTTP Protocol

- According to the OSI model, the HTTP protocol is in the 7th Layer (Application Layer).
- It uses the TCP protocol at the transport layer.
- It has a Client-Server architecture.
- The HTTP protocol is a connectionless protocol, according to the OSI model, there is no need for connection setup at the application layer level.

## Uniform Resource Locator (URL)

Uniform Resource Locator (URL) is an address used to reach a web 
address and contains some information about the target web server in its
 structure. For example, the following image shows parts of URL 
addresses:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/5.Hypertext+Transfer+Protocol+(HTTP)+-+1/http1.png)

## HTTP Protocol Working Logic

Since the HTTP protocol has a client-server architecture and is a 
connectionless protocol, the working logic is quite simple. The HTTP 
client sends a request to the HTTP server, and the HTTP server that 
receives the request returns a response to the HTTP client. As an 
example, the “Working Principle of the HTTP Protocol” is shown in the 
image below:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/5.Hypertext+Transfer+Protocol+(HTTP)+-+1/http2.png)

(Image Source: [https://ducmanhphan.github.io/2019-02-05-HTTP-protocol/](https://ducmanhphan.github.io/2019-02-05-HTTP-protocol/))

## HTTP Messages

There are 2 basic message types of the HTTP protocol:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/5.Hypertext+Transfer+Protocol+(HTTP)+-+1/http3.png)

**HTTP Request**

The HTTP request is the message sent by the client to the HTTP server. There can be 4 sections in the HTTP request:

- Request Line
- HTTP Request Headers
- A Blank Line
- Request Message Body

For example, the sections in an HTTP request are as in the image below:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/5.Hypertext+Transfer+Protocol+(HTTP)+-+1/http4.png)

(Image Source: [https://ducmanhphan.github.io/2019-02-05-HTTP-protocol/](https://ducmanhphan.github.io/2019-02-05-HTTP-protocol/))

**HTTP Response**

The HTTP response is the message sent by the HTTP server in response 
to the HTTP request sent by the client. There can be 4 sections in the 
HTTP response:

- Status Line
- HTTP Response Headers
- A Blank Line
- Response Message Body

For example, the sections in an HTTP response are as in the image below:

![](https://letsdefend-images.s3.us-east-2.amazonaws.com/Courses/Network-Protocols-2/5.Hypertext+Transfer+Protocol+(HTTP)+-+1/http5.png)

(Image Source: [https://ducmanhphan.github.io/2019-02-05-HTTP-protocol/](https://ducmanhphan.github.io/2019-02-05-HTTP-protocol/))

## HTTP Methods

HTTP methods are protocol-specific methods defined in order to 
perform various operations on the server. Among the many HTTP methods, a
 few are described below:

1. **GET Method**

HTTP Client requests a specific web page from the server to be sent to it with the GET method.

1. **POST Method**

The POST method ensures that the data assigned to the address given 
by the URL is accepted by the server. It transmits all the data to the 
server.

1. **OPTIONS Method**

The OPTIONS method allows getting the HTTP methods supported by the server.

Some of the HTTP methods are given above. You can access the list and
 details of the methods of the HTTP protocol at the following address:

**HTTP Methods**: [https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods)

## HTTP Request Headers

One of the most basic parts of an HTTP request is request headers. Some request headers and descriptions are as follows:

1. **Host**

It is the header that contains the domain name of the server. In some
 cases, the domain name and port number may be included together.

1. **Accept**

It is the header that notifies the server of the data types accepted by the client.

1. **Accept-Language**

It is the header that notifies the server of the languages ​​that the client accepts.

1. **Accept-Encoding**

It is the header that notifies the server of the encoding algorithms 
supported by the client. Generally, this section contains the supported 
compression algorithms.

1. **Connection**

It is the header that informs the server whether the network connection will be open at the end of the process.

1. **Referer**

This header contains the information from which the address the 
request is directed. When clicking on the links of other addresses on 
the current website, this header can be added and a request can be sent.

1. **User-Agent**

With this header, the operating system information and browser information of the client is transmitted to the server.

1. **Cache-Control**

This header contains information about the control of the caching mechanism.

1. **Authorization**

It is the header that contains the credentials required for HTTP authentication.

1. **Cookie**

It is the header that contains the cookie information set by the server.

Some of the HTTP request headers are given above. You can access the 
list and details of the request headers of the HTTP protocol at the 
following address:

**HTTP Request Headers:** [https://en.wikipedia.org/wiki/List_of_HTTP_header_fields](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields)

In this part of the training, what the HTTP protocol is, its 
features, working logic, HTTP methods, and HTTP request headers are 
discussed. The next part of the training covers the continuation of the 
HTTP protocol topic.

