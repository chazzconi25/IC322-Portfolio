# Week Three: The Application Layer (Other than HTTP)

## Learning Goals

### I can explain how a the DNS system uses local, authoritative, TLD, and root servers to translate a domain name into an IP address

The DNS system makes use of multiple layers of servers to prevent them having one point of failure of domain resolution, control the traffic volume of requests, allow worldwide hosts to have a nearby server, and allows each individual layer of servers to be maintained individually to add new hosts

```text
    Root Server
    3 ↑  | 4
      |  ↓
    TLD Server
     2↑  | 5
      |  ↓     6
     Local  -----> Authoritative       
     Server <----- Server
     1↑  |      7
      |  ↓8 
      Host
```

The diagram above shows an example of how local, authoritative, TLD, and root servers can be used to translate a domain name into an IP address.  

**(1)** Hosts request domain information from their local DNS server. **(2)** The local DNS server then requests an IP from the TLD server. **(3)** The TLD then requests from the root. **(4-5)** The host's request is then resolved here at the top of the diagram to an authoritative DNS and IP information is passed down to an authoritative server. **(7-8)** The information is then resolved and passed back to the local server and then the host.

### I can explain the role of each of the following DNS record types: A, AAAA, CNAME, MX, NS

A resource record is a list known as a four-tuple that contains fields for name, value, type, and TTL. For each of the following classes the values are named the same thing but have different meanings depending on the type. In the table below each record is listed at the top with a coinciding part of the four tuple listed on the left. The final row describes the role of the record type.

|  Type |   A   |  NS | CNAME |   MX  |   AAAA*  |
|:-:|:-----:|:-----:|:-----:|:-----:|:-----:|
| Name  |  Hostname | Domain | Alias hostname | Alias hostname for canonical name of a mail server | Domain name |
| Value | IP address for the hostname | Host name of an authoritative DNS server that can obtain IP addresses for hosts within the domain in the name | Canonical hostname of the alias hostname in name | Canonical name of a mail server for the alias hostname in name | IP address for the domain name |
| Purpose |  Provides standard hostname-to-IP mapping | Provides directions to DNS queries to move them further along the query chain | Provides querying hosts the canonical name for a host name. Used by DNS clients to acces any canonical name for a server that isnt a mail server | Primarily used for company's that need to have an alias name for its mail server and for its web server. DNS clients can query for this record to get the canonical name of the mail server | Essentially the same as A records but for IPv6 where A is for IPv4 |


[Note that the informaton for AAAA was not in the textbook so I found it on this website.](https://www.plesk.com/wiki/aaaa-record/#:~:text=A%20and%20AAAA%20records%20arecorresponds%20to%20an%20IPv6%20address.)
<!---**because screw me right!---->

<details>
<summary>Note, TTL is left out, click to see why</summary> Because it is the *time to live* of the resource record and is used for determining if a resource should be taken from a cache and the textbook didn't describe it so I dont know why I should have to if the literal PHDs of the book decided not to.
</details>

### I can explain the role of the SMTP, IMAP, and POP protocols in the email system

#### SMTP - Simple Mail Transfer Protocol

The primary usage of SMTP is to carry out the transfer of electronic mail from one mail server's outgoing message queue to another users mailbox on a different mail server. Mail servers are the core of email and SMTP connects them. SMTP uses TCP so that reliable data transfer is acheived between mail servers. SMTP does *not* use intermediate servers to transfer mail. This means that when a mail server is down, all mail sent to it will stay on the server of the sender.

#### IMAP - Mail Access Protocol

Email is made up of user agents, mail servers, and SMTP. SMTP facilitates the transmission of mail between mail servers. Once in a server or to get to a server a user uses a user agent like gmail. In order for the user to be able to view their inbox and send messages to be transfered to their outgoing message queue in the mail server the user agent needs to be able to communicate with the mail server. This is done through IMAP or HTTP and allows the user to manage folders and send mail from their user agent.

> Apparenly IMAP is just as good as HTTP by the way so why would anyone waste their time with this junk. If you ask me I bet that IMAP isn't used by anyone and HTTP is way more common because its gmail. So me learning about this was a huge waste of time. Like fr, what kind of grandpa uses Outlook. Everything is in JS nowadays and normal people use gmail.

#### POP - Post Office Protocol

POP is just like IMAP in that it allows a user agent to communicate with the mail server. The major difference between IMAP and POP is that POP downloads entire emails while IMAP shows the message header before downloading. POP doesn't allow you to organize emails in your mail server mailbox while IMAP does. Finally, POP downloads emails and then deletes them while IMAP stores the email and then syncs it on multiple devices.

> I dont believe it! Somehow they made something even worse than IMAP even thought HTTP which is perfectly good works. I guess POP is good if you have a tiny mail server because it delets the emails there but I doubt literally anyone ever has had that problem since the dinosaurs.

[Note that POP was not in the textbook as well so I found it on this website.](https://www.plesk.com/wiki/aaaa-record/#:~:text=A%20and%20AAAA%20records%20are,corresponds%20to%20an%20IPv6%20address.)

### I know what each of the following tools are used for: nslookup, dig, whois

|   nslookup   |     dig*     |    whois*    |
|--------------|-------------|-------------|
| Used to send a DNS query to any DNS server at any level. After sending the command displays all of the records that were included in the reply.  | DNS lookup utility that preforms DNS lookups and displays the answers that are returned from the name servers that were queried.  | "whois searches for an object in a RFC 3912 database. This version of the whois client tries to guess the right server to ask for the specified object. If no guess can be  made  it  will  connect  to  whois.networksolutions.com  for  NIC  handles  or whois.arin.net for IPv4 addresses and network names." - the unix man pages |

> *Once again, not in the textbook! Got this from the man pages. Very annoying!