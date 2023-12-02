# Week Thirteen: More Link Layer

## Review Questions

### R3: What are the differences between the following types of wireless channel impairments: path loss, multipath propagation, interference from other sources?

| Path Loss         | Multipath Propagation | Interference from Other Sources |
| ----------------- | ---------------------- | -------------------------------- |
| Decreased signal strength as it travels through physical mediums. (walls/air) | Signals reflecting off of physical objects taking paths of different lengths and arriving at inconvenient times causing blurring at the receiver | Other signals in the 2.5 / 5 GHz bands from electromagnetic noise causing interference. |

### R4: As a mobile node gets farther and farther away from a base station, what are two actions that a base station could take to ensure that the loss probability of a transmitted frame does not increase?

Higher SNR leads to lower BER. The base station can increase SNR by increasing its transmission power. The base station can also improve SNR by using adaptive modulation to select the best modulation technique that provides the highest transmission rate based on the channel characteristics (SNR and optimal bit transmission rate).

### R10: Suppose nodes A, B, and C each attach to the same broadcast LAN (through their adapters). If A sends thousands of IP datagrams to B with each encapsulating frame addressed to the MAC address of B, will C’s adapter process these frames? If so, will C’s adapter pass the IP datagrams in these frames to the network layer C? How would your answers change if A sends frames with the MAC broadcast address?



### R11: Why is an ARP query sent within a broadcast frame? Why is an ARP response sent within a frame with a specific destination MAC address?

### P14: Consider three LANs interconnected by two routers, as shown in Figure 6.33


### P6: In step 4 of the CSMA/CA protocol, a station that successfully transmits aframe begins the CSMA/CA protocol for a second frame at step 2, rather than at step 1. What rationale might the designers of CSMA/CA have had in mind by having such a station not transmit the second frame immediately (if the channel is sensed idle)?

### P7: Suppose an 802.11b station is configured to always reserve the channel with the RTS/CTS sequence. Suppose this station suddenly wants to transmit 1,500 bytes of data, and all other stations are idle at this time. As a function of SIFS and DIFS, and ignoring propagation delay and assuming no bit errors, calculate the time required to transmit the frame and receive the acknowledgement.


### P15: Consider Figure 6.33. Now we replace the router between subnets 1 and 2 with a switch S1, and label the router between subnets 2 and 3 as R1.



