# Week Seven: The Network Layer: Data Plane

## Learning Goals

### I can explain what a subnet is, how a subnet mask is used, and how longest prefix matching is used to route datagrams to their intended subnets

- A subnet is a group of hosts with no routers that are all connected on the network layer. All of these devices are connected via an ethernet switch or wireless access point. The subnet connects to the larger internet or other subnets via a router which forms the door in and out of the subnet. Subnets are defined in the network layer and therefore use IP addressing to identify themselves and the individual hosts within them.
- Each subnet has an address and a subnet mask that will determine the prefix of all of the hosts within the subnet as well as the amount of hosts that can exist in the subnet. IP addressing assigns a normal IP to the subnet like any other, a 32 bit number split into 8 bit chunks to form four decimal numbers. For the subnet this quantity is followed by a slash-number known as the subnet mask. The subnet mask indicates the number leftmost of bits that define the subnet address. Within the subnet all hosts will have a prefix that is equal to the subnet mask

#### Subnet Mask Example:

```text
Subnet address in decimal: 223.1.1.0/24
Same address as binary: 11011111 . 00000001 . 00000001. 00000000
                        \_______   ________   _______/
                                    \_These 24 bits must stay the
                                     same for all hosts in the network
Example host address within the network: 223.1.1.129/24
Same address as binary: 11011111 . 00000001 . 00000001. 10000001
                                                        \______/
                            Mask is the same but now the ___/
                            right most 8 bits can be modified
```

- When a router receives an IP address it must look up the address in its routing table to ensure that it is sent to the right location. To get it to the correct subnet it matches the prefix of the IP address to a subnet with the same prefix. Under the mask system defined above two subnets can have the same prefix to their prefix for one of the subnets. To ensure the router sends the data to the right subnet it makes sure it is matching the IP address to send to the longest of the two prefixes that matches the IP address.

### I can step though the DHCP protocol and show how it is used to assign IP addresses

1. **DHCP server discovery**  
When a new host connects to a network it must find a DHCP server to assign it a new IP within the network. Because the client just connected it doesn't know where it is or where the DHCP server could be so it broadcasts a DHCP discover message using an IP destination of 255.255.255.255 and source IP of 0.0.0.0.
2. **DHCP server offer(s)**  
The broadcast will reach all nodes in the subnet including any DHCP servers. When the DHCP servers receive the discover message they respond with a DHCP offer message sent to all users because they too do not know the location of the new host yet. This offer includes a yiaddr that the host can use, Lifetime (an amount of time they can keep that address), and the DHCP server's IP address.
3. **DHCP request**  
Now that the host knows a possible IP address (or multiple if there are multiple DHCP servers) it also knows the subnet mask. It will respond to the server with a requested yiaddrr.
4. **DHCP ACK**  
Finally, the DHCP server responds confirming that the request is fulfilled as specified by the host in the previous step.
