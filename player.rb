# frozen_string_literal: true

# Player class
class Player
  attr_reader :name

  # I know it's not good to use class variables, but currently I'm not familiar with any other construction which will
  # count number of class instances
  @@players_counter = 1

  def initialize
    puts "Enter player number #{@@players_counter} name(default name will be 'Player#{@@players_counter}')"
    name = gets.chomp
    @name = name == '' ? "Player#{@@players_counter}" : name
    @@players_counter += 1
  end
end
