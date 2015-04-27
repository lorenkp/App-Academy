class Tile
  attr_accessor :board, :bombed, :flag, :revealed

  def initialize(board = nil, position)
    @board = board
    @bombed = false
    @flag = false
    @revealed = false
    @position = position
  end

  def reveal
    self.revealed = true
  end

  def neighbors
    neighbors = []
    adjustments = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    adjustments.each do |dx, dy|
      neighbors << [@position[0] + dx, @position[1] + dy]
    end

    neighbors.select { |x, y| x.between?(0, 8) && y.between?(0, 8) }
  end
end
