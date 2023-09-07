# Week One: The Internet

## Learning Goals

### I can explain the role that the network core plays vs the network edge.
The network edge describes all of the end users and the edge router that connects them to the network core. The purpose of this first link in the internet is to connect users and applications from a subnet to the greater internet. This is primarily achieved by using a local base station or link layer switch to connect a variety of physically close devices to an edge router.

All of the devices and connections between them in the edge are hyper local and usually consolidated to one household or enterprise. These devices are ultimately connected to the edge router which is the access point that links the network edge to the network core. All of the local devices connected in a subnet are ultimately linked to the core via an edge router.

The network core consists of all of the data moving between subnets past the edge router. Edge routers ultimately communicate with local ISPs which move data to higher tiers of ISPs. Unlike the edge, the core is responsible for moving data over much larger distances at greater speeds.

### I can compare different physical technologies used in access networks, including dial-up, DSL, cable, fiber, and wireless.

**DSL**
- Internet provided by telephone service provider or telco using telephone infrastructure.
- Endusers submit data via a DSL modem for their telephone and data traffic to be combined.
- Data and telephone traffic is separated by a DSLAM at a telco Central Office to be sent over the internet or telephone network.
- The current version of DSL has an upstream/downstream of 1 Gbps. Earlier versions had slower, asymmetric speeds.
- Two downsides are that the actual upstream/downstream speeds of the data can be throttled by the telco or impacted by twisted wire gauge/distance from enduser to CO.

**Cable**
- Internet provided by cable television company using cable infrastructure.
- Endusers submit data via the hybrid fiber coax. End users use a cable modem to transfer data to coax. Neighborhood connected by coax cables send data to fiber nodes which in turn send data via fiber to the cable head end.
- The cable head end connects to the internet via a CMTS which is similar to a DSLAM for cable.
- One downside of cable is that it is a shared broadcast medium. All packets sent upstream/downstream on every link to every home. Multiple end users in one neighborhood thus leads to slower rates.

**Fiber**
- Takes advantage of FTTH, Fiber To The Home, to provide optical fiber directly from the CO to homes rather than converting Coax to fiber.
- Potentially gigabits per second speeds
- Fiber is provided to homes via direct fiber, Active Optical Networks (AONs) and Passive Optical Networks (PONs). The latter two use splitters to split one optical connection from the neighborhood for neighborhoods.
    - Direct fiber runs an individual fiber cable to each home from the CO
    - Active Optical Networks are essentially switched ethernet
    - Passive Optical Networks have a Optical Line Terminator at the CO and each home. Optical signals are split and fed to OLTs at each home.

**Wireless**
- 5G Fixed Wireless requires no cabling from CO to homes. Internet is cent via beam-forming technology from a provider's base station to a modem in the home.
- Cabling is often failure prone and costly so avoiding it is good.

### I can use queuing, transmission, and propagation delays to calculate total packet delay, I can describe the underlying causes for these delays, and I can propose ways to improve packet delay on a network.


### I can describe the differences between packet-switched networks and circuit-switched networks.

### I can describe how to create multiple channels in a single medium using FDM and TDM.

### I can describe the hierarchy of ISPs and how ISPs at different or similar levels interact.

### I can explain how encapsulation is used to implement the layered model of the Internet.
