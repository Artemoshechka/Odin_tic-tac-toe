# frozen_string_literal: true

# Module to print out messages
module Print
  # Printing out game intro
  def print_intro
    puts <<~HEREDOC
      Rules:
      1. Players take turns, the first plays with crosses(x), second plays with noughts(o).
      2. To make a move, player should enter 2 numbers: row number and column number separated with a space.
      3. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner.

      LET THE BATTLE BEGIN!

    HEREDOC
  end

  # Printing out game board
  def print_board(board)
    board_to_print = []
    board.each_with_index { |row, index| board_to_print.push("#{index} " + row.join('|')) }
    puts '   0   1   2'
    puts board_to_print.join("\n  -----------\n")
  end

  # Printing out which players turn is now
  def print_players_turn(turn, players_list)
    puts "#{turn ? players_list[0] : players_list[1]}, make your move(#{turn ? 'x' : 'o'}):"
  end

  # def print_game_result(result)
  #   puts result
  # end

  # Printing out warn message if input is invalid
  def incorrect_input
    warn 'Wrong input(you should enter 2 numbers: row number and column number separated with a space.). Try again.'
  end

  def wrong_move
    warn "You can't make that move, because that square is already taken. Try again."
  end

  # Clearing out terminal
  def clear
    system 'clear' or system 'cls'
  end
end
