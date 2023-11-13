# Week Twelve: Link Layer

## Review Questions

### R4: Suppose two nodes start to transmit at the same time a packet of length L over a broadcast channel of rate R. Denote the propagation delay between the two nodes as $d_{prop}$. Will there be a collision if $d_{prop}$ < L/R? Why or why not?


***

### R5: In Section 6.3, we listed four desirable characteristics of a broadcast channel. Which of these characteristics does slotted ALOHA have? Which of these characteristics does token passing have?

The four desirable characteristics of a broadcast channel are:

1. When only one node has data to send, that node has a throughput of $R$ bps.
2. When $M$ nodes have data to send, each of these nodes has a throughput of $\frac{R}{M}$ bps. This need not necessarily imply that each of the $M$ nodes always has an instantaneous rate of $\frac{R}{M}$, but rather that each node should have an average transmission rate of $\frac{R}{M}$ over some suitably defined interval of time.
3. The protocol is decentralized; that is, there is no master node that represents a single point of failure for the network.
4. The protocol is simple, so that it is inexpensive to implement.

- Slotted ALOHA covers 3 and 4 but not 1 and 2
  - Slotted ALOHA does not depend on a master node and it is simple to implement because all the nodes just need to have a synchronized time to work. Therefore 3 and 4 are covered.
  - In slotted Aloha each node has a probability to send $p$ (a fraction) on each time slot defined as $\frac{L}{R}$ seconds. This means each time slot is enough for one frame to be sent. Unfortunately the rate at which a node can send is limited by $p$ making the effective transmission rate $p*R$. If there is just one node sending or M, the rate will be less than both $R$ and $\frac{R}{M}$.
- Token Passing covers 1, 2, and 4 and technically covers 3
  - Under token passing whichever node has the token can broadcast up to $R$ bps and if Multiple nodes need to broadcast all they need to do is wait for the token to broadcast at $R$ achieving $\frac{R}{M}$ bps. It is also simple to implement.
  - Token passing technically covers 3 in that there is no master node so it is decentralized but if one node is off or fails to pass the token the whole chanel crashes.

***

### R6: In CSMA/CD, after the fifth collision, what is the probability that a node chooses K = 4? The result K = 4 corresponds to a delay of how many seconds on a 10 Mbps Ethernet?


***

## Problems

### P1: Suppose the information content of a packet is the bit pattern 1110 0110 1001 0101 and an even parity scheme is being used. What would the value of the field containing the parity bits be for the case of a two-dimensional parity scheme? Your answer should be such that a minimum-length checksum field is used

***

### P3: Suppose the information portion of a packet(D in Figure 6.3) contains 10 bytes consisting of the 8-bit unsigned binary ASCII representation of string "Internet." Compute the Internet checksum for this data

***

### P6: Consider the 5-bit generator, $G = 10011$, and suppose that $D$ has the value listed below. What is $R$ for each $D$?

For CRC checks the following formula is used to calculate $R$. Where $r = len(G)-1$.
$$R=remainder\frac{D*2^r}{G}$$
> I made a python script to do this for me because I refuse to learn binary long division.0 [Had to beat ChatGPT over the head to get the string to format properly.](https://chat.openai.com/c/c84befcb-a042-49ea-82fb-d344b91403b6) I wrote everything else on my own

```python
G = input('Enter G: ')
r = len(G)-1
G = int(G, 2)
D = input('Enter D: ')
D = int(D, 2)
R = (D*(2**r))%G
R = bin(R)
print(f"R is: {R[2:]:0>{r}}") #This line was written by ChatGPT
```

1. $D = 1000100101$ --> $R = 0110$
2. $D = 0101101010$ --> $R = 10000$
3. $D = 0110100011$ --> $R = 10000$

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

### P13:


***