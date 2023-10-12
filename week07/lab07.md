# Week Seven: The Network Layer: Data Plane

## Lab: Protocol Pioneer

### How did you solve Chapter 1? Please copy and paste your winning strategy, and also explain it in English

Chapter one was easy! All I had to do was switch the interface I was broadcasting on from north to west for the message to reach the mother ship because I was receiving messages from them into my west interface. I then had to switch the message payload to be "Message Received" rather than mayday because thats what the mother ship requested.

```python3
# Welcome to the StellarScript Console. This is where you will program your
# communication strategy.
#
# Once every "tick", the `process_strategy()` function is called. During this function call,
# you should:
# 1. Check for messages that you received since the last tick
# 2. Send any messages you want to send.
# 3. Keep track of any state

def process_strategy(self):

    # You have a `self.message_queue()` variable that you can access. It's a simple
    # Python List. Each element has a `text` and `interface` element.
    # Note that there is a one-tick processing delay: a message will arrive at your ship,
    # it will disappear (it is being processed), and the next tick it will arrive in
    # your queue.
    while(self.message_queue):
        m = self.message_queue.pop()
        print(f"Msg on interface {m.interface}: {m.text}")

    # You also have a `self.state` variable available to use. This is useful if you want
    # to remember things between ticks. `self.state` is a Python Dict with string keys.
    if "ticks" not in self.state:
        self.state["ticks"] = 1
    else:
        self.state["ticks"] += 1
    print(f"Tick {self.state['ticks']}...")

    # You can send a message using the `self.send_message()` function. The
    # function takes 2 string arguments: `message` and `interface`.
    # `message` is the text of the message and `interface` is either "N", "S", "E", or "W".
    # The value of `interface` determines which direction the message will be
    # sent out on. "N" is the northern interface, "S" is the southern interface, etc.
    if self.state["ticks"] % 2 == 0:
        self.send_message("Message Received", "W")


# You can set `wait_for_user` to be True if you want the game to pause every tick.
s = Scenario1(process_strategy, wait_for_user=False)
s.run()
```

### How did you solve Chapter 2? Again, copy and paste your winning strategy and explain it

Chapter 2 was a little bit harder! Using the dictionary of interfaces mapped to an array that represented number of messages from that interface and sum of messages from that interface I was able to loop over the dictionary and check if I had received three messages on any particular interface. If I had I then sent the sum of all the messages back to that same interface.

```python3
# Welcome back to the StellarScript Console!

def process_strategy(self):

    # Initialize your state variable
    if "received" not in self.state:
        # You can use this value to keep track of the messages you get.
        # You can store the total message count as self.state["received"][interface][0],
        # and the sum as self.state["received"][interface][1]. If you want.
        self.state["received"] = {
            "N": [0,0],
            "S": [0,0],
            "E": [0,0],
            "W": [0,0]
        } 
    
    while(self.message_queue):
        m = self.message_queue.pop()
        print(f"Msg on interface {m.interface}: {m.text}")
        self.state["received"][m.interface][0] = self.state["received"][m.interface][0] + 1
        self.state["received"][m.interface][1] = self.state["received"][m.interface][1] + int(m.text)

    for interface in self.state["received"].keys():
        if self.state["received"][interface][0] == 3:
            self.send_message(self.state["received"][interface][1], interface)
            self.state["received"][interface][0] = 0

# Remember, you can set `wait_for_user` to be True if you want the game to pause every tick.
s = Chapter2(process_strategy, wait_for_user=False)
s.run()
```

### Include a section on Beta Testing Notes

#### List any bugs you find. When you list the bugs, try to specify the exact conditions that causes them so I can reproduce them

I did not experience any bugs that were not user created. I had some trouble understanding exactly how the jupyter notebooks worked at first but once I got the restart thing down it was good to go.  
This isn't a bug, but one time I ran the program only with the script for the StellarScript Console in chapter one and it hadn't imported everything because I didn't run all cells so it was a little confusing for a second but once I got the hang of how running the separate cells worked I was good.

#### Was there anything that you and others were consistently confused about? What would you do to solve that confusion?

I wasn't confused about anything.
> This game is for babies! <-- that is a reference if you don't get it don't worry

#### Was there too much narrative? Not enough narrative?

I thought the narrative was just enough. I really enjoyed in chapter two how the narrative could tell the story but also abstract the coding that needed to happen in the solution with the three repair ships talking us through how to send messages.

#### Was it fun? Really, just let me know how I can improve the game

Crazy fun. If I get caught up enough I would like to look more into the libraries and wiring behind the curtain of this game.