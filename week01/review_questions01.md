# Week One: The Internet

## Review Questions

### R1: What is the difference between a host and an end system? List several different types of end systems. Is a Web server an end system?
There is no difference between host and end system. The terms are used interchangably for devices on the network edge that run programs on the application layer. End systems could include smartphones, PCs, or even enterprise servers. A web server is an end system because it exists in the network edge and they are connected to the internet via routers for others to access.
***

### R4: List four access technologies. Classify each one as home access, enterprise access, or wide-area wireless access.

- DSL: home access 
- FTTH: home access
- Ethernet: enterprise access
- 5G: wide-area access
***

### R11: Suppose there is exactly one packet switch between a sending host and a receiving host. The transmission rates between the sending host and the switch and between the switch and the receiving host are R1 and R2, respectively. Assuming that the switch uses store-and-forward packet switching, what is the total end-to-end delay to send a packet of length L? (Ignore queuing, propagation delay, and processing delay.)

Transmission delay = L/R

Between the sending host and the switch the delay is L/R1 and then the delay between the switch and the recieving host is L/R2. 

The total delay is 2L(1/R1 + 1/R2)
***

### R12: What advantage does a circuit-switched network have over a packet-switched network? What advantages does TDM have over FDM in a circuit-switched network?

A circuit switched network gaurntees the full transmission speed of the link becuase the wire is reserved for your transmissions only. This way you have more ability for live streamed applications.

FDM is complicated because recieves need to listen to a multitude of different frequencies. TDM only requires a single frequency for all users as long as they do not trasmit during the same times.
***

### R13: Suppose users share a 2 Mbps link. Also suppose each user transmits continuously at 1 Mbps when transmitting, but each user transmits only 20 percent of the time. (See the discussion of statistical multiplexing in Section 1.3.)

**a. When circuit switching is used, how many users can be supported?**
Two users can be supported because each user uses 1 Mbps of the 2Mbps link.

**b. For the remainder of this problem, suppose packet switching is used. Why will there be essentially no queuing delay before the link if two or fewer users transmit at the same time? Why will there be a queuing delay if three users transmit at the same time?**

**c. Find the probability that a given user is transmitting.**
20% of the time a user is transmitting.

**d. Suppose now there are three users. Find the probability that at any given time, all three users are transmitting simultaneously. Find the fraction of time during which the queue grows.**
Probablity = (probability a user is trasmitting)^number of users
0.008 = 0.2^3
***

### R14: Why will two ISPs at the same level of the hierarchy often peer with each other? How does an IXP earn money?
ISPs take advantage of peering so they do not need to pay for internet from higher tier ISPs when they can just transmit each others traffic for free. This commonly happens with nearby Access and Regional ISPs.

IXPs make money by selling ports. The larger the port an ISP wants to peer with other ISPs the more it will cost.

Source for second paragraph:https://packetpushers.net/htirw-internet-exchange-points/?doing_wp_cron=1695009421.6981561183929443359375#:~:text=IXPs%20sell%20their%20services%20based,it's%20the%20same%20basic%20concept.

### R18: A user can directly connect to a server through either long-range wireless or a twisted-pair cable for transmitting a 1500-bytes file. The transmission rates of the wireless and wired media are 2 and 100 Mbps, respectively. Assume that the propagation speed in air is 3 * 108 m/s, while the speed in the twisted pair is 2 * 108 m/s. If the user is located 1 km away from the server, what is the nodal delay when using each of the two technologies?

Total delay = Propogation delay + transmission delay + queuing delay
Total delay = d/s + L/R + 0

d/s = 2500/(2.5)*10^8

L/R = 

### R19: Suppose Host A wants to send a large file to Host B. The path from Host A to Host B has three links, of rates R1 = 500 kbps, R2 = 2 Mbps, and R3 = 1 Mbps.
**a. Assuming no other traffic in the network, what is the throughput for the file transfer?**


**b. Suppose the file is 4 million bytes. Dividing the file size by the throughput, roughly how long will it take to transfer the file to Host B?**


**c. Repeat (a) and (b), but now with R2 reduced to 100 kbps.**

