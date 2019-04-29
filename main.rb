# Think about how you would set up the different elements within the game… What should 
# be a class? Instance variable? Method? A few minutes of thought can save you from 
# wasting an hour of coding.

# Build your game, taking care to not share information between classes any more than you 
# have to.

# [[1,2,3], [4,5,6], [7,8,9]]
# [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [7,5,3]]
# row = | 
# col = --+---+--

# 1. Display instuctions
# 2. Ask player if they would like to choose to be 'X' or 'O'
# 3. Allow player's to choose cell position via 1-9
# 4. Update your data with the player name or symbol ('X', 'O')
# 5. Loop through the a solution collections to check if anyone has got a line
# 6. If both players didn't get a line then it's a draw
# 7. Ask if the player would like to play again 

# Possible Class - Board, Game, Players, Player1 < Players, Player2 < Players
# Possible methods - check win condition, update board, deal with player move data
# Possible methods - Choosing input type ('X', 'O'), Update board data, 