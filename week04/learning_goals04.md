# Week Four: Transport Layer: TCP and UDP

## Learning Goals

### I can explain how TCP and UDP multiplex messages between processes using sockets.
Multiplexing is the job of transport layer protocols where segments are created after packets are pushed through sockets at the application layer. On a host data is encapsulated with header information for identifying a receiving socket and moved to the network layer.

When messages are pushed though sockets both TCP and UDP assign a source port number and destination port number. These numbers are each 16 bits and indicate the sepecific socket the information came from and what process it should be recieved by.

The destination port number is included to ensure that the segment will arrive at the correct process. The source port number allows the receiving process to send segments back.

UDP Multiplexing is known as connectionless multiplexing. TCP multiplexing is known as connection oriented multiplexing creates requires a four tuple with IP information attached to port number. 

### I can explain the difference between TCP and UDP, including the services they provide and scenarios each is better suited to.
#### UDP: User Datagram Protocol
UDP is a very bare bones protocol. The textbook literally describes it as "almost directly talking with IP". Besides port numbers UDP only contains two other fields that error check with a checksum felid and a length field. UDP does no handshaking to ensure messages a delivered so it is connectionless.

Although UDP seems like a cruddy transport with no acutal substance it allows more control and speed offered to the sending process.  There is so little to UDP that its benefits are primarly defined by what it doesn't include that TCP does. There is a chart with the benefits of UDP following the description of TCP below. More importantly, UDP lacks reliability of data transmission but emphasize fast, consistent data transfer. As a result some common applications of UDP include:
- DNS: Need quick, but not necessarily reliable resolution to domain names.
- Multimedia: Fails when throttled by TCP but works well over UDP where packet loss is tolerated. 

#### TCP: Transmission Control Protocol
TCP on the otherhand is a much more robust protocol. As a connection oriented protocol TCP adds multiple complex fields and ensures a connection is made before sending data. This highlights the reliability that TCP adds to unreliable IP addressing.

TCP does all of these things through the use of extra header fields that specify sequence number, aknoledgment number (for responses), and pipelining. All of these features are critical to TCP's consistent, reliable data transfer but also increase its overhead. For more information on these mechanism of TCP see the final two learning objectives with the headings labeled (TCP).

Some of the common applications of TCP include:
- E-mail: Requires reliable data transfer to ensure entire message is transferred between servers
- Remote terminal access: Ensure that consistent maintained connection works over reliable data transfer.
- File transfer: Transfer needs to be reliable for file transfer. Its in the name.

|     TCP Feature     |      TCP Benefit       | UDP (Lack of Feature) Benefit |
|:-------------------:|:----------------------:|:-----------------------------:|
|  Congestion control throttling | Manages network congestion of sent packets |   Finer application-level control over what data is sent, and when |
| Three-way hand shake before data transfer | Establishes a reliable connection between client and server | No delay to establish a connection |
|   Maintains connection state in the end systems | Good for connection control monitoring |  A server devoted to one application can support many more active clients |
| Packet header overhead  | 20 bytes of error checking and connection establishment | Only 8 bytes of packet overhead |

### I can explain how and why the following mechanisms are used and which are used in TCP: sequence numbers, duplicate ACKs, timers, pipelining, go-back-N, selective repeat, sliding window.
### I can explain how these mechanisms are used to solve dropped packets, out-of-order packets, corrupted/dropped acknowledgements, and duplicate packets/acknowledgements.
*Note: the above two learning objectives have been combined below for easier reading. Mechanisisms used in TCP are highlighted with (TCP) if only part of a mechanism is used it is noted in the last paragraph of the mechanism description.*
#### Sequence numbers (TCP)
When a client sends a packet and the host sends back a corrupted ACK or NAK packet the client has no way of knowing if the packet was received properly. The solution is to resend the original data packet but then the receiver doesn't know that the retransmission is a retransmission. If a sender receives two ACKs for the same sequence number then it knows that packet isn't being received correctly. By attaching a sequence number, numbered by bytes in TCP, the client can let the host know the order of the data and if numbers are missing the host knows something was dropped. If the client receives an ACK in TCP that is ahead of the current ACK, it will count it as a cumulative ACK for up to its number.

#### Duplicate ACKs
Duplicate ACKs occur when packets are sent out of order and resent packets are ACKed. This serves the place of a NAC because when the client recieves two of the same ACK it knows that either the packets are out of order or a packet has been lost before the resent packet.

#### Timers (TCP)
If an ACK is not received within a certain time of a client transmitting a packet, the client can assume that the packet did not make it to the host. Timers are used to resend packets in the case that data is dropped before it gets to the host. Once a packet is sent a timer starts. If that timer ends before an ACK is received from the host the client will assume that the packet was dropped and will retransmit the packet.

TCP uses timers by estimating Round Trip Time (RTT) for each packet.

#### Pipelining (TCP)
Pipelining is an alternative to stop-and-wait where clients must stop and wait for an ACK or NAK when transmitting data and hosts wait for the next packet sequence to transmit ACKs or NAKs. This is problematic because if packets are received and corrupted or lost on either end the sender or receiver must reattempt that process before moving on even if its possible the message got through find and the communication about its status is lacking.<br>
The solution is pipelining where the sender sends multiple packets without waiting for ACKs or NAKs. Here larger sequence numbers are used to ensure that all of the sent packets can be identified.

#### Go-back-N
The client can send as many packets as are available up to a certain number via pipelining. The number of unacknowledged packets is known as n and equal to the window size. Timers are still utlized in GBN to see if a packet is lost. If no ACK is received for the sent packets before a timeout, they all must be sent. GBN uses cumulative acknowledgements where if an ACK of n is sent then the client assumes that the host received all packets < n. By the same measure the host only sends an ACK numbered n if it has received all of the packets < n. This solves for dropped ACKs by allowing one ACK is dropped in < n. One downside of cumulative ACK is out-of-order packets are dropped. This is because if packet 4 comes before packet 1 the host could hold onto packet 4 until 1-3 arrive but by default the host will resend 1-4 if ACK 4 is not recieved. To simplify buffering and the number the host needs to keep track of, GBN just drops out of order packets.

Cumulative ACKs are used by TCP but TCP is not specifically GBN because TCP only resends waht is neccisary accoridng to fast retransmit.

#### Selective repeat
GBN fails when there is a large window and badwith delay. This causes a large amount of packets to be resent due to a single packet error causing preformance issues. Selective repeat avoids unnecessary retransmissions. In this process the client must identify which specific packets were dropped so cumulative acknowledgment is not possible here. The host will also buffer and ACK out of order packets because it knows they will not be resent. Here timers are also utilized for each individual packet to ensure it is not lost in transmission.

TCP maintains only the smallest sequence number of a transmitted but unacknowledged byte. This way it can only repeat certain segments but also allows it to use cumulative ACK.

#### Sliding window (TCP)
Used in GBN  to identify the space between the last acknowledge packet and the total number of packets the client can keep putting on the line. As packets are acknowledged the window slides forward allowing more packets to be sent. If packets are not acknowledged then the window will become full and the client cannot keep sending packets to avoid congestion.


