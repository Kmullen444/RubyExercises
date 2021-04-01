class Player
  attr_accessor :name, :marker

  def initialize
    @name
    @marker
  end

  def player_name
    puts "Please enter your name"
    @name = gets.chomp.capitalize
    puts "Welcome #{name}!"
  end

  def player_marker
    puts "Please choose X or O"
    marker = gets.chomp.upcase
    case marker
    when "X"
      puts "#{name}, chose #{marker}!"
    when "O"
      puts "#{name}, chose #{marker}!"
    else
      until marker == "X" or marker == "O"
        puts "Thats not a choice! Please choose between X and O"
        marker = gets.chomp.upcase
      end
      puts "#{name}, You chose #{marker}!"
    end
  end
end

class Board
  @board = [" ", " "," "," "," "," "," "," "," "]

  def initialize
    @board
  end

  def self.display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "---------"
    puts "#{@board[7]} | #{@board[8]} | #{@board[9]}"
  end
end

class Game
  
