class Piece
  attr_accessor :board, :position, :color
  
  def initialize(board, position, color)
    @current_position = position
    @color = color
    @board = board
  end
  
  def add_vectors(vector1,vector2)
    [vector1[0] + vector2[0], vector1[1] + vector2[1]]
  end
  
  def is_valid_pos?(pos)
    return false unless pos[0].between?(0,7) && pos[1].between?(0,7)
    new_pos_piece = @board[pos]
    if new_pos_piece
      return false if new_pos_piece.color == @color
    end
    true
  end
  
  def is_valid_move?(pos)
    gen_valid_moves.include?(pos)
  end

  def move(new_pos)
    if is_valid_move?(new_pos)
      @board[@current_position] = nil
      @current_position = new_pos
      @board[new_pos] = self
      return true
    end
    p "Please pick a valid position."
    false
  end
  
  def deep_dup(new_board)
    self.class.new(new_board, @current_position, @color)
  end
end