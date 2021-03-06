class Board
  @@cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize
    update_board
  end

  def update_board(cells = @@cells)
    i = 0
    # Create a 2d Array to display the board
    nested_cells = unflatten_array(cells)
    
    while i < nested_cells.length
      nested_cells[i].each_with_index do |element, index|

        # Element NOT last position?
        if index != nested_cells[i].length - 1
          print " #{element} |"
        # Last inner array?
        elsif nested_cells[i] == nested_cells.last 
          # Last element of inner array?
          if index == nested_cells[i].length - 1
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
  attr_accessor :player1, :player2, :current_player, :board, :cells, :mark, :winning_variant
  
  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winning_variant = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 4, 7, 2, 5, 8, 3, 6, 9, 1, 5, 9, 7, 5, 3]
    display_instructions
    @board = Board.new
    play_game
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

  def get_player_mark
    player = @current_player == @player1 ? "Player 1" : "Player 2"
 
    loop do
      puts "Where would you like to put your mark #{player}?"
      @mark = gets.chomp.to_i
      break if @cells.include?(@mark)
    end
  end

  def update_cells_data
    index = @cells.index(@mark)
    @cells[index] = @current_player
  end

  def display_board
    @board.update_board(@cells)
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play_game
    choose_player1_mark
    set_player2_mark
    display_players_mark
    @current_player = @player1
    display_board

    until game_ended?
      get_player_mark
      update_cells_data
      update_win_variant_data
      display_board
      switch_player
    end
    
    play_again?
  end

  def game_ended?
    player_won? || draw?
  end

  def draw?
    draw = false
    # All the data has been overwritten by player's mark?
    if @cells.all? { |cell| !cell.is_a? Integer }
      puts "It's a draw!"
      draw = true
    end
    draw 
  end

  def player_won?
    # Create a 2d array for checking winner
    nested_winning_variant = @winning_variant.each_slice(3).to_a
    player_won = false

    nested_winning_variant.each_index do |index|
      if nested_winning_variant[index].all? { |mark| mark == @player1 }
        puts "Player 1 Wins!"
        player_won = true
      elsif nested_winning_variant[index].all? { |mark| mark == @player2 }
        puts "Player 2 Wins!"
        player_won = true
      end
    end

    player_won
  end

  def update_win_variant_data
    # Overwritten all elements with player's move to
    # player's mark
    @winning_variant.each_with_index do |el, index|
      if el == @mark
        @winning_variant[index] = @current_player
      end
    end
  end

  def play_again?
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winning_variant = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 4, 7, 2, 5, 8, 3, 6, 9, 1, 5, 9, 7, 5, 3]
    input = nil

    loop do
      puts "Would you like to Play again? Y/N?"
      input = gets.chomp.upcase

      break if input == "Y" || input == "N"
    end

    if input == "Y"
      play_game
    else
      puts "Thanks for playing!"
    end
  end
end

new_game = Game.new