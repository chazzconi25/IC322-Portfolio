# Week Two: The Application Layer

## Review Questions

### R5: What information is used by a process running on one host to identify a process running on another host?
Two things are needed to indentify a process running on another host, the IP address of the host and an identifier that specifies the recieving process in the destination host.

The server is first identified by its IP addess, a 32-bit number quantity that is unique to that host.

Once the process's message from the first host/client gets to the second host/server it must identify which process and its respective socket to go to. This is done via the port number. The port number idenitfies exactly which process on the servers machine should recive the message.
***
### R8: List the four broad classes of services that a transport protocol can provide. For each of the service classes, indicate if either UDP or TCP (or both) provides such a service.

| Class of service       | UDP | TCP |
| ---------------------- |:---:|:---:|
| Reliable data transfer | ❌ | ✅ |
| Throughput             | ✅ | ❌ |
| Timing                 | ❌ | ❌ |
| Security               | ❌ | ✅ <br>(With TLS) |
***
### R11: What does a stateless protocol mean? Is IMAP stateless? What about SMTP?
Stateless protocols do not keep track of any "state information" about clients. IMAP is stateful since it needs to maintain information on each users filesystem. SMTP is not stateful because no information is retained about clients.
[Here is a link to information on IMAP and SMTP statlessness since it is not in the book](http://web.eecs.utk.edu/~hqi/teaching/ece453f06/hw/hw8_sol.htm)
***
### R12: How can websites keep track of users? Do they always need to use cookies?
To identify users the websites must use cookies where a number is assigned to a client's browser by a server and then the browser sends the number identifying itself to the server. Becasue HTTP servers are stateless they cannot keep track of clients just with http and cookies are required. 
***
### R13: Describe how Web caching can reduce the delay in receiving a requested object. Will Web caching reduce the delay for all objects requested by a user or for only some of the objects? Why?
Web caching relies on a client first requesting Objects from the web cache before requesting them from the server they are stored. The web cache has a higher speed connection than the server where the Object exsists. If there is a copy in the cache, requesting and recieving the Object from the cach is reduces delay by increasing the speed between client and server and reducing the traffic on an access link. This is not true for all objects however because if there isn't a copy of the object already existing in the server, the cache will then have to request the object from the acual server, copy it, and serve it to the client.

***
### R14: Telnet into a Web server and send a multiline request message. Include in the request message the If-modified-since: header line to force a response message with the 304 Not Modified status code.
This question is impossible. [Click here to see what I typed into telent and what I got back. Spent an enourmous amount of time on this and now I'm just pissed off.](/ihatetelnet.txt)
***
### R26: In Section 2.7, the UDP server described needed only one socket, whereas the TCP server needed two sockets. Why? If the TCP server were to support n simultaneous connections, each from a different client host, how many sockets would the TCP server need?

The TCP server requires one socket for welcoming the connection for the three way handshake called the *serverSocket* and then the second is dedicated to the specific client requesting files called the *connectionSocket*.

The server would need n + 1 sockets. One for the serverSocket and then n more for n clients connectionSockets.
