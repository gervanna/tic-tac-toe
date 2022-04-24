class TicTacToe

  def initialize()
    @board = Array.new(9, " ")
    
  end 

  WIN_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ]

  def show_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "———————————"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "———————————"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 

  def get_input(user_input)
    user_input.to_i-1
  end

  def make_move(index, symbol)
    @board[index] = symbol 
  end 

  def square_taken?(index)
    if @board[index] == " " || @board[index] == nil
      return false
    else 
      return true
    end 
  end
  
  def valid_play?(index)
    if index.between?(0,8) && !square_taken?(index)
      return true
    end 
  end

  def count_turns
    @board.count{|square| square != " "}
  end

  def current_player
    count_turns.even? ? "X": "O"
  end 

  def player_msg
    if current_player == "X"
      puts "\nPlayer 1 enter a number between 1 - 9: "
    elsif current_player == "O" 
      puts "\nPlayer 2 enter a number between 1 - 9: "
    end
  end

  def turn
    puts "#{player_msg}"
    index = get_input(gets.chomp)
    if valid_play?(index)
      make_move(index, current_player)
      show_board
    else 
      turn
    end 
  end

  def game_won?
    WIN_COMBOS.any? do |combo|
      if square_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end 

  def board_full?
    @board.all?{|square| square != " "}
  end 

  def game_draw?
    board_full? && !game_won?
  end

  def game_over?
    game_won? || board_full? || game_draw?
  end 

  def winner
    if winning_combo = game_won?
      return @board[winning_combo[0]]
    end
  end 

  def game_play
    turn until game_over?
      if winner == "X"
        puts "\nCongrats Player 1. You won!"
      elsif winner == "O"
        puts "\nCongrats Player 2. You won!"
      else 
        puts "\nIt's a draw."
      end
  end
end
  

puts "Welcome to Tic Tac Toe. 
Player 1 is X. Player 2 is O."
game = TicTacToe.new
game.game_play
