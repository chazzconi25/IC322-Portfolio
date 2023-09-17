# Week One: The Internet

## Review Questions

### R1: What is the difference between a host and an end system? List several different types of end systems. Is a Web server an end system?
There is no difference between host and end system. The terms are used interchangably for devices on the network edge that run programs on the application layer. End systems could include smartphones, PCs, or even enterprise servers. A web server is an end system because it exists in the network edge and they are connected to the internet via routers for others to access.

### R4: List four access technologies. Classify each one as home access, enterprise access, or wide-area wireless access.

- DSL: home access 
- FTTH: home access
- Ethernet: enterprise access
- 5G: wide-area access

### R11: Suppose there is exactly one packet switch between a sending host and a receiving host. The transmission rates between the sending host and the switch and between the switch and the receiving host are R1 and R2, respectively. Assuming that the switch uses store-and-forward packet switching, what is the total end-to-end delay to send a packet of length L? (Ignore queuing, propagation delay, and processing delay.)

PAGE 54

### R12: What advantage does a circuit-switched network have over a packet-switched network? What advantages does TDM have over FDM in a circuit-switched network?

### R13: Suppose users share a 2 Mbps link. Also suppose each user transmits continuously at 1 Mbps when transmitting, but each user transmits only 20 percent of the time. (See the discussion of statistical multiplexing in Section 1.3.)

**a. When circuit switching is used, how many users can be supported?**
**b. For the remainder of this problem, suppose packet switching is used. Why will there be essentially no queuing delay before the link if two or fewer users transmit at the same time? Why will there be a queuing delay if three users transmit at the same time?**
**c. Find the probability that a given user is transmitting.**
**d. Suppose now there are three users. Find the probability that at any given time, all three users are transmitting simultaneously. Find the fraction of time during which the queue grows.**

### R14: Why will two ISPs at the same level of the hierarchy often peer with each other? How does an IXP earn money?

### R18: A user can directly connect to a server through either long-range wireless or a twisted-pair cable for transmitting a 1500-bytes file. The transmission rates of the wireless and wired media are 2 and 100 Mbps, respectively. Assume that the propagation speed in air is 3 * 108 m/s, while the speed in the twisted pair is 2 * 108 m/s. If the user is located 1 km away from the server, what is the nodal delay when using each of the two technologies?

### R19: Suppose Host A wants to send a large file to Host B. The path from Host A to Host B has three links, of rates R1 = 500 kbps, R2 = 2 Mbps, and R3 = 1 Mbps.
**a. Assuming no other traffic in the network, what is the throughput for the file transfer?**
**b. Suppose the file is 4 million bytes. Dividing the file size by the throughput, roughly how long will it take to transfer the file to Host B?**
**c. Repeat (a) and (b), but now with R2 reduced to 100 kbps.**