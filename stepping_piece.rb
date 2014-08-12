require_relative 'piece.rb'

class SteppingPiece < Piece
  def gen_valid_moves(pos_moves)
    pos_moves.select do |pos|
      is_valid_move?(pos)
    end
  end
  
  def possible_moves(vector_list)
    possible_moves = []
    vector_list.each do |vector|
      new_position =  add_vectors(position,vector)
      possible_moves << [x,y] 
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
end