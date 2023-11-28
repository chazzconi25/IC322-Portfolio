# Week Twelve: Link Layer

## Review Questions

### R4: Suppose two nodes start to transmit at the same time a packet of length $L$ over a broadcast channel of rate $R$. Denote the propagation delay between the two nodes as $d_{prop}$. Will there be a collision if $d_{prop} < \frac{L}{R}$? Why or why not?

There will be a collision because the packets have not finished moving across the wire so they will collide.

***

### R5: In Section 6.3, we listed four desirable characteristics of a broadcast channel. Which of these characteristics does slotted ALOHA have? Which of these characteristics does token passing have?

The four desirable characteristics of a broadcast channel are:

1. When only one node has data to send, that node has a throughput of $R$ bps.
2. When $M$ nodes have data to send, each of these nodes has a throughput of $\frac{R}{M}$ bps. This need not necessarily imply that each of the $M$ nodes always has an instantaneous rate of $\frac{R}{M}$, but rather that each node should have an average transmission rate of $\frac{R}{M}$ over some suitably defined interval of time.
3. The protocol is decentralized; that is, there is no master node that represents a single point of failure for the network.
4. The protocol is simple, so that it is inexpensive to implement.

- Slotted ALOHA covers 1, 3, and 4 but not 2
  - Slotted ALOHA does not depend on a master node and it is simple to implement because all the nodes just need to have a synchronized time to work. If only one node is sending there will be no collisions and no need to retransmit so $R$ will be achieved.
  - In slotted Aloha each node has a probability to retransmit $p$ (a fraction) on each time slot defined as $\frac{L}{R}$ seconds. This means each time slot is enough for one frame to be sent. Unfortunately the rate at which a node can send is limited by $p$ making the effective transmission rate $p*R$ for multiple nodes so $\frac{R}{M}$ is not achieved.
- Token Passing covers 1, 2, and 4 and technically covers 3
  - Under token passing whichever node has the token can broadcast up to $R$ bps and if Multiple nodes need to broadcast all they need to do is wait for the token to broadcast at $R$ achieving $\frac{R}{M}$ bps. It is also simple to implement.
  - Token passing technically covers 3 in that there is no master node so it is decentralized but if one node is off or fails to pass the token the whole chanel crashes.

***

### R6: In CSMA/CD, after the fifth collision, what is the probability that a node chooses K = 4? The result K = 4 corresponds to a delay of how many seconds on a 10 Mbps Ethernet?


***

## Problems

### P1: Suppose the information content of a packet is the bit pattern 1110 0110 1001 0101 and an even parity scheme is being used. What would the value of the field containing the parity bits be for the case of a two-dimensional parity scheme? Your answer should be such that a minimum-length checksum field is used

```text
1110|1
0110|0
1001|0
0101|0
----+-
0100|1

parity bits: 0100 1000 1
```

***

### P3: Suppose the information portion of a packet(D in Figure 6.3) contains 10 bytes consisting of the 8-bit unsigned binary ASCII representation of string "Internet." Compute the Internet checksum for this data

```text
01101001 01101110 01110100 01100101 01110010 01101110 01100101 01110100 00101110 00000000
\_______________/ \_______________/ \_______________/ \_______________/ \_______________/
      26990      +      29797      +      29294      +      25972      +      11776
                                        = 123829
                                        =11110001110110101
                      Ones Complement -->00001110001001010
                  (internet checksum)                                  
```

***

### P6: Consider the 5-bit generator, $G = 10011$, and suppose that $D$ has the value listed below. What is $R$ for each $D$?

For CRC checks the following formula is used to calculate $R$. Where $r = len(G)-1$.
$$R=remainder\frac{D*2^r}{G}$$

1. $D = 1000100101$ --> $R = 0100$

```text
      _____1001001000
10011 )10001001010000
       10011      
          100     
          000     
          1000    
          0000    
          10001   
          10011   
             100  
             000  
             1001 
             0000 
             10010
             10011
                 10
                 00
                 100
                 000
                 1000


```

2. $D = 0101101010$ --> $R = 0101$

```text
      ______10101
10011 )0101101010
       -10011        
       =0010110    
         -10011     
         =0010110 
           -10011  
           =00101
```

3. $D = 0110100011$ --> $R = 1011$

```text
      ______11000
10011 )0110100011
       -10011        
       =010010    
        -10011     
        =00001011
```

***

### P11: Suppose four active nodes—nodes A, B, C and D—are competing for access to a channel using slotted ALOHA. Assume each node has an infinite number of packets to send. Each node attempts to transmit in each slot with probability

1. What is the probability that node A succeeds for the first time in slot 4?

Probability A succeeds at any time slot:
$$p(1-p)^3$$

Probability A does not succeed at any time slot:
$$1-(p(1-p)^3)$$

Probability A does not succeed for 3 time slots:
$$(1-(p(1-p)^3))^3$$

Probability A does not succeed for 3 time slots and then succeeds for the first time at 4:
$$(1-(p(1-p)^3))^3*(p(1-p)^3)$$

2. What is the probability that some node (either A, B, C or D) succeeds in slot 5?
$$p(1-p)^3$$

3. What is the probability that the first success occurs in slot 4?
$$N(1-(p(1-p)^3))^3*(p(1-p)^3)$$

4. What is the efficiency of this four-node system?
$$4p(1-p)^3$$

***

### P13: Consider a broadcast channel with $N$ nodes and a transmission rate of $R$ bps. Suppose the broadcast channel uses polling (with an additional polling node) for multiple access. Suppose the amount of time from when a node completes transmission until the subsequent node is permitted to transmit (that is, the polling delay) is $d_{poll}$. Suppose that within a polling round, a given node is allowed to transmit at most {Q} bits. What is the maximum throughput of the broadcast channel?

$$ R = \frac{bits}{second}\ Q=bits\ N= number\ of\ nodes$$

- To get the total throughput for the channel we need the total number of bits sent in one round of polling divided by the time it takes for a round of polling.

$$ R_{total} = \frac{bits_{total}}{time_{total}} $$

- In a round of polling each node gets to send Q bits after they are polled.

$$ {bits_{total} = N*Q} $$

- In a round of polling each node transmits $Q$ bits and therefore requires time $\frac{Q}{R}$. Before each node can transmit however, time is used for the $d_{poll}$.

$$ {time_{total} = N*(\frac{Q}{R}+d_{poll})} $$

- The total throughput can be written as:

$$ R_{total} = \frac{N*Q}{N*(\frac{Q}{R}+d_{poll})} $$

- Simplified

$$ R_{total} = \frac{Q}{(\frac{Q}{R}+d_{poll})} $$

***
