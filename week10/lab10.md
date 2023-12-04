# Week Ten: Network Layer: More Control Plane

## Lab: ICMP pinger

### Introduction

In this lab I wasted a ton of time trying to figure out ways around Ward halls crappy security. I made a ping appllication that pings websites using ICMP.

### Collaboration

Asked my roommate David Kreidler questions until I realzied my program doesn't work because ITSD doesn't let me have WSL2.

### Process

[icmp.py](Heres my code.) Huge waste of three hours.

```python
from socket import *
import os
import sys
import struct
import time
import select
import binascii
ICMP_ECHO_REQUEST = 8

def checksum(data):
    """This checksum function takes bytes instead of a string."""
    csum = 0
    countTo = (len(data) // 2) * 2
    count = 0
    while count < countTo:
        thisVal = ord(data[count+1]) * 256 + ord(data[count])
        csum += thisVal
        csum &= 0xffffffff
        count += 2
    if countTo < len(data):
        csum += ord(data[len(data) - 1])
        csum &= 0xffffffff
    csum = (csum >> 16) + (csum & 0xffff)
    csum += csum >> 16
    answer = ~csum
    answer &= 0xffff
    answer = answer >> 8 | (answer << 8 & 0xff00)
    return answer

def receiveOnePing(mySocket, ID, timeout, destAddr):
    timeLeft = timeout
    while 1:
        startedSelect = time.time()
        whatReady = select.select([mySocket], [], [], timeLeft)
        howLongInSelect = (time.time() - startedSelect)
        if whatReady[0] == []: # Timeout
            return "Request timed out."
        timeReceived = time.time()
        recPacket, addr = mySocket.recvfrom(1024)
        #Fill in start
        #Fetch the ICMP header from the IP packet
        icmpH = recPacket[20: 28]
        icmp_identifier = struct.unpack('bbHHh', icmpH)[3]
        
        
        if icmp_identifier == ID:
            timeSent = struct.unpack('d', recPacket[28: 36])[0]
            rtt = timeReceived - timeSent
            return rtt
        #Fill in end
    timeLeft = timeLeft - howLongInSelect
    if timeLeft <= 0:
        return "Request timed out."

def sendOnePing(mySocket, destAddr, ID):
    # Header is type (8), code (8), checksum (16), id (16), sequence (16)
    myChecksum = 0
    # Make a dummy header with a 0 checksum
    # struct -- Interpret strings as packed binary data
    header = struct.pack("bbHHh", ICMP_ECHO_REQUEST, 0, myChecksum, ID, 1)
    data = struct.pack("d", time.time())
    # Calculate the checksum on the data and the dummy header.
    myChecksum = checksum(str(header + data))
    # Get the right checksum, and put in the header
    if sys.platform == 'darwin':
        # Convert 16-bit integers from host to network byte order
        myChecksum = htons(myChecksum) & 0xffff
    else:
        myChecksum = htons(myChecksum)
        header = struct.pack("bbHHh", ICMP_ECHO_REQUEST, 0, myChecksum, ID, 1)
        packet = header + data
        mySocket.sendto(packet, (destAddr, 1)) # AF_INET address must be tuple, not str
        # Both LISTS and TUPLES consist of a number of objects
        # which can be referenced by their position number within the object.

def doOnePing(destAddr, timeout):
    icmp = getprotobyname("icmp")
    # SOCK_RAW is a powerful socket type. For more details: http://sockraw.org/papers/sock_raw
    mySocket = socket(AF_INET, SOCK_RAW, icmp)
    myID = os.getpid() & 0xFFFF # Return the current process i
    sendOnePing(mySocket, destAddr, myID)
    delay = receiveOnePing(mySocket, myID, timeout, destAddr)
    mySocket.close()
    return delay

def ping(host, timeout=1):
    # timeout=1 means: If one second goes by without a reply from the server,
    # the client assumes that either the client's ping or the server's pong is lost
    dest = gethostbyname(host)
    print("Pinging " + dest + " using Python:")
    print("")
    # Send ping requests to a server separated by approximately one second
    while 1 :
        delay = doOnePing(dest, timeout)
        print(delay)
        time.sleep(1)# one second
        return delay
    
print('localhost')
ping('127.0.0.1')

print('United States')
ping("https://www.usa.gov/")

print("Europe")
ping("https://european-union.europa.eu/index_en")

print("South America")
ping("https://www.gov.br/pt-br")

print("Asia")
ping("https://www.taiwan.gov.tw/")

print("Australia")
ping("https://www.pm.gov.au/")

print("Africa")
ping("https://www.gov.za/")

```

### Running the Program

You need sudo permissions so fat chance running this on a lab computer if your a mid.

```text
sudo python3 icmp.py
```

### Questions

Below is the output from running the program. I know it works because localhost works. Google also works so I know my program is good. I assume other countries/ the usa website don't work because I go to the worse school to learn networks because apparenly china and russia government websites are banned so I wouldn't be surprised if this crumby school was stopping my program. Also I tried different crap for like an hour and realized that I was using my terrible WSL which this school disables internet on. :/

```text
localhost
Pinging 127.0.0.1 using Python:

0.00017070770263671875
United States
Pinging 99.86.229.6 using Python:

Request timed out.
Europe
Pinging 18.154.227.66 using Python:

Request timed out.
South America
Pinging 161.148.164.31 using Python:

Request timed out.
Asia
Pinging 3.163.101.104 using Python:

Request timed out.
Australia
Pinging 45.60.195.154 using Python:

Request timed out.
Africa
Pinging 164.151.129.20 using Python:

Request timed out.
```
