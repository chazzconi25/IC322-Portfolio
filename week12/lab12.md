# Week Twelve: Link Layer

## Lab: Protocol Pioneer

### Include your client and server strategy code

```python
period = 80
# 64 = 0.14
# 80 = 0.16
def server_strategy(self):
    
    self.set_display(f"Queued:{len(self.from_layer_3())}")

    # Handle messages received from our interfaces, destined for layer 3 
    while(self.message_queue):
            m = self.message_queue.pop()
            print(f"--- Server {self.id}: Msg on interface {m.interface}: Tick {self.world.get_current_tick()} ---\n{m.text}\n------------------")
            
            # If this message belongs to us, send it to layer 3
            if parse_message(m.text).get("Destination") == self.id:
                self.to_layer_3(m.text)
            elif parse_message(m.text).get("Destination") == self.id:
                 self.to_layer_3(m.text)



    # Handle messages from layer 3, destined for the interfaces
    # Each entity has a single interface in this scenario. Figure out what the interface is.
    connected_interfaces = self.connected_interfaces() # This should return a list of exactly one value.
    selected_interface = connected_interfaces[0] 
    if not self.interface_sending(selected_interface):
        if len(self.from_layer_3()) > 0 and self.id == "3" and self.current_tick() % period < period * 0.75 and self.current_tick() % period >= period * 0.5:
            msg_text = self.from_layer_3().pop()
            print(f"{self.id}: Attempting send.")
            self.send_message(msg_text, selected_interface)
        elif len(self.from_layer_3()) > 0 and self.id == "4" and self.current_tick() % period < period * 0.5 and self.current_tick() % period >= period * 0.25:
            msg_text = self.from_layer_3().pop()
            print(f"{self.id}: Attempting send.")
            self.send_message(msg_text, selected_interface)

 

def client_strategy(self):
    self.set_display(f"Queued:{len(self.from_layer_3())}")

    # Handle messages received from our interfaces, destined for layer 3 
    while(self.message_queue):
            m = self.message_queue.pop()
            print(f"--- Client {self.id}: Msg on interface {m.interface}: Tick {self.world.get_current_tick()} ---\n{m.text}\n------------------")
            
            # If this message belongs to us, send it to layer 3
            if parse_message(m.text).get("Destination") == self.id:
                self.to_layer_3(m.text)
                
            elif parse_message(m.text).get("Destination") == self.id:
                 self.to_layer_3(m.text)


    # Handle messages from layer 3, destined for the interfaces
    # Each entity has a single interface in this scenario. Figure out what the interface is.
    connected_interfaces = self.connected_interfaces() # This should return a list of exactly one value.
    selected_interface = connected_interfaces[0] 
    if not self.interface_sending(selected_interface):
        if len(self.from_layer_3()) > 0 and self.id == "1" and self.current_tick() % period < period * 0.25:
            msg_text = self.from_layer_3().pop()
            print(f"{self.id}: Attempting send.")
            self.send_message(msg_text, selected_interface)
        elif len(self.from_layer_3()) > 0 and self.id == "2" and self.current_tick() % period >= period * 0.75:
            msg_text = self.from_layer_3().pop()
            print(f"{self.id}: Attempting send.")
            self.send_message(msg_text, selected_interface)
```

### Explain your strategies in English

Basically the idea was to implement segmented ALOHA. I didn't know I was doing this at the time but I do know so I am basically a genius.

Each of the servers and clients were assigned a segment of a larger period of time in which they were permitted to broadcast. The period was set by one variable so I could adjust it to figure out what time worked best. I found that the best time was 80 ticks for a period (20 ticks send time for a segment).

### What was your maximum steady-state success rate (after 300 or so ticks?)

About 0.16!

### Evaluate your strategy. Is it good? Why or why not?

I liked this strategey becasue it was easy to implment and it beat my roommates send rate. I am not sure if you can get much better than this because I thought about doing things like polling or attaching headers to messages but all of that seemed like it would only have other drawbacks. In the end I think my strategy is best because its easy to implement and if you tried somthing harder you would only get the same result for more work.

### Are there any strategies you's like to implement, but you don't know how?

I wish I could implment the headers strategy. Essentially what you would do is have each node send their usual data but head it with a message letting everyone else know when they'll be done transmitting. This way you optimize the reserved sending time each node has because as soon as the time they sent is up another node can start.

### Any other comments?

It would be cool if there was some way to reduce the initial learning curve for ProtoPie labs. I feel like I use a lot of time just getting up to speed before I even get into implmenting solutions and end up settling on the first thing that works because set up took so long. Then again I do enjoy the challenge of trying to understand some code and work with it.
