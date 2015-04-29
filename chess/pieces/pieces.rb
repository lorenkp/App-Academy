# require_relative './board.rb'
# require_relative 'sliding_pieces'
# require_relative 'stepping_pieces'
class Pieces
  attr_reader :pos, :board

  def initialize(color, pos, board)
    @moved, @color,@pos, @board = false, color, pos, board
  end

  def symbol

  end

  def moves
    # returns array of possible moves based on object being called, IE queen
  end

  def valid_moves
    #considers board#occupied? etc also, ask color, so it doesn't take own piece
  end
end

class Pawn < Pieces
  def initialize(color, pos, board)
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
      position[0].between?(0, 7) && position[1].between?(0, 7) &&  # is it overflowing the board?
      (x - position[0]).abs < 2 && (y - position[1]).abs < 2 &&
      (x - position[0]).abs + (y - position[1]).abs == 1  # but must move 3 steps
      # @board.occupied?(@pos).color != color
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
