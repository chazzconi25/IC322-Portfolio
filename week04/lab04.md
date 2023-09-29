# Week Four: Transport Layer: TCP and UDP

## Lab: TCP

### Introduction
In this lab I examined some TCP packets and observed flag values to identify specifics about the connection and how the users wer communicating.
### Collaboration
I did not collaborate on this lab.
### Process
I used the instructions in the lab linked [here](http://gaia.cs.umass.edu/kurose_ross/wireshark.php).
### Questions
#### Capturing a bulk TCP transfer from your computer to a remote server
- No questions for this section
#### A first look at the captured trace
1. What is the IP address and TCP port number used by the client computer (source) that is transferring the alice.txt file to gaia.cs.umass.edu? To answer this question, it’s probably easiest to select an HTTP message and explore the details of the TCP packet used to carry this HTTP message, using the “details of the selected packet header window” (refer to Figure 2 in the “Getting Started with Wireshark” Lab if you’re uncertain about the Wireshark windows).
- The source IP is 192.168.86.68
```
Source Port: 55639
```

2. What is the IP address of gaia.cs.umass.edu? On what port number is it sending and receiving TCP segments for this connection?
- The IP addresss of gaia.cs.umass.edu is 128.119.245.12
```
Source Port: 80 <----------- Receiving TCP segments
Destination Port: 55639 <--- Sending TCP segments
```
#### TCP Basics
3. What is the sequence number of the TCP SYN segment that is used to initiate the TCP connection between the client computer and gaia.cs.umass.edu? What is it in this TCP segment that identifies the segment as a SYN segment? Will the TCP receiver in this session be able to use Selective Acknowledgments (allowing TCP to function a bit more like a “selective repeat” receiver, see section 3.4.5 in the text)?
```
Sequence Number: 0    (relative sequence number) <-- sequence #
Flags: 0x002 (SYN)
    /* 8 lines of flags ommitted */
    .... .... ..1. = Syn: Set <-- SYN flag identifies as SYN segment
    .... ...0 .... = Acknowledgment: Not set 
```
- No it will not be able to use selective acknoledgment because it is not set as seen in the last line above.

4. What is the sequence number of the SYNACK segment sent by gaia.cs.umass.edu to the client computer in reply to the SYN? What is it in the segment that identifies the segment as a SYNACK segment? What is the value of the Acknowledgement field in the SYNACK segment? How did gaia.cs.umass.edu determine that value?

5. What is the sequence number of the TCP segment containing the header of the HTTP POST command? Note that in order to find the POST message header, you’ll need to dig into the packet content field at the bottom of the Wireshark window, looking for a segment with the ASCII text “POST” within its DATA field4,5. How many bytes of data are contained in the payload (data) field of this TCP segment? Did all of the data in the transferred file alice.txt fit into this single segment?

6. Consider the TCP segment containing the HTTP “POST” as the first segment in the data transfer part of the TCP connection.

**a.** At what time was the first segment (the one containing the HTTP POST) in the data-transfer part of the TCP connection sent?

**b.** At what time was the ACK for this first data-containing segment received?

**c.** What is the RTT for this first data-containing segment?

**d.** What is the RTT value the second data-carrying TCP segment and its ACK?

**e.** What is the EstimatedRTT value (see Section 3.5.3, in the text) after the ACK for the second data-carrying segment is received? Assume that in making this calculation after the received of the ACK for the second segment, that the initial value of EstimatedRTT is equal to the measured RTT for the first segment, and then is computed using the EstimatedRTT equation on page 242, and a value of a = 0.125.

7. What is the length (header plus payload) of each of the first four data-carrying TCP segments?6

8. What is the minimum amount of available buffer space advertised to the client by gaia.cs.umass.edu among these first four data-carrying TCP segments7? Does the lack of receiver buffer space ever throttle the sender for these first four data-carrying segments?

9. Are there any retransmitted segments in the trace file? What did you check for (in the trace) in order to answer this question?

10. How much data does the receiver typically acknowledge in an ACK among the first ten data-carrying segments sent from the client to gaia.cs.umass.edu? Can you identify cases where the receiver is ACKing every other received segment (see Table 3.2 in the text) among these first ten data-carrying segments?

11. What is the throughput (bytes transferred per unit time) for the TCP connection? Explain how you calculated this value.

#### TCP congestion control in action
12. Use the Time-Sequence-Graph(Stevens) plotting tool to view the sequence number versus time plot of segments being sent from the client to the gaia.cs.umass.edu server. Consider the “fleets” of packets sent around t = 0.025, t = 0.053, t = 0.082 and t = 0.1. Comment on whether this looks as if TCP is in its slow start phase, congestion avoidance phase or some other phase. Figure 6 shows a slightly different view of this data.

13. These “fleets” of segments appear to have some periodicity. What can you say about the period?

14. Answer each of two questions above for the trace that you have gathered when you transferred a file from your computer to gaia.cs.umass.edu