# Week Eight: More Network Layer: More Data Plane

## Review Questions

### R23: Visit a host that uses DHCP to obtain its IP address, network mask, default router, and IP address of its local DNS server. List these values

```powershell
Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : academy.usna.edu
   Description . . . . . . . . . . . : Realtek USB GbE Family Controller
   Physical Address. . . . . . . . . : 48-9E-BD-22-12-1E
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes
   IPv4 Address. . . . . . . . . . . : 10.16.146.82(Preferred)<-- IP Address
   Subnet Mask . . . . . . . . . . . : 255.255.254.0          <-- Network Mask
   Lease Obtained. . . . . . . . . . : Tuesday, October 17, 2023 04:10:28
   Lease Expires . . . . . . . . . . : Wednesday, October 25, 2023 07:21:48
   Default Gateway . . . . . . . . . : 10.16.146.1            <-- Default Router
   DHCP Server . . . . . . . . . . . : 10.1.74.10             <-- IP of Local DNS
   DNS Servers . . . . . . . . . . . : 10.1.74.10
   NetBIOS over Tcpip. . . . . . . . : Enabled
```

***

### R29: What is a private network address? Should a datagram with a private network address ever be present in the larger public Internet? Explain

- [RFC 1918](https://datatracker.ietf.org/doc/html/rfc1918#section-3) defines three blocks of addresses as designated for private internets. The IPs within these ranges are for smaller subnets to preserve the number of IPv4 addresses available to the wider internet. One gateway router will use a public IP to route all traffic from a network of private IPs using NAT. This allows ample smaller networks to all operate many devices using the same private IPv4 addresses. This system relies on private IP addresses staying hidden behind a gateway router because mutltiple private subnets will share private IP addresses in their local subnet and therefore a datagram with a private network address wouldn't make sense in the larger public network.

***

### R26: Suppose you purchase a wireless router and connect it to your cable modem. Also suppose that your ISP dynamically assigns your connected device (that is, your wireless router) one IP address. Also suppose that you have five PCs at home that use 802.11 to wirelessly connect to your wireless router. How are IP addresses assigned to the five PCs? Does the wireless router use NAT? Why or why not?

- Each of the five PCs is hidden behind one public IP given to your home from the ISP. The PCs will all be assigned separate, unique private IP addresses. The wireless router will use NAT to interface the private IPs with the rest of the internet. NAT allows the router to translate all incoming and outgoing IP addresses. This allows you to have many devices on private IP addresses all connected to the router.

***

## Problems

### P15: Consider the topology shown in Figure 4.20. Denote the three subnets with hosts (starting clockwise at 12:00) as Networks A, B, and C. Denote the subnets without hosts as Networks D, E, and F

**a. Assign network addresses to each of these six subnets, with the following constraints: All addresses must be allocated from 214.17.254/23; Subnet A should have enough addresses to support 250 interfaces; Subnet B should have enough addresses to support 120 interfaces; and Subnet C should have enough addresses to support 120 interfaces. Of course, subnets D, E and F should each be able to support two interfaces. For each subnet, the assignment should take the form a.b.c.d/x or a.b.c.d/x – e.f.g.h/y.**  

![problem 15 solution](img/p15as.jpg)

**b. Using your answer to part (a), provide the forwarding tables (using longest prefix matching) for each of the three routers**
Assume that each router letter corresponds to the subnet it is connected to. 
**Router A**
| Prefix Match   | Link Interface |
|:--------------:|:--------------:|
| 11010110 00010001 11111110 | 0 |
| 11010110 00010001 11111111 01111000 | 1 |
| 11010110 00010001 11111111 01111010 | 2 |

**Router B**
| Prefix Match   | Link Interface |
|:--------------:|:--------------:|
| 11010110 00010001 11111111 0 | 0 |
| 11010110 00010001 11111111 01111000 | 1 |
| 11010110 00010001 11111111 01111100 | 2 |

**Router C**
| Prefix Match   | Link Interface |
|:--------------:|:--------------:|
| 11010110 00010001 11111111 1 | 0 |
| 11010110 00010001 11111111 01111000 | 1 |
| 11010110 00010001 11111111 01111010 | 2 |

***

### P16: Use the whois service at the [American Registry for Internet Numbers](http://www.arin.net/whois) to determine the IP address blocks for three universities. Can the whois services be used to determine with certainty the geographical location of a specific IP address? Use [maxmind](www.maxmind.com) to determine the locations of the Web servers at each of these universities

| University of Washington        | University of Notre Dame       | University of Wisconsin-Madison  |
| ------------------------------- | ------------------------------ | -------------------------------- |
| 108.179.140.0 - 108.179.159.255 | 66.205.160.0 - 66.205.175.255  | 128.104.0.0 - 128.104.255.255    |
| 173.250.160.0 - 173.250.191.255 | 66.254.224.0 - 66.254.255.255  | 128.105.0.0 - 128.105.255.255    |
| 173.250.224.0 - 173.250.231.255 |                                | 144.92.0.0 - 144.92.255.255      |
| 198.48.64.0 - 198.48.78.255     |                                | 146.151.0.0 - 146.151.255.255    |
| 66.96.66.128 - 66.96.66.143     |                                | 192.12.220.0 - 192.12.220.255    |
| 69.91.192.0 - 69.91.255.255     |                                | 192.12.223.0 - 192.12.223.255    |
|                                  |                                | 192.12.224.0 - 192.12.224.255    |
|                                  |                                | 192.86.79.0 - 192.86.79.255      |
|                                  |                                | 198.133.224.0 - 198.133.224.255  |
|                                  |                                | 198.133.225.0 - 198.133.225.255  |
|                                  |                                | 198.51.246.0 - 198.51.246.255    |
|                                  |                                | 198.51.247.0 - 198.51.247.255    |
|                                  |                                | 198.51.254.0 - 198.51.254.255    |
|                                  |                                | 72.33.0.0 - 72.33.255.255        |

When I used maxmind I found that the lower IPs had much more accuracy than higher ones. When i put in an IP from each school I was able to get the town and state of each universitty was well as an accuracy radius of 10-100 km to this does give some good location accuracy but I wouldn't say much on a smaller-than-state-scale. I should also note that some of the servers appear to be located near the universities but are a few towns over.
![problem 16 image](img/p16s.png)

***

### P18: Consider the network setup in Figure 4.25. Suppose that the ISP instead assigns the router the address 24.34.112.235 and that the network address of the home network is 192.168.0/24.

**a. Assign addresses to all interfaces in the home network.**  

```text
Subnet 192.168.0/24: (home network)
   Router: 192.168.0.0
      Host 1: 192.168.0.1
      Host 2: 192.168.0.2
      Host 3: 192.168.0.3
```

**b. Suppose each host has two ongoing TCP connections, all to port 80 at host 128.119.40.86. Provide the six corresponding entries in the NAT translation table**  

| WAN             | LAN             |
|-----------------|-----------------|
| 24.34.112.235:5322 | 192.168.0.1:6502 |
| 24.34.112.235:1271 | 192.168.0.1:6503 |
| 24.34.112.235:5323 | 192.168.0.2:4556 |
| 24.34.112.235:1272 | 192.168.0.2:4557 |
| 24.34.112.235:5324 | 192.168.0.3:8974 |
| 24.34.112.235:1273 | 192.168.0.3:8975 |

***

### P19: Suppose you are interested in detecting the number of hosts behind a NAT. You observe that the IP layer stamps an identification number sequentially on each IP packet. The identification number of the first IP packet generated by a host is a random number, and the identification numbers of the subsequent IP packets are sequentially assigned. Assume all IP packets generated by hosts behind the NAT are sent to the outside world

**Based on this observation, and assuming you can sniff all packets sent by the NAT to the outside, can you outline a simple technique that detects the number of unique hosts behind a NAT? Justify your answer.**

For any set of sequential IPs you know that is one host. If you count the number of sets of sequentially occurring IPs you will know the number of hosts. For example if you see the IPs 156.65.216.1,156.65.216.2, 251.15.1.3, 156.65.216.3, 251.15.1.4, 251.15.1.5. There are clearly two hosts that started at IPs 156.65.216.1 and 251.15.1.3 and sequentially incremented their IP sources.

**If the identification numbers are not sequentially assigned but randomly assigned, would your technique work? Justify your answer.**  
You would have no idea because all you would see are tons of random IPs coming out of the gateway router.
