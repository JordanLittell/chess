class Piece
  attr_accessor :board, :current_position, :color
  
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
    b = @board.deep_dup
    b.move!(b[@current_position],pos)
    gen_valid_moves.include?(pos) && !b.in_check?(@color)
  end
  
  def deep_dup(new_board)
    self.class.new(new_board, @current_position, @color)
  end
end