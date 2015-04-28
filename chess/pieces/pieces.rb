require_relative './board.rb'

class Pieces
  attr_reader :pos, :board

  def initialize(color, pos, board)
    @moved, @color,@pos, @board = false, color, pos, board
  end

  def symbol
    raise NotImplementedError.new
  end

  def moves
    # returns array of possible moves based on object being called, IE queen
  end

  def valid_moves
    #considers board#occupied? etc also, ask color, so it doesn't take own piece
  end
end
