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

All request messages contain a request line as the first line. There are three fields needed for this line: the method, URL, and HTTP version. The URL is the path of the object requested on the server. The method is used to request an object in a certain manner most of the time. Version is the version of the browsers HTTP.

The following header lines specify different aspects of the request:
Line 1: Indentifies the host of the resoruce this is neccisary for web proxy caches.
Line 2: Lets the server know that it can rest after sending the specific object to the browser.
Line 3: Identifies the browser sending the request to the server incase there is a different way the object should be presented based on the browser.
Line 4: Tells the server the clients prefered language for the requested resource.


#### Response message format
<code><pre>
HTTP/1.1 200 OK                             | Status Line
Connection: close                           | Header line 1
Date: Tue, 18 Aug 2015 15:44:04 GMT         | Header line 2
Server: Apache/2.2.3 (CentOS)               | Header line 3
Last-Modified: Tue, 18 Aug 2015 15:11:03 GMT| Header line 4
Content-Length: 6821                        | Header line 5
Content-Type: text/html                     | Header line 6
(data data data data data ...)              | Entity Body
</pre></code>

The first line, the Status Line, lets the client know how the server processed the request. In this example the server uses the same version of HTTP and the request was processed properly. More information on other status codes in this line are listed below.

The following header lines specify different aspects of the response:
Line 1: The server is going to close the TCP connection after sending this message.
Line 2: The time and date the server created this HTTP response.
Line 3: the type of web server that generated the request, this is similar to a clients browser.
Line 4: The time and date this object was last modified
Line 5: The number of bytes in the object being sent.
Line 6: The type of object in the entity body - in this case, an html document.

Finally, after all of the header information, if the request was good, the data to the actual object being sent is put into the message!

### I can explain the difference between HTTP GET and POST requests and why you would use each.

A POST request is typically used when a user fills out a form on a requested object from a server. In this method, the entity body contains what the user entered into the form. A GET request is also typically used for forms but when a GET request is sent the URL contains what the user entered into the form. The difference in where the information in the request is very important. In GET requests all one user would need to share a specific forms values, for example the link to a specific search in google, with another user is the URL. In a POST request it would be much more difficult to encode this infromation. This is a benefit of POST however. Because form fields are not in the URL, POST requests are good for if a user is submitting private information like a password. 


### I can explain what CONDITIONAL GET requests are, what they look like, and what problem they solve.
CONDITIONAL GET requests are used to prevent a user from getting a stale copy of a resource from a network cache. If a cache has copied an object it may want to return that immediatly and quickly to the user but a conditional get ensures that the resource is current to what the sever may have updated. When the cache goes to return a resource it first checks with the server if the object has been updated within a certain time frame as compared to the version in the cache using CONDITIONAL GET. If the object is unmodified the server sends a 304 Not Modified response, letting the cache forward its copy.

Example
<code><pre>
GET /midn/m251806.png HTTP/1.1
Host: www.usna.edu
If-modified-since: Wed, 9 Sep 2015 09:23:24
</pre></code>
CONDITIONAL GET requests ensure that network caches can send quickly but keep their stores updated properly.


### I can explain what an HTTP response code is, how they are used, and I can list common codes and their meanings.
An HTTP Response code is the first line in an HTTP response letting the client know some basic information that defines what the server did with its request. Each sitiuation the requesst can encounter is defined by a three digit response code.
|   Code   |                  Response                 |
|:--------:|:-----------------------------------------:|
|   200    |              OK - Request successful     |
|   201    |         Created - Resource created       |
|   204    |     No Content - Request processed, no content to return |
|   400    |     Bad Request - Invalid request       |
|   401    |     Unauthorized - Authentication required |
|   403    |     Forbidden - Access denied            |
|   404    |     Not Found - Resource not found      |
|   500    |     Internal Server Error - Server error |

[Table made with GPT help](https://chat.openai.com/c/d6426b13-ad2a-46ec-b2e0-8d733c9537cb)

### I can explain what cookies are used for and how they are implemented.
Cookies are used by servers to identify clients in stateless transmissions. The servers do this by giving users numbers to identify themselves and then telling client's browsers to set the cookies and send them every time they send an HTTP request. This is implmented using the Set-cookie line in the header the first time a client access a server. The server responds with the clients new number. When the client requests again it adds a header line with the cookie and its number.

### I can explain the significance HTTP pipelining.
HTTP pipelining is primarily used for open TCP requests where requests for objects are made back to back. Pipelining allows the client to not wait for replies to pending requests. This is significant because a client can request a bunch of data fast without worrying about if it will actually get the data.
Piplining also significantly shortens the amount of time the TCP connection is open. (see graphic from Wikipedia below)
<a href ="https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/HTTP_pipelining2.svg/1280px-HTTP_pipelining2.svg.png"></a>

### I can explain the significance of CDNs, and how they work.
A CDN or Content Distribution Network, manages servers in geographically distributed locations and stores copies of web data in it servers and then routes traffic to optimize users requests. There are two types of CDNs, private and third party. Private CDNs manage the content for the provider itself and no other servers. A third party CDN distributes content for multiple server hosts with different data. Third party CDNs typically follow a philsophy of Enter Deep or Bring Home. Enter Deep CDNs deploy servers in access ISPs wordlwide and get close to clients. Bring Home focuses on smaller clusters of servers and is cheaper to implement.
