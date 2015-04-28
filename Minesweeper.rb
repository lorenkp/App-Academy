class Tile
  attr_accessor :board, :bombed, :flag, :revealed, :public_display

  def initialize(position)
    @bombed = false
    @flag = false
    @revealed = false
    @position = position
    @public_display = "*"
  end

  def reveal
    self.revealed = true
    @public_display = (neighbor_bomb_count > 0 ? neighbor_bomb_count.to_s : "_")
    if neighbor_bomb_count == 0
      tiles = neighbors.map{ |position| @board.get_tile(position) }
      tiles.each do |tile|
        tile.reveal unless tile.flagged? || tile.revealed?
      end
    end
    nil
  end

  def bombed?
    @bombed
  end

  def flagged?
    @flag
  end

  def revealed?
    @revealed
  end

  def flag
    if flagged?
      @public_display = "*"
      @flag = false
      @board.flag_count -= 1
    else
      @public_display = "F"
      @flag = true
      @board.flag_count += 1
    end
  end

  def neighbors
    if @neighbors
      @neighbors
    else
      neighbors = []
      adjustments = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
      adjustments.each do |dx, dy|
        neighbors << [@position[0] + dx, @position[1] + dy]
      end

      @neighbors = neighbors.select { |x, y| x.between?(0, 8) && y.between?(0, 8) }
    end
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
  attr_accessor :flag_count

  def initialize
    @grid_size = 9
    @bomb_num = 10
    @grid = Array.new(@grid_size) { Array.new(@grid_size) }
    @flag_count = 0
    make_grid
  end

  def get_tile(pos)
    row, col = pos
    @grid[row][col]
  end

  def make_grid
    @grid_size.times do |row|
      @grid_size.times do |col|
        @grid[row][col] = Tile.new([row, col])
      end
    end

    place_bombs
    update_tile_boards

    nil
  end

  def place_bombs
    bombs_left = @bomb_num
    while bombs_left > 0
      row = (0..8).to_a.sample
      col = (0..8).to_a.sample
      unless @grid[row][col].bombed
        @grid[row][col].bombed = true
        bombs_left -= 1
      end
    end
  end

  def update_tile_boards
    @grid.each do |row|
      row.each do |tile|
        tile.board = self
      end
    end
  end

  def display
    puts "Number of bombs: #{bomb_num}"
    puts "Flagged cells: #{flag_count}"
    print "   "
    @grid.size.times do |col_counter|
      print "  #{col_counter}  "
    end
    puts
    @grid.each_with_index do |row, idx|
      print "#{idx}  "
      p row.map(&:public_display)
    end

    nil
  end

  def won?
    flag_count == bomb_num && grid.flatten.all? { |tile| tile.flagged? || tile.revealed? }
  end

end

class Game

  def initialize
    @board = Board.new
  end

  def get_input
    puts "Choose square to reveal or flag—e.g. r00."
    input = gets.chomp.split('')
    choice = input.shift.downcase
    position = input.map(&:to_i)
    until valid_input?(choice, position)
      input = gets.chomp.split('')
      choice = input.shift.downcase
      position = input.map(&:to_i)
    end

    {choice: choice, position: position}
  end

  def over?
    @board.won?
  end

  def play
    until over?
      @board.display
      input = get_input
      tile = @board.get_tile(input[:position])
      if input[:choice] == "f"
        tile.flag
      elsif tile.bombed?
        p "YOU LOSE, SUCKA"
        return
      else
        tile.reveal
      end
    end
    puts "You won!"
  end

  def valid_input?(choice, position)
    x, y = position
    if !['f', 'r'].include?(choice)
      puts "Please choose flag: f or reveal: r."
    elsif !x.between?(0,8) || !y.between?(0,8)
      puts "That is not a valid entry. Please try again."
    elsif @board.get_tile(position).revealed?
      puts "That tile is already revealed. Please try again."
    elsif @board.get_tile(position).flagged? && choice == 'r'
      puts "Can't reveal a flagged tile. Please try again"
    else
      return true
    end

    return false
  end
end
