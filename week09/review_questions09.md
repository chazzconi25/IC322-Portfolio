# Week Nine: Network Layer: Control Plane

## Review Questions

### R5: What is the "count to infinity" problem in distance vector routing?

When a node running distance vector sees that a change has occurred on a link cost from itself to another node it updates its distance vector and informs neighbors if there is a change to one of the least cost paths. When costs go down this works seamlessly as it only takes two iterations of distance vector algorithm to propagate this new value through the network. If costs go up it is another story. If a link cost goes up than the algorithm must be iterated over enough times to exceed the new path length because neighbors of the node with an updated path length will advertize lower cost routes. Unfortunatly, these lower routs go through the original node and through the now more expensive link, they just don't know that yet. The count to ∞ problem refers to this issue. If the updated link were very large in comparison to the orginal link, like going from 1 to 10000, possibly 9999 iterations would be needed if other paths to the target node were just under 10000.

### R8: True or false: When an OSPF route sends its link state information, it is sent only to those nodes directly attached neighbors. Explain

False, OSPF broadcasts routing information to all other routers in the AS. These broadcasts are sent whenever a link updates cost or periodically. This is so that all nodes have an up to date graph of the entire network for running the Link State algorithm.

### R9: What is meant by an area in an OSPF autonomous system? Why was the concept of an area introduced?

An area is a section of routers within an OSPF system that can be organized into a hierarchy of other areas. Each area runs its own OSPF link-state routing algorithm. One area is dedicated the backbone area with the purpose of routing traffic between other areas in the AS. It was introduced to support a hierarchy within a single AS so that if ISPs were too large the could still scale their AS with inter-AS routing.

### P3: Consider the following network. With the indicated link costs, use Dijkstra’s shortest-path algorithm to compute the shortest path from x to all network nodes. Show how the algorithm works by computing a table similar to Table 5.1

| Step | N'      | D(z),P(z) | D(y),P(y) | D(u),P(u) | D(w),P(w) | D(v),P(v) | D(t),P(t) |
|------|---------|-----------|-----------|-----------|-----------|-----------|-----------|
| 0    | x       | 8,x       | 6,x       | ∞  | 6,x       | 3,x       | ∞  |
| 1    | xv      | 8,x       | 6,x       | 6,v       | 6,x       | ---       | 7,v       |
| 2    | xvy     | 8,x       | ---       | 6,v       | 6,x       |           | 7,v       |
| 3    | xvyu    | 8,x       |           | ---       |           |           | 7,v       |
| 4    | xvyuw   | 8,x       |           |           |           |           | 7,v       |
| 5    | xvyuwt  | 8,x       |           |           |           |           | ---       |
| 6    | xvyuwtz | 8,x       |           |           |           |           |           |

### P4: Consider the network shown in Problem P3. Using Dijkstra’s algorithm, and showing your work using a table similar to Table 5.1, do the following: (only nodes v, y, and w)

**V:**
| Step | N'      | D(z),P(z) | D(y),P(y) | D(u),P(u) | D(w),P(w) | D(x),P(x) | D(t),P(t) |
|------|---------|-----------|-----------|-----------|-----------|-----------|-----------|
| 0    | v       | ∞         | 8,v       | 3,u       | 4,v       | 3,v       | 4,v       |
| 1    | vx      | 11,x      | 8,v       | 3,u       | 4,v       | ---       | 4,v       |
| 2    | vxu     | 11,x      | 8,v       | ---       | 4,v       |           | 4,v       |
| 3    | vxut    | 11,x      | 8,v       |           | 4,v       |           | ---       |
| 4    | vxutw   | 11,x      | 8,v       |           | ---       |           |           |
| 5    | vxutwy  | 11,x      | 8,v       |           |           |           |           |
| 6    | vxutwyz | 11,x      | ---       |           |           |           |           |

