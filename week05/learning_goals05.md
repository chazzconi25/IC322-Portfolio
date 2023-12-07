# Week Five: Transport Layer

## Learning Goals

### I can explain the problem that TCP congestion control is solving for, and how it solves that problem

When too many packets are sent over the network router buffers overflow and packets are dropped. Typically hosts try to solve dropped packets problem by packet retransmission, a "symptom" of network congestion. Congestion control limits the packets sent from the client to the host to ensure packets aren't lost in the network. Too many hosts sending data at too high a rate he ultimate reason for congestion control is limiting the wasted work on the network. When routers send packets and their contents are dropped, both the bandwidth and time spend sending the packet is wasted.

There are two approches to congestion control that are defined by wether the network layer provides assistance to the transport layer:

1. **End-to-end congestion control:** Here there is no assistance from the network layer. In this model end systems decide how to solve congestion in the network based on observed network behavior like packet loss and delay.
2. **Network-assisted congestion control:** Here the network layer assists the transport layer via routers providing feedback to the sender and/or receiver. This feedback takes the form of single bits sent over dedicated hardware. Routers let hosts know exactly the throughput they should expect when sending.

Classic TCP uses end-to-end congestion control. Data senders keep track of a variable called the congestion window which constrains the rate the sender can send. Congestion window or cwind is calculated by `LastByteSent – LastByteAcked … min{cwnd, rwnd}` by dividing cwind by the value of the Round Trip Time the sender can approximate an optimal send rate. The sender knows there is congestion when it receives triple duplicate ACKs or a timeout occurs and will decrease cwind. Conversly if the sender recieves unacknoledged ACKs then it will increase cwind at the same rate as the ACKs come.

1. **Slow Start**
The first stage to TCP is slow-start. The size of cwnd starts small and doubles each time a transmitted segment is ACKed. The window grows exponentially until a loss event, duplicate ACKs or a timeout occurs when the window is reset to one. A separate value, ssthresh, is set to 1/2 the previous value of cwnd. TCP then moves on to congestion avoidance where it utilizes this value.

2. **Congestion Avoidance**
Once cwnd increases to be the size of ssthresh TCP starts increasing cwnd more conservatively by a constant amount. If there are no losses and the connection catches up then triple duplicate ACKs are received and the fast-recovery state starts.

3. **Fast Recovery**
Fast recovery is a recommended addition to TCP for recovering dropped packets and maintain network resources. Instead of resetting the value of cwnd, the ssthresh is met and constant growth continues.

### I can explain the problem that TCP flow control is solving for, and how it solves that problem

When data is received from a TCP connection, it is initially stored in the receiver's buffer. When it arrives, the data has not undergone processing by an application. As packet data accumulates in the buffer, the buffer begins to run out of space. If the buffer overflows, packets will be dropped. To address this issue and manage the flow of data, a mechanism known as flow control is employed. Flow control syncs the throughput from the sender with the processing capacity of the receivers application. This synchronization is achieved through the use of a variable known as the receive window, which communicates the amount of available space within the receiver's buffer back to the sender. This is done by calculating receive window as: $$rwnd = RcvBuffer - [LastByteRcvd - LastByteRead]$$ During setup rwindow is agreed upon by the sender and receiver. The receiver then continually updates rwindow as data is sent back and forth and the buffer fills. By maintaining this variable, flow control ensures optimized data transfer, preventing potential data loss and promoting efficient resource utilization.
