# Week Eight: More Network Layer: More Data Plane

## Lab: Protocol Pioneer

### How did you solve Chapter 3? Please copy and paste your winning strategy, and also explain it in English

```python3
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