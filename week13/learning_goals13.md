# Week Thirteen: More Link Layer

## Learning Goals

### I can describe the role a switch plays in a computer network

The role of the switch is to receive incoming link-layer frames and forward them onto outgoing links. The switch acts within a subnet to deliver frames between hosts or to a gateway router. The switch is easy to use because it is plug and play, once it is inserted into a network it builds its own table for forwarding. The switch does this by storing the source MAC address of frames with the interface they came in on and the time they came in. Entries are then given a certain amount of time, called aging time, that another frame must pass through the switch from that MAC address validating the MAC address is still within the network. If an entry is not validated via frames coming through the switch within the aging time the entry is deleted. In the picture below the switch has built its table by observing packets passing from host with MAC address `AA-AA-AA-AA-AA-AA` to host `BB-BB-BB-BB-BB-BB`.

![switch with two hosts](img/img1.png)

As far as hosts and routers are concerned, switches are invisible. When frames must pass through a switch the switch takes care of everything it needs in the link layer. The two primary functions of switches are forwarding and filtering. When a switch receives a frame it must decide if it is going to forward the frame onto one of its interfaces or filter it by dropping it. Theses decisions follow the table below.

| Case                                                  | Result                                                      |
|-------------------------------------------------------|-------------------------------------------------------------|
| Frame on interface x with destination not in switch table | Broadcast frame to all interfaces except for x |
| Frame on interface x with destination in switch table   | Forward frame to the corresponding interface                 |
| Frame on interface x with destination of interface x   | Drop the frame (prevent forwarding to the same interface)     |

Although switches forward similar to routers, switches are different from routers because they use MAC addresses making a switch a layer 2 packet switch where a router is a layer three packet switch.

One final special property of switches is they can be can be used to create VLANs to separate traffic. This is done by dividing the interfaces in a switch into different Virtual LANs so one switch essentially acts as two separated switches. This can be combined with a router to connect the VLANs within a single switch but require the initialized (rather than automatic) routing of a router.

Advantages of switches:  
Elimination of collisions: switches will buffer frames and never transmit multiple frames on a segment at a time  
Heterogeneous links: different speeds of switches can be connected to one switch.  
Management: switches prevent one downed connection from taking down the network and can block jabbering adapters  

### I can explain the problem ARP solves, how it solves the problem, and can simulate an ARP table given a simple LAN scenario

Address Resolution Protocol translates IP addresses to link-layer addresses. Like DNS, ARP can resolve host IPs to MAC addresses. Unlike DNS which can resolve any domain in the internet to an IP ARP is only used for the local subnet.

ARP does its translations via ARP tables stored in hosts and routers. The ARP tables contain three fields: IP Address, MAC Address, and Time To Live. Hosts and routers build their ARP tables using ARP packets. ARP packets includes sending and receiving IP and MAC addresses. These ARP packets are clasified as query or response packets. Query packets are sent using the MAC broadcast address `FF-FF-FF-FF-FF-FF` which will transmit the frame everywhere on the subnet so that each host and router can check if the destination IP address in the ARP packet matches their IP. If it does, they will respond with a ARP response to the MAC address of the source of the query packet. Both hosts will update their ARP tables accordingly when the packets are sent back and forth. If no packets revalidate the need for the entry in the ARP table then it will be deleted after the Time to Live value expires.

#### Example ARP simulation

![ARP table in simple subnet](img/img2.jpg)

Here host B has sent out an ARP request for IP ```111.111.111.110``` and for an IP outside the subnet. In both cases the requests where broadcast along the network. For the first request, Host A identified it has MAC address ```AAA-AAA-AAA-AAA-AAA-AAA``` and sent a response to host B to log in its ARP table. Int he second rquest the router recieved the IP and idetified that it was not in the subnet and responded with its IP and MAC address.

### I can explain CSMA/CA, how it differs from CSMA/CD, what problems it addresses, and how it solves them
