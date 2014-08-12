class Piece
  attr_accessor :board, :position, :color
  
  def initialize(position, color, board)
    @current_position = position
    @color = color
    @board = board
  end
  
  def add_vectors(vector1,vector2)
    [vector1[0] + vector2[0], vector1[1] + vector2[1]]
  end
  
  def is_valid_move?(pos)
    return false if @board[pos[0]][pos[1]].color == @color
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def move(new_pos)
    @current_position = new_pos if is_valid_move?(new_pos)
  end
  
end

class Board
  attr_reader
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end
  
  def place_initial_pieces
    [1, 7].each do |row|
      @board[row].map! do |pos|
        Pawn.new(pos, (row == 1 ? :black : :white), @board)
      end
    end
  end
end

class Game
  
  
end

class SlidingPiece < Piece

  
  def generate_valid_moves(move_directions)
    valid_moves = []
    move_directions.each do |direction|
      new_position = add_vectors(position, direction)
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
end

class Rook < SlidingPiece
  MOVE_DIRECTIONS = [[0,1], [1,0], [-1,0], [0,-1]]
end

class Bishop < SlidingPiece
  MOVE_DIRECTIONS = [[1,1], [1,-1], [-1,-1], [-1,1]]
end

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
end

p Knight::VECTORS