G = input('Enter G: ')
r = len(G)-1
G = int(G, 2)
D = input('Enter D: ')
D = int(D, 2)
R = (D*(2**r))%G
R = bin(R)
print(f"R is: {R[2:]:0>{r}}") #This line was written by ChatGPT


