# Week Three: The Application Layer (Other than HTTP)

## Review Questions

### R16: Suppose Alice, with a Web-based e-mail account (such as Hotmail or Gmail), sends a message to Bob, who accesses his mail from his mail server using IMAP. Discuss how the message gets from Alice’s host to Bob’s host. Be sure to list the series of application-layer protocols that are used to move the message between the two hosts

If alice is using a web based e-mail account like a normal person and like everyone else ever then (unless she really is using hotmail like an insane axe murder) the protocol used to communicate from her mail client, gmail, to her mail server is http. Using http the web based mail client sends the email to alices outgoing message queue in her mail server. There the mail server will try to send the mail to bobs mail server over SMTP and THROUGH NO OTHER MAIL SERVERS SO HELP ME GOD. If the mail doesn't go through alices server will keep trying about every thrity minutes. Once it finally gets to bobs mail server it sits on the server in his mailbox. Because bob is clearly an lunatic boomer who uses outlook his garbage mail client will use IMAP to get the message from the mail server to his inbox.

If you didn't follow that here's a diagram :

```text
Alice
|
Fingers on keyboard <- transmission methods are within arrows
\/
gmail
|
HTTP
\/
Alice mail server <- locations are on the points of arrows
|
SMTP
\/
Bob mail server
|
IMAP
\/
Outlook or some other 
boomer mail client 
|
bobs crusty eyeballs
\/
bob's smooth brain
```

***

### R18: What is the HOL blocking issue in HTTP/1.1? How does HTTP/2 attempt to solve it?

Sending all of the objects in a web page over a single TCP connection causes larger elements in an html page to get caught in bottleneck links causing the entire page to take a long time to load regardless of how small the rest of the page is. This problem is soved in HTTP 1.1 by the browser opening up multiple parallel TCP connections. The problem with this is that now there are a lot of socekts dedicated to just one web page.

HTTP/2 solves this probkem by breaking the message into small frames and then interleaving the requests and responses from the client and server on the same TCP connection. So one web page has multiple requests for parts of a page that build the page in parallel and decreases user-precieved delay.
***

### R24: CDNs typically adopt one of two different server placement philosophies. Name and briefly describe them

Third party CDNs typically follow a philsophy of **Enter Deep** or **Bring Home**.

1. Enter Deep CDNs deploy servers in access ISPs wordlwide and get close to clients.
2. Bring Home focuses on smaller clusters of servers and is cheaper to implement.

***

## Problems

### P16: How does SMTP mark the end of a message body? How about HTTP? Can HTTP use the same method as SMTP to mark the end of a message body? Explain.

SMTP uses a line containing just a period to indicate the end of a line as indicated in the texbook example:
```
S:  354 Enter mail, end with ”.” on a line by itself
C:  Do you like ketchup?
C:  How about pickles?
C:  .
S:  250 Message accepted for delivery
```
HTTP uses a header that indicates the length of the message to end its body. HTTP cannot use just a period because SMTP is super old and based on ASCII-7 which is not compatible with HTTP.
***

### P18:

#### a. What is a whois database?

["WHOIS is a public database that houses the information collected when someone registers a domain name or updates their DNS settings."](https://www.domain.com/blog/what-is-whois-and-how-is-it-used/#:~:text=WHOIS%20is%20a%20public%20database,days%20of%20the%20early%20Internet.)

#### b. Use various whois databases on the Internet to obtain the names of two DNS servers. Indicate which whois databases you used.

I used whois.markmonitor.com to find that google.com uses name server ns1.google.com
I used whois.com to find that youtube.com uses name server ns2.google.com
***

### P20: Suppose you can access the caches in the local DNS servers of your department. Can you propose a way to roughly determine the Web servers (outside your department) that are most popular among the users in your department? Explain

I would take data from the cache of the local DNS server table multiple times over the course of a week. Then from this data I would look at the servers that continuously appear in the cache each day. These entires are not expiring because people keep accessing them leading to me to believe that they are visited often.

***

### P21: Suppose that your department has a local DNS server for all computers in the department. You are an ordinary user (i.e., not a network/system administrator). Can you determine if an external Web site was likely accessed from a computer in your department a couple of seconds ago? Explain

Using the dig tool you can see the query time for a supplied domain. If you dig the external web site and the time for the query is 0 then the query is stored in the cache and someone has recently accessed the website, hence why it is stored in the cache and querying is fast.
***
