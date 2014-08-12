require_relative 'piece.rb'

class SlidingPiece < Piece
  
  
  def gen_valid_moves
    valid_moves = []
    move_directions = self.class::MOVE_DIRECTIONS
    move_directions.each do |direction|
      p @current_position
      p direction
      new_position = add_vectors(@current_position, direction)
      p new_position
      while is_valid_move?(new_position)
        valid_moves << new_position 
        new_position = add_vectors(new_position,direction)
      end
    end
    valid_moves
  end
end

class Queen < SlidingPiece
  MOVE_DIRECTIONS = [[0,1], [1,0], [-1,0], [0,-1], [1,1], [1,-1], [-1,-1], [-1,1]]
  
  def inspect
    'Q'
  end
end

class Rook < SlidingPiece
  MOVE_DIRECTIONS = [[0,1], [1,0], [-1,0], [0,-1]]
  
  def inspect
    'R'
  end
end

class Bishop < SlidingPiece
  MOVE_DIRECTIONS = [[1,1], [1,-1], [-1,-1], [-1,1]]
  
  def inspect
    'B'
  end
end