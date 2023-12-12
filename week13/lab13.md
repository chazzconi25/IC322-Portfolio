# Week Thirteen: More Link Layer

## Lab: Wireshark ARP

### Introduction
In this lab I observed the Ethernet packet and its size as well as the different packets sent over ethernet. Then I experimented looking at ARP tables in my computer and what ARP requests look like in wireshark.

### Collaboration

None

### Process

I used the instructions [here](http://gaia.cs.umass.edu/kurose_ross/wireshark.php) along with the given trace file to complete this lab.

### Questions

#### Capturing and analyzing Ethernet frames

1. What is the 48-bit Ethernet address of your computer?
c4:41:1e:75:b1:52

2. What is the 48-bit destination address in the Ethernet frame?  Is this the Ethernet address of gaia.cs.umass.edu? (Hint: the answer is no).  What device has this as its Ethernet address? 
00:1e:c1:7e:d9:01 no, the network adapter has this ethernet address.

3. What is the hexadecimal value for the two-byte Frame type field in the Ethernet frame carrying the HTTP GET request?  What upper layer protocol does this correspond to?

```text
Frame 126: 677 bytes on wire (5416 bits), 677 bytes captured (5416 bits) on interface en9, id 0
...
    Type: IPv4 (0x0800)<-----

```

4. How many bytes from the very start of the Ethernet frame does the ASCII “G” in “GET” appear in the Ethernet frame? Do not count any preamble bits in your count, i.e., assume that the Ethernet frame begins with the Ethernet frame's destination address.
The ASCII "G" in GET is 52 bytes from the start of the ethernet frame.

5. What is the value of the Ethernet source address?  Is this the address of your computer, or of gaia.cs.umass.edu (Hint: the answer is no).  What device has this as its Ethernet address?
The value of the Ethernet source address is the address of the router. It is 00:1e:c1:7e:d9:01.

6. What is the destination address in the Ethernet frame?  Is this the Ethernet address of your computer? 
The destination address is the address of the computer c4:41:1e:75:b1:52


7. Give the hexadecimal value for the two-byte Frame type field. What upper layer protocol does this correspond to?

```text
    Type: IPv4 (0x0800)<-----

```

8. How many bytes from the very start of the Ethernet frame does the ASCII “O” in “OK” (i.e., the HTTP response code) appear in the Ethernet frame? Do not count any preamble bits in your count, i.e., assume that the Ethernet frame begins with the Ethernet frame's destination address.

The "O" appears 52 bytes from the beginning of the etherent frame

9. How many Ethernet frames (each containing an IP datagram, each containing a TCP segment) carry data that is part of the complete HTTP “OK 200 ...” reply message? 
Just one frame is used as there is less than 1500 bytes sent.

#### The Address Resolution Protocol

10. How many entries are stored in your ARP cache?
There are 9 entries.

11. What is contained in each displayed entry of the ARP cache? 
A name associated with An IP address and ethernet address and the ethernet address of each IP on the same subnet.

12. What is the hexadecimal value of the source address in the Ethernet frame containing the ARP request message sent out by your computer?
The hex value of the source is 7c:02:53:2d:08.

13. What is the hexadecimal value of the destination addresses in the Ethernet frame containing the ARP request message sent out by your computer? And what device(if any) corresponds to that address (e.g,, client, server, router, switch or otherwise...)?
It is the broadcast address for every device `ff:ff:ff:ff:ff:ff` so they will all respond as if its their address on the subnet

14. What is the hexadecimal value for the two-byte Ethernet Frame type field.  What upper layer protocol does this correspond to?
The hexadecimal value for the two-byte Ethernet Frame type field is ARP protocol: 0x0806.

15. How many bytes from the very beginning of the Ethernet frame does the ARP opcode field begin?
It appears 20 bytes from the beginning of the frame.

16. What is the value of the opcode field within the ARP request message sent by your computer?
opcode = 0x0001

17. Does the ARP request message contain the IP address of the sender?  If the answer is yes, what is that value?
Yes, the ARP address contains the value of the sender. That value is 136.160.90.35.

18. What is the IP address of the device whose corresponding Ethernet address is being requested in the ARP request message sent by your computer?
Ethernet address that is being requested is 10.16.147.109

19. What is the value of the opcode field within the ARP reply message received by your computer?
opcode = 0x0002

20. What is the Ethernet address corresponding to the IP address that was specified in the ARP request message sent by your computer (see question 18)?
IP = 00:00:00:00:00:00

21. We’ve looked the ARP request message sent by your computer running Wireshark, and the ARP reply message sent in response. But there are other devices in this network that are also sending ARP request messages that you can find in the trace. Why are there no ARP replies in your trace that are sent in response to these other ARP request messages?
There are no replies because they will only respond to the computer that sent the original ARP message at their Ehternet address.
