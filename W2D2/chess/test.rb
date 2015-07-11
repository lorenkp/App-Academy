def horizontal_vertical_movement(pos)
  horizontal_vertical_moves = []
  (0..8).each { |x| horizontal_vertical_moves <<
                [x, pos[1]] unless x == pos[0] }
  (0..8).each { |y| horizontal_vertical_moves <<
                [pos[0], y] unless y == pos[1] }
  horizontal_vertical_moves
end
p horizontal_vertical_movement([4,4])
# board.occupied?([pos[0], y])
#
# || board.occupied?([x, pos[1]])
