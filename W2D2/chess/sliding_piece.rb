require_relative 'piece'

class SlidingPiece < Piece
  attr_reader :pos, :color, :grid
  def initialize(color, pos, grid)
    super
  end

  DIAGONAL =
  [[1, 1],
  [-1, -1],
  [ 1, -1],
  [-1, -1]]

  HORIZONTAL = [[-1, 0], [1, 0]]

  def horizontal_vertical_movement(pos)
    potentials = []
    x,y = pos
    HORIZONTAL.each do |dir|
      idx = 1
      completed = true
      while completed
        new_x = x + dir[0] * idx
        if @grid.occupied?([new_x, y])
          completed = false
        elsif new_x.between?(0, 7)
          potentials << [new_x, y]
        else
          completed = false
        end
        idx += 1
      end
    end
    potentials
  end




    # horizontal_vertical_moves = []
    # (0...8).each do |x|
    #   break if x == pos[0] || @board.grid[x][0].color == @color
    #   horizontal_vertical_moves << [x, pos[1]]
    # end
    # (0...8).each do |y|
    #   break if y == pos[1] || @board.grid[0][y].color == @color
    #   horizontal_vertical_moves << [pos[0], y]
    #   horizontal_vertical_moves
    # end
    # horizontal_vertical_moves
  # end
  # create method to determine diagonal moves
  # def diagonal_movement(pos)
  #   moves = []
  #   x, y = pos
  #   DIAGONAL.each do |dirs|
  #     i = 1
  #     completed = true
  #     while completed
  #       new_coord = (dirs[0] * i) + x, (dirs[1] * i) + y
  #       if new_coord[0].between?(0,7) && new_coord[1].between?(0,7)
  #         break
  #       end
  #      if (new_coord[0].between?(0,7) && new_coord[1].between?(0,7))
  #         completed = false
  #       else
  #         p moves << new_coord
  #       end
  #       i += 1
  #     end
  #   end
  # end



  # DIAGONAL.each do |dir|
  #   idx = 1
  #   while true
  #     x, y = (pos[0] + (dir[0] * idx)), (pos[1] + (dir[1] * idx))
  #     break unless board.occupied?(pos) || (x.between?(0, 7) && y.between?(0, 7))
  #     moves << [x, y]
  #     idx += 1
  #   end
  # end
  # moves
  # end

  def moves
    case move_dirs
    when :horizontal_vertical
      horizontal_vertical_movement([0,0])
    when :diagonal_movement
      diagonal_movement(self.pos)
    when :all_directions
      horizontal_vertical_movement(self.pos) + diagonal_movement(self.pos)
    end
  end
end

class Rook < SlidingPiece
  def move_dirs
    :horizontal_vertical
  end

  def symbol
    if @color == :black
      '♜'
    else
      '♖'
    end
  end
  #def symbol
  # set up symbol, which is why we have color variable

end

class Queen < SlidingPiece
  def move_dirs
    :all_directions
  end

  def symbol
    if (@color == :black)
      '♛'
    else
      '♕'
    end
  end
end

class Bishop < SlidingPiece
  def move_dirs
    :diagonal_movement
  end

  def symbol
    if (@color == :black)
      '♝'
    else
      '♗'
    end
  end
end



if __FILE__ == $PROGRAM_FILE


end
