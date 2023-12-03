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

### R18: How long does it take a packet of length 1,000 bytes to propagate over a link of distance 2,500 km, propagation speed 2.5 * 10^8 m/s, and transmission rate 2 Mbps? More generally, how long does it take a packet of length L to propagate over a link of distance d, propagation speed s, and transmission rate R bps? Does this delay depend on packet length? Does this delay depend on transmission rate?

$$d_{total} = d_{prop} + d_{trans} + d_{queue}$$
$$d_{total} = \frac{d}{s} + \frac{L}{R} + 0$$
$$\frac{d}{s} = \frac{2500}{2.5*10^8} = 0.00001$$
$$\frac{L}{R} = \frac{1000}{2000000} = 0.0005$$
$$d_{total} = 0.00001 + 0.0005 = 0.00051\ seconds$$

Hell yeah it depends on transmission rate and packet length, those make up $d_{trans}$ smh what kind of question is that?


### R19: Suppose Host A wants to send a large file to Host B. The path from Host A to Host B has three links, of rates R1 = 500 kbps, R2 = 2 Mbps, and R3 = 1 Mbps.

**a. Assuming no other traffic in the network, what is the throughput for the file transfer?**
The throughput for the transfer is 500 kbps because that is a bottleneck.

**b. Suppose the file is 4 million bytes. Dividing the file size by the throughput, roughly how long will it take to transfer the file to Host B?**
$$\frac{4000000b}{500000\frac{b}{s}} = 8 s$$

**c. Repeat (a) and (b), but now with R2 reduced to 100 kbps.**
The throughput is now 100 kbps as R2 is a bottleneck now.
$$\frac{4000000b}{100000\frac{b}{s}} = 40 s$$
