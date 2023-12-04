# Week Eight: More Network Layer: More Data Plane

## Lab: Protocol Pioneer

### How did you solve Chapter 3? Please copy and paste your winning strategy, and also explain it in English

```python
# Welcome to the StellarScript Console!
#
# This time your single strategy will be run by all 6 drones instead of being
# run by your ship. Your ship will be emitting messages that the drones need to follow.
#
# In this scenario, you will need to parse the messages. Python makes this pretty easy
# with the split() function.
#
# For example:
# msg = "Key1:Value1\nKey2:Value2\nKey3:Value3"
# splitted msg.split("\n") # splits the string on newlines
#
# Now splitted is a list of strings:
# ["Key1:Value1", "Key2:Value2", "Key3:Value3"]
#
# And you can access these list elements like a typical list:
# splitted[0] == "Key1:Value1"

def process_strategy(self):
    
    while(self.message_queue):
        m = self.message_queue.pop()
        # You can use the `self.id` value to create different logic for different drones.
        print(f"--- Drone {self.id}: Msg on interface {m.interface} ---\n{m.text}\n------------------")
        mlib = m.text.split("\n")
        
        dict = {}
        for string in mlib:
            split = string.split(":")
            dict[split[0]] = split[1]
            
        if int(dict["Dest"]) == int(self.id):
            if dict["Command"] == "start_emit":
                self.start_emit(dict["Value"])
            elif dict["Command"] == "focus":
                self.focus(dict["Value"])
            else:
                self.return_results(dict["Value"])
        else:
            if int(self.id) == 1 and (dict["Dest"] == "3" or dict["Dest"] == "4" or dict["Dest"] == "6"):
                self.send_message(m.text,"N")
            elif int(self.id) == 1:
                self.send_message(m.text,"E")
            elif int(self.id) == 3:
                self.send_message(m.text,"E")
            elif int(self.id) == 4:
                self.send_message(m.text,"N")
            elif int(self.id) == 2:
                self.send_message(m.text,"S")
            else:
                print(self.id)
   
    # These drones have 3 special functions:
    # self.start_emit(value)
    # self.focus(value)
    # self.return_results(value)
    # You don't have to know much about these functions, except that your ship is emitting messages asking
    # specific drones to call specific functions using specific values. In this scenario
    # you can't control the messages being sent by your ship. You can only program the drones.

# Remember, you can set `wait_for_user` to be True if you want the game to pause every tick.
s = Chapter3(process_strategy, wait_for_user=False)
s.run()
```

### How did you solve Chapter 4? Please copy and paste your winning strategy, and also explain it in English

```python3
table31 = {
    "1.1" : "W",
    "1.2" : "S",
    "1.3" : "S",
    "2.1" : "E",
    "2.2" : "E",
    "3.2" : "S",
    "3.3" : "S",
    "3.4" : "S",
    "3.5" : "E",
    "3.6" : "E",
    "3.7" : "E"
}

table32 = dict(table31)
table32.pop("3.2")
table32["3.1"] = "N"
table32["1.1"] = "N"
table32["1.2"] = "W"

table33 = dict(table32)
table33.pop("3.3")
table33["3.2"] = "N"
table33["1.2"] = "N"

table34 = {
    "1.1" : "N",
    "1.2" : "N",
    "1.3" : "W",
    "2.1" : "N",
    "2.2" : "N",
    "3.2" : "N",
    "3.3" : "N",
    "3.4" : "N",
    "3.5" : "N",
    "3.6" : "N",
    "3.7" : "N"
}

table35 = dict(table34)
table35.pop("3.5")
table35["1.1"] = "W"
table35["1.2"] = "W"
table35["1.3"] = "W"
table35["3.3"] = "W"
table35["3.4"] = "W"
table35["2.2"] = "S"

table36 = dict(table35)
table36.pop("3.6")
table36["3.2"] = "W"
table36["3.5"] = "S"

table37 = dict(table36)
table37.pop("3.7")
table37["3.1"] = "W"
table37["3.6"] = "S"

table21 = {
    "1.1" : "S",
    "1.2" : "S",
    "1.2" : "S",
    "2.2" : "S",
    "3.1" : "S",
    "3.2" : "S",
    "3.3" : "S",
    "3.4" : "S",
    "3.5" : "S",
    "3.6" : "S",
    "3.7" : "S"
}

table22 = dict(table34)
table22.pop("2.2")
table22["1.1"] = "N"
table22["1.2"] = "N"
table22["1.3"] = "N"
table22["3.4"] = "N"

tableLookup = {
    "3.1" : table31,
    "3.2" : table32,
    "3.3" : table33,
    "3.4" : table34,
    "3.5" : table35,
    "3.6" : table36,
    "3.7" : table37,
    "2.1" : table21,
    "2.2" : table22,
}


def drone_strategy(self):
    """Drones are responsible for routing messages."""
    while(self.message_queue):
        m = self.message_queue.pop()
        print(f"--- Drone {self.id}: Msg on interface {m.interface} ---\n{m.text}\n------------------")
        dict = parse_message(m)
        self.send_message(m.text,tableLookup[self.id][dict["Dest"]])
        
def scanner_strategy(self):
    """Scanners are responsible for receiving messages, parsing them, taking
    action, and responding with results."""
    while(self.message_queue):
        m = self.message_queue.pop()
        print(f"--- Scanner {self.id}: Msg on interface {m.interface} ---\n{m.text}\n------------------")
        dict = parse_message(m)
        retVal = self.boot(dict["Value"])
        self.send_message(build_message(self.id, dict["Source"], "Result", retVal), tableLookup[self.id][dict["Source"]])

def build_message(source, dest, command, value):
     return "Source:" + str(source) + "\n" + "Dest:" + str(dest) + "\n" +  "Command:" + str(command) + "\n" + "Value:" + str(value)

def parse_message(m):
        mlib = m.text.split("\n")
        dict = {}
        for string in mlib:
            split = string.split(":")
            #print(split)
            dict[split[0]] = split[1]
        return dict

# Set animation_frames to a lower number to speed up the simulation.
s = Chapter4(drone_strategy, scanner_strategy, animation_frames=10, wait_for_user=False)
s.run()
```

### Include a section on Beta Testing Notes

#### List any bugs you find. When you list the bugs, try to specify the exact conditions that causes them so I can reproduce them

No bugs found.

#### Was there anything that you and others were consistently confused about? What would you do to solve that confusion?

I wasn't confused about anything. I feel like I just need to get dictionaries down a bit more.

#### Was there too much narrative? Not enough narrative?

I thought the narrative was just enough. I am losing track of the plot however.

#### Was it fun? Really, just let me know how I can improve the game

Very fun. Maybe improve by breaking problems down a little bit. Overall very good and perfect time commitment.
