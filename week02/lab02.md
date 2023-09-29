# Week Two: The Application Layer

## Lab: Wireshark HTTP

### Introduction

### Collaboration
I asked a classmate about one of the questions on this lab. They were not helpful.
### Process
I used the instructions in the lab linked [here](https://gaia.cs.umass.edu/kurose_ross/wireshark.php).
I used the trace file however because everything about this course doesn't work in actual application and is completely broken and frustrating. Never have I seen so much red just trying to get an assignment done. I am extremly stressed and angry. I hate this.

Trace files used:<br>
- http-wireshark-trace2-1
- http-wireshark-trace3-1
- http-wireshark-trace4-1
- http-wireshark-trace5-1

>No I'm not going to link them here. you can find them yourself if you're so intrested. Just go to the link in the process section.
### Questions
#### The Basic HTTP GET/response interaction
***
1. Is your browser running HTTP version 1.0, 1.1, or 2? What version of HTTP is the server running?
- Both the server and my browser are running HTTP version 1.1

2. What languages (if any) does your browser indicate that it can accept to the server?
- en-US or en

3. What is the IP address of your computer? What is the IP address of the gaia.cs.umass.edu server?
- The IP of the computer the trace is from is 10.0.0.44 and the IP of the server is 128.119.245.12

4. What is the status code returned from the server to your browser?
-  The status code returned was 200 OK for the html file.

5. When was the HTML file that you are retrieving last modified at the server?
```
Last-Modified: Sat, 30 Jan 2021 06:59:02 GMT\r\n
```
6. How many bytes of content are being returned to your browser?
- 371 bytes
```
Content-Length: 371\r\n
```

7. By inspecting the raw data in the packet content window, do you see any headers within the data that are not displayed in the packet-listing window? If so, name one.
- I do not. Another student told me that the acknoledgment number is there but that is a part of TCP which is on a different layer than HTTP.

#### The HTTP CONDITIONAL GET/response interaction
***
8. Inspect the contents of the first HTTP GET request from your browser to the server. Do you see an “IF-MODIFIED-SINCE” line in the HTTP GET?
- No.

9. Inspect the contents of the server response. Did the server explicitly return the contents of the file? How can you tell?
- The server did return the contents of the file, I can tell becauese I can see the data attached to the response after the header.
```html
<html><br>
    Congratulations again!  Now you've downloaded the file lab2-2.html. <br>
    This file's last modification date will not change.  <br>
    Thus  if you download this multiple times on your browser, a complete copy <br>
    will only be sent once by the server due to the inclusion of the IN-MODIFIED-SINCE <br>
    field in your browser's HTTP GET request to the server.<br>
<html>

```

10. Now inspect the contents of the second HTTP GET request from your browser to the server. Do you see an “IF-MODIFIED-SINCE:” line in the HTTP GET6? If so, what information follows the “IF-MODIFIED-SINCE:” header?
- Yes, this is what wireshark displays:
```
If-Modified-Since: Sat, 30 Jan 2021 06:59:02 GMT\r\n
```

11. What is the HTTP status code and phrase returned from the server in response to this second HTTP GET? Did the server explicitly return the contents of the file? Explain
```
HTTP/1.1 304 Not Modified\r\n
```
- The server did not return the HTML file explicitly because the file hasn't been modified since it was last requsted. Hence the 304 response. I can also tell because the HTML code is not attached as data and this packet is significantly shorter than the inital response. The inital response was 796 bytes and the second was 305 bytes. 

#### Retrieving Long Documents
***
12. How many HTTP GET request messages did your browser send? Which packet number in the trace contains the GET message for the Bill or Rights?
- The browser sent one HTTP GET request.
- The GET message for the Bill of Rights is in the first packet, frame 26.

13. Which packet number in the trace contains the status code and phrase associated with the response to the HTTP GET request?
- The response with the code is in the first packet of the response, frame 32. 

14. What is the status code and phrase in the response?
```
HTTP/1.1 200 OK\r\n
```

15. How many data-containing TCP segments were needed to carry the single HTTP response and the text of the Bill of Rights?
- Four

#### HTML Documents with Embedded Object
16. How many HTTP GET request messages did your browser send? To which Internet addresses were these GET requests sent?

- The browser sent three HTTP GET request messages. The addresses are listed below.
    - http://gaia.cs.umass.edu/wireshark-labs/HTTP-wireshark-file4.html
    - http://gaia.cs.umass.edu/pearson.png
    - http://kurose.cslash.net/8E_cover_small.jpg

17. Can you tell whether your browser downloaded the two images serially, or whether they were downloaded from the two web sites in parallel? Explain.
- I think the browser downloaded the images serially because the first package is requested at time 3.072335 and it is returned at time 3.092770. The time of the second request is 3.309908 with a response at time 3.451822. This sequential timing leads me to believe the downloads happen serially.

#### HTTP Authentication
***
18. What is the server’s response (status code and phrase) in response to the initial HTTP GET message from your browser?
```
HTTP/1.1 401 Unauthorized\r\n
```
19. When your browser’s sends the HTTP GET message for the second time, what new field is included in the HTTP GET message?
```
Authorization: Basic d2lyZXNoYXJrLXN0dWRlbnRzOm5ldHdvcms=\r\n
```
- Wireshark also included this: Credentials: wireshark-students:network
