# encoding: UTF-8

require_relative 'stepping_piece.rb'

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
    '♞'
  end
end