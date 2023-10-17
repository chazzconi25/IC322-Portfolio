# Week Eight: More Network Layer: More Data Plane

## Review Questions

### R11: Describe how packet loss can occur at input ports. Describe how packet loss at input ports can be eliminated (without using infinite buffers).

***

### R12: Describe how packet loss can occur at output ports. Can this loss be prevented by increasing the switch fabric speed?

***

### R13: What is HOL blocking? Does it occur in input ports or output ports?

***

### R16: What is an essential difference between RR and WFQ packet scheduling? Is there a case (hint: consider the WFQ weights) where RR and WFQ will behave exactly the same?

***

### R18: What field in the IP header can be used to ensure that a packet is forwarded through no more than N routers?

***

### R21: Do routers have IP addresses? If so, how many?

***

## Problems

### P4: Consider the switch shown below. Suppose that all datagrams have the same fixed length, that the switch operates in a slotted, synchronous manner, and that in one time slot a datagram can be transferred from an input port to an output port. The switch fabric is a crossbar so that at most one datagram can be transferred to a given output port in a time slot, but different output ports can receive datagrams from different input ports in a single time slot. What is the minimal number of time slots needed to transfer the packets shown from input ports to their output ports, assuming any input queue scheduling order you want (i.e., it need not have HOL blocking)? What is the largest number of slots needed, assuming the worst-case scheduling order you can devise, assuming that a non-empty input queue is never idle?

***

### P5: Suppose that the WFQ scheduling policy is applied to a buffer that supports three classes, and suppose the weights are 0.5, 0.25, and 0.25 for the three classes
> WEQ DOES NOT EXIST WHAT THE HECK

**a. Suppose that each class has a large number of packets in the buffer. In what sequence might the three classes be served in order to achieve the WFQ weights? (For round robin scheduling, a natural sequence is 123123123 . . .).**  
- 

**b. Suppose that classes 1 and 2 have a large number of packets in the buffer, and there are no class 3 packets in the buffer. In what sequence might the three classes be served in to achieve the WFQ weights?**  
-


***

### P8: Consider a datagram network using 32-bit host addresses. Suppose a router has four links, numbered 0 through 3, and packets are to be forwarded to the link interfaces as follows:

**a. Provide a forwarding table that has five entries, uses longest prefix matching, and forwards packets to the correct link interfaces.**  

**b. Describe how your forwarding table determines the appropriate link interface for datagrams with destination addresses:**  

### P9: Consider a datagram network using 8-bit host addresses. Suppose a router uses longest prefix matching and has the following forwarding table. For each of the four interfaces, give the associated range of destination host addresses and the number of addresses in the range.

### P11: Consider a router that interconnects three subnets: Subnet 1, Subnet 2, and Subnet 3. Suppose all of the interfaces in each of these three subnets are required to have the prefix 223.1.17/24. Also suppose that Subnet 1 is required to support at least 60 interfaces, Subnet 2 is to support at least 90 interfaces, and Subnet 3 is to support at least 12 interfaces. Provide three network addresses (of the form a.b.c.d/x) that satisfy these constraints.