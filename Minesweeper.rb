class Tile
  attr_accessor :board, :bombed, :flag, :revealed, :public_display

  def initialize(position)
    @board = board
    @bombed = false
    @flag = false
    @revealed = false
    @position = position
    @public_display = "*"
  end

  def reveal
    self.revealed = true
    @public_display = (neighbor_bomb_count > 0 ? neighbor_bomb_count.to_s : "_")
  end

  def bombed?
    @bombed
  end

  def flag
    @flag = true
    @public_display = "F"
  end


  def neighbors
    neighbors = []
    adjustments = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    adjustments.each do |dx, dy|
      neighbors << [@position[0] + dx, @position[1] + dy]
    end

    neighbors.select { |x, y| x.between?(0, 8) && y.between?(0, 8) }
  end

  def neighbor_bomb_count
    bomb_count = 0
    neighbors.each do |pos|
      bomb_count += 1 if @board.get_tile(pos).bombed?
    end
    bomb_count
  end

end

class Board
  attr_reader :grid_size, :bomb_num, :grid

  def initialize
    @grid_size = 9
    @bomb_num = 10
    @grid = Array.new(@grid_size) { Array.new(@grid_size) }
  end

  def get_tile(pos)
    row, col = pos
    @grid[row][col]
  end

  def make_grid
    @grid_size.times do |row|
      p row
      p @grid
      @grid_size.times do |col|
        @grid[row][col] = Tile.new([row, col])
      end
    end

    bombs_left = @bomb_num
    while bombs_left > 0
      row = (0..8).to_a.sample
      col = (0..8).to_a.sample
      unless @grid[row][col].bombed
        @grid[row][col].bombed = true
        bombs_left -= 1
      end
    end

    @grid.each do |row|
      row.each do |tile|
        tile.board = self
      end
    end
  end

  def display
    @grid.each do |row|
      p row.map(&:public_display)
    end

    nil
  end

end
