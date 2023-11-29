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



### I can explain CSMA/CA, how it differs from CSMA/CD, what problems it addresses, and how it solves them

