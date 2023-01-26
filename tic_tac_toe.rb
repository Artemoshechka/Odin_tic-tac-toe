# frozen_string_literal: true

# Service to play tic-tac-toe game
class Game
  def initialize(player1_name = 'Player1', player2_name = 'Player2')
    @board = Array.new(3) { Array.new(3, ' - ') }
    @result = nil
    @players = [player1_name, player2_name]
    @whose_turn = true
    clear
    start_game
  end

  def start_game
    print_intro
    print_board
    while @result.nil?
      puts "#{@whose_turn ? @players[0] : @players[1]}, make your move(#{@whose_turn ? 'x' : 'o'}):"
      make_move and clear and print_board and status_check
      @whose_turn = !@whose_turn
    end
    puts @result
  end

  def status_check
    if all_equal?(@board[0]) || all_equal?(@board[1]) || all_equal?(@board[2]) || all_equal?(@board.transpose[0]) || all_equal?(@board.transpose[1]) || all_equal?(@board.transpose[2]) || all_equal?(@board[0][0], @board[1][1], @board[2][2]) || all_equal?(@board[0][2], @board[1][1], @board[2][0])
      @result = "#{@whose_turn ? @players[0] : @players[1]} just won the game!"
    elsif @board.flatten.include?(' x ') && @board.flatten.include?(' o ') && !@board.flatten.include?(' - ')
      @result = "It's a draw!"
    end
  end

  def make_move
    loop do
      move = gets.chomp
      if move.match?(/[0-2] [0-2]/)
        move = move.split(' ').map(&:to_i)
        if @board[move[0]][move[1]] == ' - '
          @board[move[0]][move[1]] = @whose_turn ? ' x ' : ' o '
          return
        else
          warn "You can't make that move, because that square is already taken. Try again."
          next
        end
      else
        warn 'Wrong input(you should enter 2 numbers: row number and column number separated with a space.). Try again.'
        next
      end
    end
  end

  def print_intro
    puts "Rules:\n1. Players take turns, the first plays with crosses(x), second plays with noughts(o)."
    puts '2. To make a move, player should enter 2 numbers: row number and column number separated with a space.'
    puts '3. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner.'
    puts 'LET THE BATTLE BEGIN!'
  end

  def print_board
    board_to_print = []
    @board.each_with_index { |row, index| board_to_print.push("#{index} " + row.join('|')) }
    puts '   0   1   2'
    puts board_to_print.join("\n  -----------\n")
  end

  def all_equal?(*elements)
    elements.flatten.all? { |x| x == elements.first } && !elements.include?(' - ')
  end

  def clear
    system 'clear' or system 'cls'
  end
end

Game.new
