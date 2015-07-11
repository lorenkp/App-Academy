class HumanPlayer
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def parse_coordinates(current_position, end_position)
    begin_end_coord = []
    begin_end_coord << current_position.split(", ").map { |i| i.to_i }
    begin_end_coord << end_position.split(", ").map { |i| i.to_i }
    begin_end_coord
  end


  def prompt_user_input
    puts "Which piece?"
    current_position = gets.chomp
    puts "To where?"
    end_position = gets.chomp
    parse_coordinates(current_position, end_position)
  end


end
