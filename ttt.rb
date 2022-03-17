module CheckForWin
  def horizontal_win_x
    if spaces[0..2].all?('X') ||
       spaces[3..5].all?('X') ||
       spaces[6..8].all?('X')
      true
    else
      false
    end
  end

  def vertical_win_x
    column1 = spaces.values_at(0, 3, 6)
    column2 = spaces.values_at(1, 4, 7)
    column3 = spaces.values_at(2, 5, 8)
    if column1.all?('X') ||
       column2.all?('X') ||
       column3.all?('X')
      true
    else
      false
    end
  end

  def diagonal_win_x
    diagonal1 = spaces.values_at(0, 4, 8)
    diagonal2 = spaces.values_at(6, 4, 2)
    if diagonal1.all?('X') ||
       diagonal2.all?('X')
      true
    else
      false
    end
  end

  def game_win_x
    if horizontal_win_x || vertical_win_x || diagonal_win_x
      true
    else
      false
    end
  end

  def horizontal_win_o
    if spaces[0..2].all?('O') ||
       spaces[3..5].all?('O') ||
       spaces[6..8].all?('O')
      true
    else
      false
    end
  end

  def vertical_win_o
    column1 = spaces.values_at(0, 3, 6)
    column2 = spaces.values_at(1, 4, 7)
    column3 = spaces.values_at(2, 5, 8)
    if column1.all?('O') ||
       column2.all?('O') ||
       column3.all?('O')
      true
    else
      false
    end
  end

  def diagonal_win_o
    diagonal1 = spaces.values_at(0, 4, 8)
    diagonal2 = spaces.values_at(6, 4, 2)
    if diagonal1.all?('O') ||
       diagonal2.all?('O')
      true
    else
      false
    end
  end

  def game_win_o
    if horizontal_win_o || vertical_win_o || diagonal_win_o
      true
    else
      false
    end
  end

  def game_win_all
    if game_win_x || game_win_o
      true
    else
      false
    end
  end
end

class Player
  attr_reader :name, :xo

  @@player_count = 0

  def initialize(name)
    @name = name
    @xo = if @@player_count > 0
            'O'
          else
            'X'
          end
    @@player_count += 1
  end

  def self.display_player_count
    @@player_count
  end
end

class TicTacToe < Player
  include CheckForWin
  attr_accessor :spaces, :player1, :player2

  def initialize
    puts "\nThis is Tic-Tac-Toe!\n\nCreated by Jake Dunn\n\nThe spaces are numbered 1-9 starting from top left.\n"
    @spaces = Array.new(9, ' ')
    puts "\nPlayer 1, please enter your name:"
    @player1 = Player.new(gets.chomp)
    puts "\nPlayer 2, enter your name as well:"
    @player2 = Player.new(gets.chomp)
  end

  def print_board(xo1, xo2, xo3, xo4, xo5, xo6, xo7, xo8, xo9)
    puts "\n\n   |   |   \n #{xo1} | #{xo2} | #{xo3} \n___|___|___\n   |   |   \n #{xo4} | #{xo5} | #{xo6} \n___|___|___\n   |   |   \n #{xo7} | #{xo8} | #{xo9} \n   |   |   "
  end
end

game = TicTacToe.new

puts "\nOk, let\'s get started!"
puts game.print_board('1', '2', '3', '4', '5', '6', '7', '8', '9')

current_player = game.player1
until game.game_win_all
  if current_player == game.player1
    puts "\nPlayer 1 mark a spot:"
    input = gets.chomp.to_i - 1
    while input > 8
      puts "\nThat's not a space, try again"
      input = gets.chomp.to_i - 1
    end
    game.spaces[input] = game.player1.xo
    puts game.print_board(game.spaces[0], game.spaces[1], game.spaces[2], game.spaces[3], game.spaces[4], game.spaces[5],
                          game.spaces[6], game.spaces[7], game.spaces[8])
    current_player = game.player2
  elsif current_player == game.player2
    puts "\nPlayer 2 mark a spot:"
    input = gets.chomp.to_i - 1
    while input > 8
      puts "\nThat's not a space, try again"
      input = gets.chomp.to_i - 1
    end
    game.spaces[input] = game.player2.xo
    puts game.print_board(game.spaces[0], game.spaces[1], game.spaces[2], game.spaces[3], game.spaces[4], game.spaces[5],
                          game.spaces[6], game.spaces[7], game.spaces[8])
    current_player = game.player1
  end
end

if current_player = game.player2
  puts "#{game.player1.name} wins!"
else
  puts "#{game.player2.name} wins!"
end
