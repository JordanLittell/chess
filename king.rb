# encoding: UTF-8

require_relative 'stepping_piece.rb'


class King < SteppingPiece
  attr_accessor :moved
 
  def initialize(board, position, color, moved=false)
    @moved = moved
    super(board, position, color)
  end
  
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
    (@color == :white ? '♔' : '♚')
  end
  
  
  
end