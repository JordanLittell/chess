require_relative 'piece.rb'

class SteppingPiece < Piece
  def gen_valid_moves
    pos_moves.select do |pos|
      is_valid_pos?(pos)
    end
  end
  
  def pos_moves
    possible_moves = []
    self.class::VECTORS.each do |vector|
      new_position = add_vectors(@current_position, vector)
      possible_moves << new_position
    end
    possible_moves
  end
end

class King < SteppingPiece
  VECTORS = [
    [ 0,  1],
    [ 1,  0],
    [ 1,  1],
    [ 0, -1],
    [-1,  0],
    [-1, -1],
    [-1,  1],
    [ 1, -1]
  ]
  
  def inspect
    'K'
  end
end

class Knight < SteppingPiece
  VECTORS = [
    [ 1,  2],
    [ 1, -2],
    [-1,  2],
    [-1, -2],
    [ 2, -1],
    [ 2,  1],
    [-2,  1],
    [-2, -1]
  ]
  
  def inspect
    'N'
  end
end

class Pawn < SteppingPiece
  def inspect
    'P'
  end
  
  def gen_valid_moves
    moves = []
    if @color == :white 
      dir = [[-1,0], [-1,1], [-1,-1]]
      if @current_position[0] == 6
        dir << [-2,0] unless @board[add_vectors(@current_position, [-1, 0])]
      end
     
    else
      dir = [[1, 0], [1,1], [1,-1]]
      if @current_position[0] == 1
        dir << [2,0] unless @board[add_vectors(@current_position, [1, 0])]
      end
      
    end
    dir.map do |vec|
      new_pos = add_vectors(@current_position, vec)
      moves << new_pos if !@board[new_pos] && vec[1] == 0
      moves << new_pos if @board[new_pos] && vec[1] != 0
    end
    moves
  end
end