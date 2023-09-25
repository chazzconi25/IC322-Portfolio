# Week Two: The Application Layer

## Learning Goals

### I can explain the HTTP message format, including the common fields.

The HTTP message format defines the type and delivery method of and HTTP request. The infomation must be structured according to specifications defined by the IETF. Messages can vary greatly in size and header length. Generally all requests are for an http resource from the server but the header can contain significantly more information about how the request should be processed. Similarily for responses, the header's response code will vary in significance as do the following fields and data that is sent. 

There are two types of HTTP message formats, request messages and response messages.

#### Request message format
<code><pre>
GET /somedir/page.html HTTP/1.1             | Request Line
Host: www.someschool.edu                    | Header line 1 
Connection: close                           | Header line 2
User-agent: Mozilla/5.0                     | Header line 3
Accept-language: fr                         | Header line 4
</pre></code>

All request messages contain a request line as the first line. There are three fields needed for this line:


#### Response message format
<code><pre>
HTTP/1.1 200 OK                             |
Connection: close                           |
Date: Tue, 18 Aug 2015 15:44:04 GMT         |
Server: Apache/2.2.3 (CentOS)               |
Last-Modified: Tue, 18 Aug 2015 15:11:03 GMT|
Content-Length: 6821                        |
Content-Type: text/html                     |
(data data data data data ...)              |
</pre></code>

### I can explain the difference between HTTP GET and POST requests and why you would use each.

### I can explain what CONDITIONAL GET requests are, what they look like, and what problem they solve.

### I can explain what an HTTP response code is, how they are used, and I can list common codes and their meanings.

### I can explain what cookies are used for and how they are implemented.

### I can explain the significance HTTP pipelining.

### I can explain the significance of CDNs, and how they work.
