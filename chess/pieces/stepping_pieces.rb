require_relative 'pieces.rb'

class SteppingPieces
  attr_reader :pos, :color

  def initialize(color, pos, board)
    super
  end
end

class Knight < SteppingPieces

  def moves
    x, y = pos
    potential_pos = []
    (x - 2..x + 2).each { |x| (y - 2..y + 2)
      .each { |y| potential_pos << [x, y] } }
      select_valids(potential_pos, x, y)
    end

    def select_valids(potentials, x, y)
      potentials.select do |xy|
        xy[0].between?(0, 7) && xy[1].between?(0, 7) && # is it overflowing the board?
        (x - xy[0]).abs < 3 && (y - xy[1]).abs < 3 && # can't move 3 in a straight line
        (x - xy[0]).abs + (y - xy[1]).abs == 3 && # but must move 3 steps
        @board.occupied?(@pos).color != color
      end
    end

  end
end

class King < SteppingPieces
  def moves
    x, y = pos
    potential_pos = []
    (x - 1..x + 1).each { |x| (y - 1..y + 1)
      .each { |y| potential_pos << [x, y] } }
      select_valids(potential_pos, x, y)
    end

    def select_valids(potential_pos, x, y)
      potentials.select do |xy|
        xy[0].between?(0, 7) && xy[1].between?(0, 7) && # is it overflowing the board?
        (x - xy[0]).abs < 2 && (y - xy[1]).abs < 2 && # can't move 3 in a straight line
        (x - xy[0]).abs + (y - xy[1]).abs == 1 && # but must move 3 steps
        @board.occupied?(@pos).color != color
      end
    end
    
  end
