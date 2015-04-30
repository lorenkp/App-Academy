# require_relative './grid.rb'
# require_relative 'sliding_pieces'
# require_relative 'stepping_pieces'
class Piece
  attr_reader :pos, :grid

  def initialize(color, pos, grid)
    @moved, @color,@pos, @grid = false, color, pos, grid
  end

  def symbol
    if self == nil
      print " "
    end
  end

  def moves
    # returns array of possible moves based on object being called, IE queen
  end

  def valid_moves
    #considers grid#occupied? etc also, ask color, so it doesn't take own piece
    moves.reject { |move| move_into_check? }
  end

  def move_into_check?

  end

  def inspect
    "#{@color} #{self.class}"
  end
end

class Pawn < Piece
  attr_reader :color, :pos

  def initialize(color, pos, grid)
    super
  end

  def moves
    x, y = pos
    possible_moves = [[x, y + 2], [x, y + 1], [x + 1, y + 1],
    [x - 1, y + 1]]
    select_valids(possible_moves, x, y)
  end

  def select_valids(potential_pos, x, y)
    potential_pos.select do |position|
      position[0].between?(0, 7) && position[1].between?(0, 7) &&  # is it overflowing the grid?
      (x - position[0]).abs < 2 && (y - position[1]).abs < 2 &&
      (x - position[0]).abs + (y - position[1]).abs == 1  # but must move 3 steps
      # @grid.occupied?(@pos).color != color
    end
  end

  def symbol
    if (@color == :black)
      '♟'
    else
      '♙'
    end
  end

end
