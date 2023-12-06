# Week Thirteen: More Link Layer

## Review Questions

### R3: What are the differences between the following types of wireless channel impairments: path loss, multipath propagation, interference from other sources?

| Path Loss         | Multipath Propagation | Interference from Other Sources |
| ----------------- | ---------------------- | -------------------------------- |
| Decreased signal strength as it travels through physical mediums. (walls/air) | Signals reflecting off of physical objects taking paths of different lengths and arriving at inconvenient times causing blurring at the receiver | Other signals in the 2.5 / 5 GHz bands from electromagnetic noise causing interference. |

### R4: As a mobile node gets farther and farther away from a base station, what are two actions that a base station could take to ensure that the loss probability of a transmitted frame does not increase?

Higher SNR leads to lower BER. The base station can increase SNR by increasing its transmission power. The base station can also improve SNR by using adaptive modulation to select the best modulation technique that provides the highest transmission rate based on the channel characteristics (SNR and optimal bit transmission rate).

### R10: Suppose nodes A, B, and C each attach to the same broadcast LAN (through their adapters). If A sends thousands of IP datagrams to B with each encapsulating frame addressed to the MAC address of B, will C’s adapter process these frames? If so, will C’s adapter pass the IP datagrams in these frames to the network layer C? How would your answers change if A sends frames with the MAC broadcast address?

C will not process these frames because the link layer frame has the MAC address of A. If A sends the frames on the broadcast address C will process the frames and When they are passed to the link network layer they will be discarded because they will be addressed to B's IP which does not match C's IP.

### R11: Why is an ARP query sent within a broadcast frame? Why is an ARP response sent within a frame with a specific destination MAC address?

ARP queries are sent within a broadcast fram beacause the sender does not now the ARP address of its destination so the frame is then sent to all locations within the subnet so every interface can check if the destinaton IP matches their IP. An ARP response is sent within a frame with a specific destination MAC address because the sender just recieved an ARP query with the original senders MAC address so the frame does not need to be broadcast all over the subnet taking up resources.

### P14: Consider three LANs interconnected by two routers, as shown in Figure 6.33

1. Assign IP addresses to all of the interfaces. For Subnet 1 use addresses of the form 192.168.1.xxx; for Subnet 2 uses addresses of the form 192.168.2.xxx; and for Subnet 3 use addresses of the form 192.168.3.xxx
**a:** A: `192.168.1.1` B: `192.168.1.2` RAB: `192.168.1.2` C: `192.168.2.1` D: `192.168.2.2` RCDL: `192.168.2.3` RCDR: `192.168.2.4` E: `192.168.3.1` F: `192.168.3.2` REF: `192.168.3.3` 
2. Assign MAC addresses to all of the adapters.  
**a:**  
A: `AA-AA-AA-AA-AA-AA`  
B: `BB-BB-BB-BB-BB-BB`  
RAB: `AB-AB-AB-AB-AB-AB`  
C: `CC-CC-CC-CC-CC-CC`  
D: `DD-DD-DD-DD-DD-DD`  
RCDL: `CD-CD-CD-CD-CD-CD`  
RCDR: `DC-DC-DC-DC-DC-DC`  
E: `EE-EE-EE-EE-EE-EE`  
F: `FF-FF-FF-FF-FF-F1`  
REF: `EF-EF-EF-EF-EF-EF`  
3. Consider sending an IP datagram from Host E to Host B. Suppose all of the ARP tables are up to date. Enumerate all the steps, as done for the single-router example in Section 6.4.1.  
**a:**  
a.
4. Repeat (c), now assuming that the ARP table in the sending host is empty(and the other tables are up to date)  
**a:** test

### P6: In step 4 of the CSMA/CA protocol, a station that successfully transmits a frame begins the CSMA/CA protocol for a second frame at step 2, rather than at step 1. What rationale might the designers of CSMA/CA have had in mind by having such a station not transmit the second frame immediately (if the channel is sensed idle)?

Another station may have been waiting to broadcast data while the original station was broadcasting data. In this case the second node could start broadcasting now that it is done waiting. If this second broadcast does not reach the initial station then the inital station will think the medium is free even though it isn't. By going to step two the inital station won't broadcast even if the medium appears to be free as it does in the situation outlined above.

### P7: Suppose an 802.11b station is configured to always reserve the channel with the RTS/CTS sequence. Suppose this station suddenly wants to transmit 1,500 bytes of data, and all other stations are idle at this time. As a function of SIFS and DIFS, and ignoring propagation delay and assuming no bit errors, calculate the time required to transmit the frame and receive the acknowledgement.

1,500 bytes is one frame so one RTS/CTS sequence is needed to transfer the data. For every frame of data sent there is one DIFS period and three SIFS periods so the total time required to transmit the frame and receive the acknowledgment is: $DIFS + 3 * SIFS$.

### P15: Consider Figure 6.33. Now we replace the router between subnets 1 and 2 with a switch S1, and label the router between subnets 2 and 3 as R1

1. Consider sending an IP datagram from Host E to Host F. Will Host E ask router R1 to help forward the datagram? Why? In the Ethernet frame containing the IP datagram, what are the source and destination IP and MAC addresses?
2. Suppose E would like to send an IP datagram to B, and assume that E’s ARP cache does not contain B’s MAC address. Will E perform an ARP query to find B’s MAC address? Why? In the Ethernet frame (containing the IP datagram destined to B) that is delivered to router R1, what are the source and destination IP and MAC addresses?
3. Suppose Host A would like to send an IP datagram to Host B, and neither A’s ARP cache contains B’s MAC address nor does B’s ARP cache contain A’s MAC address. Further suppose that the switch S1’s forwarding table contains entries for Host B and router R1 only. Thus, A will broadcast an ARP request message. What actions will switch S1 perform once it receives the ARP request message? Will router R1 also receive this ARP request message? If so, will R1 forward the message to Subnet 3? Once Host B receives this ARP request message, it will send back to Host A an ARP response message. But will it send an ARP query message to ask for A’s MAC address? Why? What will switch S1 do once it receives an ARP response message from Host B?