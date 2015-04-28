class Board

  def initialize
  # initialize a 2-dimensional array, each pos hold a piece or nil if no piece
    @board = Array.new(8) { Array.new(8) }
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
