class HumanPlayer
  attr_accessor :color, :board
  
  def get_valid_input
    input = gets.chomp.downcase
    return "save" if input == "save"
    raise ArgumentError.new("Enter standard chess coordinates ex: f2") unless input =~ /\A[a-h][1-8]\z/
    input = input.split("")
    input[0], input[1] = 8 - input[1].to_i, input[0].ord - 97
    p input
    input
  end
  
  def play_turn
    p "Enter your piece coords"
    piece_pos = get_valid_input
    return "save" if piece_pos == "save"
    p "Enter your destination coords"
    destination = get_valid_input
    [piece_pos, destination]
  end
  
  def get_promotion_choice
    Queen
  end
end

class ComputerPlayer
  
  attr_accessor :color, :board
  
  def play_turn
    destination = nil
    until destination
      piece = board.get_all_colored_pieces(color).sample  
      destinations = piece.gen_valid_moves.select do |move|
        piece.is_valid_move?(move)
      end
      destination = destinations.sample
    end
    [piece.current_position, destination]
  end
    
  def put_in_check?(move)
  end
  
  def get_promotion_choice
    Queen
  end
end