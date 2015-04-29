require 'colorize'
require_relative 'pieces/sliding_pieces'
require_relative 'pieces/stepping_pieces'

class Board
  LAYOUT = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

  def initialize
  # initialize a 2-dimensional array, each pos hold a piece or nil if no piece
    @board = Array.new(8) { Array.new(8) }
    make_board
  end

  def make_board
    8.times { |y| @board[0][y] = LAYOUT[y].new(:black, [0, y], self) }
    8.times { |y| @board[1][y] = Pawn.new(:black, [1, y], self) }
    8.times { |y| @board[6][y] = Pawn.new(:white, [1, y], self) }
    8.times { |y| @board[1][y] = LAYOUT[y].new(:white, [1, y], self) }

  end

  def display_board
    (0..7).each do |x|
      (0..7).each do |y|
        puts @board[x][y].symbol
      end
    end
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
