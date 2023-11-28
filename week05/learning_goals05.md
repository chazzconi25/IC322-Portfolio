# Week Five: Transport Layer

## Learning Goals

### I can explain the problem that TCP congestion control is solving for, and how it solves that problem

Congestion control limits the packets sent from the client to the host to ensure packets aren't lost in the network. The ultimate reason for congestion control is limiting the wasted work on the network. When routers send packets and their contents are dropped, both the bandwidth and time spend sending the packet is wasted.

TCP congestion control is specifically avoided via three states based on the size of the congestion window (cwnd),  

1. **Slow Start**
The first stage to TCP is slow-start. The size of cwnd starts small and doubles each time a transmitted segment is ACKed. The window grows exponentially until a loss event occurs when the window is reset to one. A separate value, ssthresh, is set to 1/2 the previous value of cwnd. TCP then moves on to congestion avoidance where it utilizes this value.

2. **Congestion Avoidance**
Once cwnd increases to be the size of ssthresh TCP starts increasing cwnd more conservatively by a constant amount. If there are no losses and the connection catches up then triple duplicate ACKs are received and the fast-recovery state starts.

3. **Fast Recovery**
Fast recovery is a recommended addition to TCP for recovering dropped packets and maintain network resources. Instead of resetting the value of cwnd, the ssthresh is met and constant growth continues.

### I can explain the problem that TCP flow control is solving for, and how it solves that problem

As data arrives from a TCP connection it is placed in the receivers buffer. This data has not yet been processed by the application via the socket. The more packet data that is held in the buffer the less space we have. If this space runs out then Packets are dropped. To solve this problem Flow control.

Flow control matches the rate at which the sender sends to the rate at which the receiver can process the data. This is accomplished with the variable known as the receive window to communicate the free space in the receivers buffer to the sender.
