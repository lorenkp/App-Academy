require_relative 'board'
require_relative 'human_player'

class Chess
  def initialize
    @board = Board.new
    @player_one = HumanPlayer.new(:white)
    @player_two = HumanPlayer.new(:black)
    # player = { white: HumanPlayer.new(:white), black: HumanPlayer.new(:black) }
  end



  def play
    current_player = @player_one
    valid_move = false
    until over?
      @board.display_board
      until valid_move
        move_coordinates = current_player.prompt_user_input
        start_pos, end_pos = move_coordinates
        valid_move = @board.is_allowed?(start_pos, end_pos, current_player.color)
      end
      @board.move(move_coordinates, current_player.color)
      current_player = toggle(current_player)
    end
  end

  def over?
    container = @board.grid.flatten.compact
    return true if ( container.select! {|piece|
                            piece.is_a?(King) }.count < 2 )
    return false
  end



  def toggle(current_player)
    if current_player = @player_one
      return @player_two
    else
      @player_one
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  chess = Chess.new
  p chess.play


end
