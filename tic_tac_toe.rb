# frozen_string_literal: true

# Service to play tic-tac-toe game
class Game
  def initialize(player1_name = 'Player1', player2_name = 'Player2')
    @board = Array.new(3) { Array.new(3, ' - ') }
    @result = nil
    @players = [player1_name, player2_name]
    @whose_turn = true
    start_game
  end

  def start_game
    puts "Rules:\n1. Players take turns, the first plays with crosses(x), second plays with noughts(o).
2. To make a move, player should enter 2 numbers: row number and column number separated with a space.
3. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner.\n"
    puts 'LET THE BATTLE BEGIN!'
    # until check_win
    print_board
    puts "#{@whose_turn ? @players[0] : @players[1]}, make your move(#{@whose_turn ? 'x' : 'o'}):"
    move = gets.chomp.split(' ').map(&:to_i)
    make_move(move[0], move[1]) and clear and print_board
    # end
  end

  # def check_win
  #   if all_equal?(@board[0]) || all_equal?(@board[1]) || all_equal?(@board[2]) || all_equal?(@board.transpose[0]) || all_equal?(@board.transpose[1]) || all_equal?(@board.transpose[2]) || all_equal?(@board[0][0], @board[1][1], @board[2][2]) || all_equal?(@board[0][2], @board[1][1], @board[2][0])
  #     @result = "#{}"
  #     elsif
  #   end
  # end

  def make_move(row_number, col_number)
    @board[row_number][col_number] = @whose_turn ? ' x ' : ' o '
  end

  def print_board
    board_to_print = []
    @board.each_with_index { |row, index| board_to_print.push("#{index} " + row.join('|')) }
    puts '   0   1   2'
    puts board_to_print.join("\n  -----------\n")
  end

  def clear
    system 'clear' or system 'cls'
  end

  def all_equal?(*elements)
    elements.all? { |x| x == elements.first }
  end
end

Game.new
