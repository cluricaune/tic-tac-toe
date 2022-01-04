module SingleSpace
  def mark(index, input)
    if input == 'X'
      spaces[index] = 'X'
    elsif input == 'O'
      spaces[index] = 'O'
    end
  end
end

module CheckForWin
  def horizontal_win
    if spaces[0..2].all?('X') || spaces[3..5].all?('X') || spaces[6..8].all?('X')
      true
    else
      false
    end
  end

  def vertical_win
    column1 = spaces.values_at(0, 3, 6)
    column2 = spaces.values_at(1, 4, 7)
    column3 = spaces.values_at(2, 5, 8)
    if column1.all?('X') || column2.all?('X') || column3.all?('X')
      true
    else
      false
    end
  end

  def diagonal_win
    diagonal1 = spaces.values_at(0, 4, 8)
    diagonal2 = spaces.values_at(6, 4, 2)
    if diagonal1.all?('X') || diagonal2.all?('X')
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
  end

  def self.display_player_count
    @@player_count
  end
end

class TicTacToe < Player
  include CheckForWin
  include SingleSpace

  attr_accessor :spaces

  def initialize
    @spaces = Array.new(9, false)
  end
end

player1 = Player.new('Jake')
player2 = Player.new('Chad')

puts Player.display_player_count
puts player1.xo
