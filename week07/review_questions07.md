# Week Four: Transport Layer: TCP and UDP

## Review Questions

### R11: What is the role of a packet scheduler at the output port of a router?
- 
***

### R12:
**a. What is a drop-tail policy?**<br>
**b. What are AQM algorithms?**<br>
**c. Name one of the most widely studied and implemented AQM algorithms and explain how it works.**<br>

***

### R13: What is HOL blocking? Does it occur in input ports or output ports?

***
### R16: What is an essential different between RR and WFQ packet scheduling? Is there a case (Hint: Consider the WFQ weights) where RR and WFQ will behave exactly the same?

***
### R18: What field in the IP header can be used to ensure that a packet is forwarded through no more than N routers?

***
### R21: How many IP addresses does a router have?

***

## Problems
### P4: Consider the switch shown below. Suppose that all datagrams have the same fixed length, that the switch operates in a slotted, synchronous manner, and that in one time slot a datagram can be transferred from an input port to an output port. The switch fabric is a crossbar so that at most one datagram can be transferred to a given output port in a time slot, but different output ports can receive datagrams from different input ports in a single time slot. What is the minimal number of time slots needed to transfer the packets shown from input ports to their output ports, assuming any input queue scheduling order you want (i.e., it need not have HOL blocking)? What is the largest number of slots needed, assuming the worst-case scheduling order you can devise, assuming that a non-empty input queue is never idle?

***
### P5: Suppose that the WEQ scheduling policy is applied to a buffer that supports three classes, and suppose the weights are 0.5, 0.25, and 0.25 for the three classes.
**a. Suppose that each class has a large number of packets in the buffer. In what sequence might the three classes be served in order to achieve the WFQ weights? (For round robin scheduling, a natural sequence is 123123123 . . .).**</br>
**b. Suppose that classes 1 and 2 have a large number of packets in the buffer, and there are no class 3 packets in the buffer. In what sequence might the three classes be served in to achieve the WFQ weights?**

***
### P8: Consider a datagram network using 32-bit host addresses. Suppose a router has four links, numbered 0 through 3, and packets are to be forwarded to the link interfaces as follows:
### P9:
### P11: