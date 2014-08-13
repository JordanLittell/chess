class HumanPlayer
  attr_accessor :color
  
  def get_valid_input
    input = gets.chomp.downcase
    raise ArgumentError unless input =~ /\A[a-h][1-8]\z/
    input = input.split("")
    input[0], input[1] = input[1].to_i - 1, input[0].ord - 97
    p input
    input
  end
  
  def play_turn
    p "Enter your piece coords"
    piece_pos = get_valid_input
    p "Enter your destination coords"
    destination = get_valid_input
    [piece_pos, destination]
  end
end