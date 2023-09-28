# Week Four: Transport Layer: TCP and UDP

## Review Questions

### R5: Why is it that voice and video traffic is often sent over TCP rather than UDP in today’s Internet?
Many organizations block UDP for security reasons and if packet loss rates are high enough to impact multimedia performance, it makes sense to use TCP in this case even if throttling with impact the traffic.
***
### R7: Suppose a process in Host C has a UDP socket with port number 6789. Suppose both Host A and Host B each send a UDP segment to Host C with destination port number 6789. Will both of these segments be directed to the same socket at Host C? If so, how will the process at Host C know that these two segments originated from two different hosts?

***
### R8: Suppose that a Web server runs in Host C on port 80. Suppose this Web server uses persistent connections, and is currently receiving requests from two different Hosts, A and B. Are all of the requests being sent through the same socket at Host C? If they are being passed through different sockets, do both of the sockets have port 80? Discuss and explain.

***
### R9: In our rdt protocols, why did we need to introduce sequence numbers?

***
### R10: In our rdt protocols, why did we need to introduce timers?

***
### R11: Suppose that the roundtrip delay between sender and receiver is constant and known to the sender. Would a timer still be necessary in protocol rdt 3.0, assuming that packets can be lost? Explain.

***
### R15: Suppose Host A sends two TCP segments back to back to Host B over a TCP connection. The first segment has sequence number 90; the second has sequence number 110.
**a. How much data is in the first segment?**<br>
**b. Suppose that the first segment is lost but the second segment arrives at B. In the acknowledgment that Host B sends to Host A, what will be the acknowledgment number?**

***
## Problems
### P3: UDP and TCP use 1s complement for their checksums. Suppose you have the following three 16 bit words: 0101001101100110; 0111010010110100; 0000110111000001. What is the 1s complement of the sum of these words? Show all work. Why is it that UDP offers a checksum? With the 1’s complement scheme, how does the receiver detect errors? Describe how a single bit flip can be detected.
