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
  
  def is_valid_move?(pos)
    new_pos_piece = @board[pos]
    if new_pos_piece
      return false if new_pos_piece.color == @color
    end
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def move(new_pos)
    if is_valid_move?(new_pos)
      @board[@current_position] = nil
      @current_position = new_pos
      @board[new_pos] = self
    end
  end
end