# frozen_string_literal: true

require_relative 'print'
require_relative 'player'

# Service to play tic-tac-toe game
class Game
  include Print

  def initialize(player1, player2)
    @board = Array.new(3) { Array.new(3, ' - ') }
    @result = nil
    @players = [player1.name, player2.name]
    @whose_turn = true
    clear
    start_game
  end

  # Game start method
  def start_game
    print_intro
    print_board(@board)
    while @result.nil?
      print_players_turn(@whose_turn, @players)
      make_move
      clear
      print_board(@board)
      status_check
      @whose_turn = !@whose_turn
    end
    puts @result
  end

  # Method to check game status (still going, draw or win)
  # I really don't like the way I wrote it, but I couldn't think of a better way to check all of possible winning
  # combinations. Possible upgrade: create an array of arrays which includes pairs of numbers(row number and column
  # number) and check each array of pairs for a win.
  def status_check
    if all_equal?(@board[0]) || all_equal?(@board[1]) || all_equal?(@board[2]) || all_equal?(@board.transpose[0]) || all_equal?(@board.transpose[1]) || all_equal?(@board.transpose[2]) || all_equal?(@board[0][0], @board[1][1], @board[2][2]) || all_equal?(@board[0][2], @board[1][1], @board[2][0])
      @result = "#{@whose_turn ? @players[0] : @players[1]} just won the game!"
    elsif @board.flatten.include?(' x ') && @board.flatten.include?(' o ') && !@board.flatten.include?(' - ')
      @result = "It's a draw!"
    end
  end

  # Method to make a move, also checks for a validity of input
  # This one is also can be written way better, but I'll think about the way to upgrade it later
  def make_move
    loop do
      move = gets.chomp
      if move.match?(/[0-2] [0-2]/)
        move = move.split(' ').map(&:to_i)
        if @board[move[0]][move[1]] == ' - '
          @board[move[0]][move[1]] = @whose_turn ? ' x ' : ' o '
          return
        else
          wrong_move
        end
      else
        incorrect_input
      end
    end
  end

  # Additional method to check equality of elements
  def all_equal?(*elements)
    elements.flatten.all? { |x| x == elements.first } && !elements.include?(' - ')
  end
end

Game.new(Player.new, Player.new)
