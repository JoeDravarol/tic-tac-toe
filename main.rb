# Think about how you would set up the different elements within the game… What should 
# be a class? Instance variable? Method? A few minutes of thought can save you from 
# wasting an hour of coding.

# Build your game, taking care to not share information between classes any more than you 
# have to.

# [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [7,5,3]]

# 3. Allow player's to choose cell position via 1-9
# 4. Update your data with the player name or symbol ('X', 'O')
# 5. Loop through the a solution collections to check if anyone has got a line
# 6. If both players didn't get a line then it's a draw
# 7. Ask if the player would like to play again 

# Possible methods - check win condition, update board, deal with player move data
# Possible methods - Update board data, 

class Board
  @@cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize
    update_board
  end

  def update_board(cells = @@cells)
    i = 0
    # Create a 2d Array to display the board
    multi_dimensional_cells = unflatten_array(cells)
    
    while i < multi_dimensional_cells .length
      multi_dimensional_cells [i].each_with_index do |element, index|

        # Element NOT last position?
        if index != multi_dimensional_cells [i].length - 1
          print " #{element} |"
        # Last inner array?
        elsif multi_dimensional_cells [i] == multi_dimensional_cells .last 
          # Last element of inner array?
          if index == multi_dimensional_cells [i].length - 1
            puts " #{element}" 
          end
        else
          puts " #{element}"
          puts "---+---+---"
        end
        
      end
      i += 1
    end
  end

  def unflatten_array(cells)
    cells.each_slice(3).to_a
  end
end

class Game
  attr_accessor :player1, :player2, :board, :cells
  
  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    display_instructions
    @board = Board.new
  end

  def display_instructions
    puts "***************************************"
    puts "*** Welcome To My Tic-Tac-Toe Game! ***"
    puts "***************************************"
    puts "======================================="
    puts "**************** RULES ****************"
    puts "Two players will take turns to mark the"
    puts "spaces on a 3x3 grid. The player who   "
    puts "succeeds in placing 3 of their marks in"
    puts "a horizontal, vertical, or diagonal row"
    puts "wins the game. When there are no more  "
    puts "spaces left to mark, it is consider a  "
    puts "draw. To place a mark on the grid, type"
    puts "the number on the space you would like "
    puts "to mark! As shown below. Good luck! \n "
  end

  def choose_player1_mark
    loop do
      puts "\nWould you like to be 'O' or 'X'?"
      @player1 = gets.chomp.upcase
      
      break if @player1 == 'O' || @player1 == 'X'
    end
  end

  def set_player2_mark
    @player2 = @player1 == 'O' ? 'X' : 'O'
  end

  def display_players_mark
    puts "Player 1 mark is '#{@player1}' and Player 2 mark is '#{@player2}'\n "
  end
end

new_game = Game.new