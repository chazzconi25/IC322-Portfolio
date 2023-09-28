# Week Four: Transport Layer: TCP and UDP

## Learning Goals

### I can explain how TCP and UDP multiplex messages between processes using sockets.
Multiplexing is the job of transport layer protocols where segments are created after packets are pushed through sockets at the application layer. On a host data is encapsulated with header information for identifying a recieving socket and moved to the network layer.

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




- E-mail: Requires reliable data transfer to ensure entire message is transferred between servers
- Remote terminal access: Ensure that consistent maintained connection works over reliable data transfer.
- File transfer: Transfer needs to be reliable for file transfer. Its in the name.

|     TCP Feature     |      TCP Benefit       | UDP (Lack of Feature) Benefit |
|:-------------------:|:----------------------:|:-----------------------------:|
|  Congestion control throttling | Manages network congestion of sent packets |   Finer application-level control over what data is sent, and when |
| Three-way hand shake before data transfer | Establishes a reliable connection between client and server | No delay to establish a connection |
|   Maintains connection state in the end systems  |  |  devoted to one application can support many more active clients |
|    Flow Control     |   | Only 8 bytes of packet overhead |

### I can explain how and why the following mechanisms are used and which are used in TCP): sequence numbers, duplicate ACKs, timers, pipelining, go-back-N, selective repeat, sliding window.
### I can explain how these mechanisms are used to solve dropped packets, out-of-order packets, corrupted/dropped acknowledgements, and duplicate packets/acknowledgements.
*Note: the above two learning objectives have been combined below for easier reading. The first paragraph of each mechanism description details the what, how, and why of the mechanism. The second paragraph details exmplanation on the featues lsited in the second learning objective*
#### Sequence numbers
what, how, why
dropped packets
out-of-order packets
corrupted/dropped acknowledgements
duplicate packets/acknowledgements
#### Duplicate ACKs
what, how, why
dropped packets
out-of-order packets
corrupted/dropped acknowledgements
duplicate packets/acknowledgements
#### Timers
what, how, why
dropped packets
out-of-order packets
corrupted/dropped acknowledgements
duplicate packets/acknowledgements
#### Pipelining

#### Go-back-N

#### Selective repeat

#### Sliding window



