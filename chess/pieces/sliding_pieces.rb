require_relative 'pieces.rb'

class SlidingPieces < Pieces
  attr_reader :pos, :color
  def initialize(color, pos, board)
    super
  end


  DIAGONAL =
  [[1, 1],
  [-1, -1],
  [ 1, -1],
  [-1, -1]]

  def horizontal_vertical_movement(pos)
    horizontal_vertical_moves = []
    (0..8).each { |x| horizontal_vertical_moves <<
                  [x, pos[1]] break if x == pos[0] ||
                  (board.occupied?([x, pos[1]]).color == @color }
    (0..8).each { |y| horizontal_vertical_moves <<
                  [pos[0], y] break if y == pos[1] ||
                  (board.occupied?([pos[0], y]).color == @color }
    horizontal_vertical_moves
  end

  # create method to determine diagonal moves
  def diagonal_movement(pos)
    moves = []
    DIAGONAL.each do |dir|
      idx = 1
      while true
        x, y = (pos[0] + (dir[0] * idx)), (pos[1] + (dir[1] * idx))
        break unless board.occupied?(pos) || (x.between?(0, 7) && y.between?(0, 7))
        moves << [x, y]
        idx += 1
      end
    end
    moves
  end

  def moves
    case move_dirs
    when :horizontal_vertical
      horizontal_vertical_movement(self.pos)
    when :diagonal_movement
      diagonal_movement(self.pos)
    when :all_directions
      horizontal_vertical_movement + diagonal_movement(self.pos)
    end
  end
end




class Rook < SlidingPieces
  def move_dirs
    :horizontal_vertical
  end

  def symbol
    @color == :black ? puts ♜ : puts ♖
  end

  #def symbol
  # set up symbol, which is why we have color variable

end

class Queen < SlidingPieces
  def move_dirs
    :all_directions
  end

  def symbol
    @color == :black ? puts ♛ : puts ♕

end

class Bishop < SlidingPieces
  def move_dirs
    :diagonal_movement
  end

  def symbol
    @color == :black ? puts ♝ : puts ♗
  end

end
