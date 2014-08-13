class HumanPlayer
  attr_accessor :color
  
  def get_valid_input
    input = gets.chomp
    raise ArgumentError unless input =~ /\A\d \d\z/
    input.split(" ").map(&:to_i)
  end
  
  def play_turn
    p "Enter your piece coords"
    piece_pos = get_valid_input
    p "Enter your destination coords"
    destination = get_valid_input
    [piece_pos, destination]
  end
end