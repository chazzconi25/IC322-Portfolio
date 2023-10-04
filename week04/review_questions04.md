# Week Four: Transport Layer: TCP and UDP

## Review Questions

### R5: Why is it that voice and video traffic is often sent over TCP rather than UDP in today’s Internet?
- Many organizations block UDP for security reasons and if packet loss rates are high enough to impact multimedia performance, it makes sense to use TCP in this case even if throttling with impact the traffic.
***
### R7: Suppose a process in Host C has a UDP socket with port number 6789. Suppose both Host A and Host B each send a UDP segment to Host C with destination port number 6789. Will both of these segments be directed to the same socket at Host C? If so, how will the process at Host C know that these two segments originated from two different hosts?
> "if two UDP segments have different source IP addresses and/or source port numbers, but
have the same destination IP address and destination port number, then the two segments will be directed to the same destination process via the same destination socket."(Kurose 220)
- No the proecess will not know that the two segments originated from two different hosts because both segments are directed to the same process and UDP only considers the *destination* IP and port when demultiplexing.

***
### R8: Suppose that a Web server runs in Host C on port 80. Suppose this Web server uses persistent connections, and is currently receiving requests from two different Hosts, A and B. Are all of the requests being sent through the same socket at Host C? If they are being passed through different sockets, do both of the sockets have port 80? Discuss and explain.
- Because the webserver is using persistent connection with TCP the web server will shake hands with each new host through one socket and then create a new socket for each new host to maintain connection. This means that all of the request being sent by host C are going through the same socket. The are passed through the same socket and it has port 80 for the corresponding process.
***

### R9: In our rdt protocols, why did we need to introduce sequence numbers?
- The sequence numbers were used for seeing which packets were which and in what order. It was a backup to see if somthing was dropped or if we needed to wait on another sequence.
***
### R10: In our rdt protocols, why did we need to introduce timers?
The timer set a limit on the amout of time spent waiting for a certian sequence of packet to come through before tring to resend. The timer starts when a packet is sent. If it goes unaknoledged for too much time it can be inferred that it didn't arrive or the ACK is not coming.
***
### R11: Suppose that the roundtrip delay between sender and receiver is constant and known to the sender. Would a timer still be necessary in protocol rdt 3.0, assuming that packets can be lost? Explain.
- You would still need a timer but you would be able to much more accurately predict if a packet/ACK was dropped. This would make the sender more efficient and decongest the network.
***
### R15: Suppose Host A sends two TCP segments back to back to Host B over a TCP connection. The first segment has sequence number 90; the second has sequence number 110.
**a. How much data is in the first segment?**<br>
- 20 bytes because sequence numbers go up by bytes and start with the number of the first byte. Therefore 110 - 90 = 20 bytes for sequence 1.

**b. Suppose that the first segment is lost but the second segment arrives at B. In the acknowledgment that Host B sends to Host A, what will be the acknowledgment number?**
- ACK 90 becuase the host doesn't know that the segment is actually 110 and it expected to recieve 90. This will notify the sender (who just sent 110) something is wrong.
***
## Problems
### P3: UDP and TCP use 1s complement for their checksums. Suppose you have the following three 16 bit words: 0101001101100110; 0111010010110100; 0000110111000001. What is the 1s complement of the sum of these words? Show all work. Why is it that UDP offers a checksum? With the 1’s complement scheme, how does the receiver detect errors? Describe how a single bit flip can be detected.
1. Sum all of the words:
```js
          0101001101100110
        + 0111010010110100
        + 0000110111000001
        ------------------
          1100011110011011
complment:0011100001100100
```
- UDP offers a checksum for a small check to see if the data was reliable. It is expected to be not reliable so the check sum is just to confirm quickly.
- A bit flip can be found in the ones complement because if we sum the three numbers and then add to the checksum and the result is not all 1s a bit is flipped. Unfortunately, if all of the numbers flipped correctly it could cause a inappropriate confirmation.
