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

class TicTacToe
  include CheckForWin
  include SingleSpace
  
  attr_accessor :spaces

  def initialize
    @spaces = Array.new(9, false)
  end
end

game = TicTacToe.new

game.mark(1, 'X')
game.mark(3, 'X')
game.mark(6, 'X')

puts game.vertical_win

puts game.spaces
