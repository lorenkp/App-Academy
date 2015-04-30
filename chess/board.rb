require 'colorize'
require_relative 'sliding_piece'
require_relative 'stepping_piece'

class Board
  LAYOUT = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
  COLORS_EVEN ={ :color => :light_blue, :background => :green}
  COLORS_ODD = { :color => :green, :background => :yellow}

  attr_reader :grid
  def initialize
  # initialize a 2-dimensional array, each pos hold a piece or nil if no piece
    @grid = Array.new(8) { Array.new(8) }
    make_board
  end


  def [](row, col)
    @grid[row][col]
  end

  def display_board
    print "\n"
    8.times do |col|
      8.times do |row|
        if (col.even? && row.even?) || (col.odd? && row.odd?)
          if @grid[col][row].nil?
            print "    ".colorize({ :color => :white, :background => :black })
          else
            print " #{@grid[col][row].symbol}  ".colorize({ :color => :white, :background => :black })
          end
        else
          if @grid[col][row].nil?
            print "    ".colorize({ :color => :black, :background => :light_black })
          else
            print " #{@grid[col][row].symbol}  ".colorize({ :color => :black, :background => :light_black })
          end
        end
      end
      print "\n"
    end
    print "\n"
  end

  def is_allowed?( start_pos, end_pos, color)
    @grid.occupied?(start_pos) &&
    ( @grid[start_pos].color == color ) &&
    ( @grid[end_pos] == nil || @grid[end_pos].color != color )
  end

  def make_board
    8.times { |y| @grid[0][y] = LAYOUT[y].new(:black, [0, y], self) }
    # 8.times { |y| @grid[1][y] = Pawn.new(:black, [1, y], self) }
    # 8.times { |y| @grid[6][y] = Pawn.new(:white, [6, y], self) }
    8.times { |y| @grid[7][y] = LAYOUT[y].new(:white, [7, y], self) }
  end

  def move(begin_end_coordinates)
    start_pos, end_pos = begin_end_coordinates
    # pos_moves = @grid[start_pos].moves
    # pos_moves.include?(end_pos)
    @board.pos = end_pos
    # update display grid at end

  end

  def possible?(end_pos)
  end

  def valid_moves(pos)
    #
    piece = @grid[]
    start_pos, end_pos = begin_end_coordinates
    occupied?(start_pos)
  end

  def occupied?(pos)
    x,y =  pos
    if @grid[x,y] == nil
      return true
    else
      return false
    end
  end
  def on_board?
  end

  def piece_at(pos)
  end

  def valid_pos?(pos)
    [pos].all? { |coord| coord.between?(0,7) }
  end


  # have method #in_check?(color) return whether a player is in check
    # find position of king
    # then see if any opposing pieces canmove to that position


  # #move(start, end_pos)
    # 1) update the 2nd grid and also the moved piece's position
    # 2) raise exception if
        # a) no piece at start
        # b) piece cannot move to end_pos

end


if __FILE__ == $PROGRAM_NAME
  grid = Board.new
  p grid[0,0].moves

end
