# Week Five: Transport Layer

## Review Questions

### R17: Suppose two TCP connections are present over some bottleneck link of rate R bps. Both connections have a huge file to send (in the same direction over the bottleneck link). The transmissions of the files start at the same time. What transmission rate would TCP like to give to each of the connections?

If the bottleneck is $R$ then that is the maximum bandwidth TCP can give either connection. In this scenario TCP would give each connection $\frac{R}{2}$ throughput.

***

### R18: True or false? Consider congestion control in TCP. When the timer expires at the sender, the value of ssthresh is set to one half of its previous value

False, the new value is one half of cwind.

***

## Problems

### P27: Host A and B are communicating over a TCP connection following RFC 5681. Host B has already received from A all bytes up through byte 96. Suppose Host A then sends two segments to Host B back-to-back. The first and the second segments contain 40 and 80 bytes of data, respectively. In the first segment, the sequence number is 97, the source port number is 302, and the destination port number is 80

*Host B sends an acknowledgment whenever it receives a segment from Host A.*  
**a.** In the second segment sent from Host A to B, what are the sequence number, source port number, and destination port number?  

```text
Seq Number = 207
Source Port = 302
Destination Port = 80
```

**b.** If the first segment arrives before the second segment, in the acknowledgment of the first arriving segment, what is the acknowledgment number,
the source port number, and the destination port number?

```text
ACK Number = 207
Source Port = 80
Destination Port = 302
```

**c.** If the second segment arrives before the first segment, in the acknowledgment of the first arriving segment, what is the acknowledgment number?

```text
ACK Number = 97
```

**d.** Suppose the two segments sent by A arrive in order at B. The first acknowledgment arrives after the first timeout interval. Draw a timing diagram.  
![problem four diagram](img\timing_diagram.jpg)

***

### P33: In Section 3.5.3, we discussed TCP’s estimation of RTT. Why do you think TCP avoids measuring the SampleRTT for retransmitted segments?

The retransmitted segments look the same as the original segments sent in that they have the same ACK and sequecnce numbers. If we recieved an ACK then we do not know if it was from the original send or the resend so the value of SampleRTT could be set to a value that we cannot verify as the actual SampleRTT. If we set it to a small number because we get an ACK quickly it may be that the resend did come back fast. It is also that the orignal send is just now coming back and now RTT will be far too small.

***

### P36: In Section 3.5.4, we saw that TCP waits until it has received three duplicate ACKs before performing a fast retransmit. Why do you think the TCP designers chose not to perform a fast retransmit after the first duplicate ACK for a segment is received?

If every duplicate ACK was acknowledged then too many resent packets would be sent over the network causing extra, unneded congestion. This could also cause more duplicate ACKs leading to a loop and more congestion.

***

### P40: Consider Figure 3.61. Assuming TCP Reno is the protocol experiencing the behavior shown above, answer the following questions. In all cases, you should provide a short discussion justifying your answer

![Figure 3.61](img\image.png)  
**a.** Identify the intervals of time when TCP slow start is operating.
TCP Slow: 1 - 6 & 23 - 26  
**b.** Identify the intervals of time when TCP congestion avoidance is operating.
TCP congestion avoidance: 6 - 22  
**c.** After the 16th transmission round, is segment loss detected by a triple duplicate ACK or by a timeout? 
Triple duplicate ACK  
**d.** After the 22nd transmission round, is segment loss detected by a triple duplicate ACK or by a timeout?
Timeout  
**e.** What is the initial value of ssthresh at the first transmission round?
ssthresh: 33  
**f.** What is the initial value of ssthresh at the 18th transmission round?
ssthresh: 21  
**g.** What is the value of ssthresh at the 24th transmission round?
ssthresh: 14  
**h.** During what transmission round is the 70th segment sent?
8
**h.** Assuming a packet loss is detected after the 26th round by the receipt of a triple duplicate ACK, what will be the values of the congestion window size and of ssthresh?
4
**i.** Suppose TCP Tahoe is used (instead of TCP Reno), and assume that triple duplicate ACKs are received at the 16th round. What are the ssthresh and the congestion window size at the 19th round?
16th: 12
19th: 15
**j.** Again, suppose TCP Tahoe is used, and there is a timeout event at the 22nd round. How many packets have been sent out from the 17th round till the 22nd round, inclusive?
64