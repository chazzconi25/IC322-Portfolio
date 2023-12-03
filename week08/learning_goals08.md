# Week Eight: More Network Layer: More Data Plane

## Learning Goals

### I can explain the problem that NAT solves, and how it solves that problem

#### The Problem

Under IPv4 there are not enough IP addresses for all devices. If every device on earth had its own IPv4 address there would be duplicate devices and subnets and packet delivery would be a mess.

#### The Solution

The Gateway router to a subnet has an IPv4 address and is seen by the rest of the internet as a single host. The hosts within the subnet are allocated private IPv4 addresses. When the hosts send packets through the gateway router the router logs the orginal destiation and source information in its NAT table. It then routes the packets using its own IP as the source.- When a response is sent to the router it is retranslated into the private address of that host within the subnet.

### I can explain important differences between IPv4 and IPv6

#### IPv4

- 32 bit address
- unicast and multicast addresses
- Allows for fragmentation at intermediate routers
- Checksum in header

#### IPv6

- 128 bit address
- unicast, multicast, and anycast addresses
- fixed length header that is significantly shorter than IPv4
- No checksum

### I can explain how IPv6 datagrams can be sent over networks that only support IPv4

IPv6 hosts use tunneling to send IPv6 data over IPv4 networks. The IPv6 sending host sends an IPv4 header with IPv6 header in the payload. The datagram is routed normally as an IPv4 address through the network until it reaches the IPv6 host receiver. When it reaches the receiver the receiver sees that the protocol number int the IPv4 header is 41. This indicates that it is actually an IPv6 datagram. The host then extracts the IPv6 datagram from the payload and routes it as if it had received the IPv6 directly from the sender.
