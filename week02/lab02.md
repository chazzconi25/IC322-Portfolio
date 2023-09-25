# Week Two: The Application Layer

## Lab: Wireshark Introduction

### Introduction
In this lab I did a basic usage of wireshark where I practiced monitioring my computers ethernet access and saw what was in an HTTP packet request and response.
### Collaboration
I did nto collabrate on this lab.
### Process
I used the instructions in the lab linked [here](http://gaia.cs.umass.edu/kurose_ross/wireshark.php).
### Questions
1.	Which of the following protocols are shown as appearing (i.e., are listed in the Wireshark “protocol” column) in your trace file: TCP, QUIC, HTTP, DNS, UDP, TLSv1.2?
 When I was capturing packets going through the network I saw TCP, HTTP, DNS, UDP (not listd under protocol but used for DNS), and TLSv1.2

2.	How long did it take from when the HTTP GET message was sent until the HTTP OK reply was received? By default, the value of the Time column in the packet-listing window is the amount of time, in seconds, since Wireshark tracing began.  (If you want to display the Time field in time-of-day format, select the Wireshark View pull down menu, then select Time Display Format, then select Time-of-day.)
- The HTTP GET message was sent at time 58.481229 and the response was recieved at 58.502830. It took 0.021601s between message and reply.
- I decided to just use the time since the sniffing began to calculate the time between message and reply because the answer is the same either way.

3.	What is the Internet address of the gaia.cs.umass.edu (also known as www-net.cs.umass.edu)?  What is the Internet address of your computer or (if you are using the trace file) the computer that sent the HTTP GET message?
- The Internet address of the gaia.cs.umass.edu is 128.119.245.12 This is the destination of the GET request.
- The Internet address of my computer is 10.16.146.82 This is the source of the GET request.

4.	Expand the information on the HTTP message in the Wireshark “Details of selected packet” window (see Figure 3 above) so you can see the fields in the HTTP GET request message. What type of Web browser issued the HTTP request?  The answer is shown at the right end of the information following the “User-Agent:” field in the expanded HTTP message display. [This field value in the HTTP message is how a web server learns what type of browser you are using.]
- I know that I used Chrome and I can see Chrome in the string of the User Agent but this line also mentions WebKit, Safari, and Mozilla/5.0. I was confused by this so I found this [Reddit Post](https://www.reddit.com/r/wireshark/comments/o1s7nf/help_breaking_down_user_agent/) quoting a blog where apparently all of these browsers pretend to be each other so the user agent string is a mess and not all that useful for determining the browser of the HTTP request.

5.	Expand the information on the Transmission Control Protocol for this packet in the Wireshark “Details of selected packet” window (see Figure 3 in the lab writeup) so you can see the fields in the TCP segment carrying the HTTP message. What is the destination port number (the number following “Dest Port:” for the TCP segment containing the HTTP request) to which this HTTP request is being sent?
- The destination port is 80.

6.	Print the two HTTP messages (GET and OK) referred to in question 2 above. To do so, select Print from the Wireshark File command menu, and select the “Selected Packet Only” and “Print as displayed” radial buttons, and then click OK.
- [Linked in portfolio here](http_messages_lab01_question06.pdf)
