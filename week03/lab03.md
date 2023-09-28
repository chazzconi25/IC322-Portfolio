# Week Three: The Application Layer (Other than HTTP)

## Lab: Wireshark DNS

### Introduction
The objective of this lab was to make DNS requests using nslookup and via the browser and view them in Wireshark. In Wireshark the DNS queries and responses could be dissected to produce useful information about the type of request, how it was made, and what servers respoded with what information.
### Collaboration
No collaboration.
### Process
I used the instructions in the lab linked [here](https://gaia.cs.umass.edu/kurose_ross/wireshark.php).
I didn't have to use a trace file which was actually quite refreshing and I actually enjoyed doing the lab.

### Questions
#### nslookup
***
1. Run nslookup to obtain the IP address of the web server for the Indian Institute of Technology in Bombay, India: www.iitb.ac.in. What is the IP address of www.iitb.ac.in
```console
~$ nslookup www.iitb.ac.in
Server:         10.1.74.10
Address:        10.1.74.10#53 

Non-authoritative answer:
Name:   www.iitb.ac.in
Address: 103.21.124.10 <---- this is the IPv4 Address.
```

2. What is the IP address of the DNS server that provided the answer to your nslookup command in question 1 above?
```console
~$ nslookup www.iitb.ac.in
Server:         10.1.74.10 <---- this is the IPv4 Address of the DNS server.
Address:        10.1.74.10#53   <---- This one includes the port number for DNS, 53. NEATO!

Non-authoritative answer:
Name:   www.iitb.ac.in
Address: 103.21.124.10 
```

3. Did the answer to your nslookup command in question 1 above come from an authoritative or non-authoritative server?
- It came from a non authoritative server. I know this because it lists the answer under the heading ```Non-authoritative answer:```.

4. Use the nslookup command to determine the name of the authoritative name server for the iit.ac.in domain. What is that name? (If there are more than one authoritative servers, what is the name of the first authoritative server returned by nslookup)? If you had to find the IP address of that authoritative name server, how would you do so?
```console
~$ nslookup -type=NS www.iitb.ac.in
Server:         10.1.74.10
Address:        10.1.74.10#53

Non-authoritative answer:
*** Can't find www.iitb.ac.in: No answer

Authoritative answers can be found from:
iitb.ac.in
        origin = dns1.iitb.ac.in <------- Authoritative name server name
        mail addr = postmaster.iitb.ac.in
        serial = 2013071001
        refresh = 16384
        retry = 2048
        expire = 1048576
        minimum = 3960
```

#### The DNS cache on your computer
***
>This section had no questions. That means I didn't have to do it! Just kidding. I may hate this class but I really enjoy the material.

#### Tracing DNS with Wireshark
***
5. Locate the first DNS query message resolving the name gaia.cs.umass.edu. What is the packet number in the trace for the DNS query message? Is this query message sent over UDP or TCP?
- The packet number is 35. This number is made up for the context of this single wire shark capture I made myself so I don't know why you want it. The query message is sent over ```User Datagram Protocol, Src Port: 61474, Dst Port: 53``` aka UDP.

6. Now locate the corresponding DNS response to the initial DNS query. What is the packet number in the trace for the DNS response message? Is this response message received via UDP or TCP?
- The packet number is 36. The response is recieved via UDP.

7. What is the destination port for the DNS query message? What is the source port of the DNS response message?
Query: ```Destination Port: 53``` <br>
Response: ```Source Port: 53```

8. To what IP address is the DNS query message sent?<br>
```10.1.74.10``` This is the IP of my local DNS.
9. Examine the DNS query message. How many “questions” does this DNS message contain? How many “answers” answers does it contain?
- One question or "Query" is sent, ```gaia.cs.umass.edu: type A, class IN```

10. Examine the DNS response message to the initial query message. How many “questions” does this DNS message contain? How many “answers” answers does it contain?
- Once again one query is sent which is the same from the query is sent.
- The response contains one Answer which contains the IP address requested ```gaia.cs.umass.edu: type A, class IN, addr 128.119.245.12```

11. The web page for the base file http://gaia.cs.umass.edu/kurose_ross/ references the image object http://gaia.cs.umass.edu/kurose_ross/header_graphic_book_8E_2.jpg , which, like the base webpage, is on gaia.cs.umass.edu. What is the packet number in the trace for the initial HTTP GET request for the base file http://gaia.cs.umass.edu/kurose_ross/?
What is the packet number in the trace of the DNS query made to resolve gaia.cs.umass.edu so that this initial HTTP request can be sent to the gaia.cs.umass.edu IP address? 
What is the packet number in the trace of the received DNS response? 
What is the packet number in the trace for the HTTP GET request for the image object http://gaia.cs.umass.edu/kurose_ross/header_graphic_book_8E2.jpg? 
What is the packet number in the DNS query made to resolve gaia.cs.umass.edu so that this second HTTP request can be sent to the gaia.cs.umass.edu IP address? 
Discuss how DNS caching affects the answer to this last question.
- The packet number of the GET request is 41.
- The original DNS query number is 35.
- The DNS response number is 36.
- The packet number for the jpg GET request is 134.
- There isn't a second DNS resolution because the domain has already been resolved and stored in the cache

>NOT COOL. This is like 20billion questions in one question what the hek.
12. What is the destination port for the DNS query message? What is the source port of the DNS response message?
- The query destination port is 53.
- The response source port is 53.

13. To what IP address is the DNS query message sent? Is this the IP address of your default local DNS server?
- The destination address is 10.1.74.10
```
Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : academy.usna.edu
   Description . . . . . . . . . . . : Realtek USB GbE Family Controller
   Physical Address. . . . . . . . . : 48-9E-BD-22-12-1E
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes
   IPv4 Address. . . . . . . . . . . : 10.16.146.82(Preferred)
   Subnet Mask . . . . . . . . . . . : 255.255.254.0
   Lease Obtained. . . . . . . . . . : Wednesday, September 27, 2023 20:13:50
   Lease Expires . . . . . . . . . . : Thursday, October 5, 2023 20:13:47
   Default Gateway . . . . . . . . . : 10.16.146.1
   DHCP Server . . . . . . . . . . . : 10.1.74.10
   DNS Servers . . . . . . . . . . . : 10.1.74.10 <--ipconfig return proves it is my default DNS server.
   NetBIOS over Tcpip. . . . . . . . : Enabled
```

14. Examine the DNS query message. What “Type” of DNS query is it? Does the query message contain any “answers”?
- The request is asking for an IP address so it is a type A request.
- The query message has no answers.

15. Examine the DNS response message to the query message. How many “questions” does this DNS response message contain? How many “answers”?
- See answer 9.

16. To what IP address is the DNS query message sent? Is this the IP address of your default local DNS server?
- The DNS query is sent to 10.1.74.10.

17. Examine the DNS query message. How many questions does the query have? Does the query message contain any “answers”?
- The message has one question and no answers.

18. Examine the DNS response message. How many answers does the response have? What information is contained in the answers? How many additional resource records are returned? What additional information is included in these additional resource records?
- The response has Three answers with three dns servers the additional information is listed below with the tuples of each record listed.
```
Answers
    umass.edu: type NS, class IN, ns ns1.umass.edu
        Name: umass.edu
        Type: NS (authoritative Name Server) (2)
        Class: IN (0x0001)
        Time to live: 3581 (59 minutes, 41 seconds)
        Data length: 6
        Name Server: ns1.umass.edu
    umass.edu: type NS, class IN, ns ns3.umass.edu
        Name: umass.edu
        Type: NS (authoritative Name Server) (2)
        Class: IN (0x0001)
        Time to live: 3581 (59 minutes, 41 seconds)
        Data length: 6
        Name Server: ns3.umass.edu
    umass.edu: type NS, class IN, ns ns2.umass.edu
        Name: umass.edu
        Type: NS (authoritative Name Server) (2)
        Class: IN (0x0001)
        Time to live: 3581 (59 minutes, 41 seconds)
        Data length: 6
        Name Server: ns2.umass.edu
[Request In: 34]
[Time: 0.001067000 seconds]
```

