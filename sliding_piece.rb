require_relative 'piece.rb'

class SlidingPiece < Piece
  def gen_valid_moves
    valid_moves = []
    move_directions = self.class::MOVE_DIRECTIONS
    move_directions.each do |direction|
      new_position = add_vectors(@current_position, direction)
      while is_valid_pos?(new_position)
        valid_moves << new_position 
        new_position = add_vectors(new_position, direction)
      end
    end
    valid_moves
  end
end