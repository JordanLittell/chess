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