**Y:**
| Step | N'     | D(z),P(z) | D(x),P(x) | D(u),P(u) | D(w),P(w) | D(v),P(v) | D(t),P(t) |
|------|--------|-----------|-----------|-----------|-----------|-----------|-----------|
| 0    | y      | 12,y      | 6,y       | ∞         | ∞         | 8,y       | 7,y       |
| 1    | yx     | 12,y      | ---       | ∞         | 12,x      | 8,y       | 7,y       |
| 2    | yxt    | 12,y      |           | 9,t       | 12,x      | 8,y       | ---       |
| 3    | yxtv   | 12,y      |           | 9,t       | 12,x      | ---       |           |
| 4    | yxtvu  | 12,y      |           | ---       | 12,x      |           |           |
| 5    | yxtvuz | ---       |           |           | 12,x      |           |           |
| 6    | yxtvuzw|           |           |           | ----      |           |           |

**W:**
| Step | N'      | D(z),P(z) | D(y),P(y) | D(u),P(u) | D(v),P(v) | D(x),P(x) | D(t),P(t) |
|------|---------|-----------|-----------|-----------|-----------|-----------|-----------|
| 0    | w       | ∞         | ∞         | 3,w       | 4,w       | 6,w       | ∞         |
| 1    | wu      | ∞         | ∞         | ---       | 4,w       | 6,w       | 5,v       |
| 2    | wuv     | ∞         | 12,v      |           | ---       | 6,w       | 5,v       |
| 3    | wuvt    | ∞         | 12,v      |           |           | 6,w       | ---       |
| 4    | wuvtx   | 14,x      | 12,v      |           |           | ---       |           |
| 5    | wuvtxy  | 14,x      | ----      |           |           |           |           |
| 6    | wuvtxyz | ----      |           |           |           |           |           |

### P5: Consider the network shown below. Assume that each node initially knows the costs to each of its neighbors. Consider the distance-vector algorithm and show the distance table entries at node z

**initial**
|    | z | v | x |
|----|---|---|---|
| z  | 0 | 6 | 2 |
| v  | ∞ | ∞ | ∞ |
| x  | ∞ | ∞ | ∞ |

**z shares with x and v**
|    | z | v | x | u | y |
|----|---|---|---|---|---|
| z  | 0 | 6 | 2 | ∞ | ∞ |
| v  | 6 | 0 | 3 | 1 | ∞ |
| x  | 2 | 3 | 0 | ∞ | ∞ |

**z computes**
|    | z | v | x | u | y |
|----|---|---|---|---|---|
| z  | 0 | 6 | 2 | 6 | 5 |
| v  | 6 | 0 | 3 | 1 | ∞ |
| x  | 2 | 3 | 0 | ∞ | 3 |

**z shares with x and v**
|    | z | v | x | u | y |
|----|---|---|---|---|---|
| z  | 0 | 6 | 2 | 6 | 5 |
| v  | 6 | 0 | 3 | 1 | 3 |
| x  | 2 | 3 | 0 | 4 | 3 |

**z computes**
|    | z | v | x | u | y |
|----|---|---|---|---|---|
| z  | 0 | 5 | 2 | 6 | 5 |
| v  | 6 | 0 | 3 | 1 | 3 |
| x  | 2 | 3 | 0 | 4 | 3 |

### P11: Consider Figure 5.7. Suppose there is another router w, connected to router y and z. The costs of all links are given as follows: c(x,y) = 4, c(x,z) = 50, c(y,w) = 1, c(z,w) = 1, c(y,z) = 3. Suppose that poisoned reverse is used in the distance-vector routing algorithm

1. When the distance vector routing is stabilized, router w, y, and z inform their distances to x to each other. What distance values do they tell each other?

| router   | information                      |
|----------|----------------------------------|
| router z | informs w, Dz(x) = ∞      |
|          | informs y, Dz(x) = 6             |
| router w | informs y, Dw(x) = ∞       |
|          | informs z, Dw(x) = 5              |
| router y | informs w, Dy(x) = 4             |
|          | informs z, Dy(x) = 4             |

2. Now suppose that the link cost between x and y increases to 60. Will there be a count-to-∞ problem even if poisoned reverse is used? Why or why not? If there is a count-to-∞ problem, then how many iterations are needed for the distance-vector routing to reach a stable state again? Justify your answer.

Yes there still will be a count to ∞ problem. This is because the link from w to its notes will create a shorter path than y to z which is 3. This causes poisoned reverse to fail.

3. How do you modify c(y,z) such that there is no count-to-infinity problem at all if c(y,x) changes from 4 to 60?

Hiding the link from node z to x will solve the count-to-infinity problem.
