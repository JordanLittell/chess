# encoding: UTF-8

require_relative 'stepping_piece.rb'


class King < SteppingPiece
  attr_accessor :moved, :can_castle_right, :can_castle_left
 
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
    '♚'
  end
  
  def castle_positions_to_check # not finished
    left = []
    right = []
    -3.upto(-1) do |i|
      left << [@current_position[0], @current_position[1] + i]
    end
    1.upto(2) do |i|
      right << [@current_position[0], @current_position[1] + i]
    end
    {left: left, right: right}
  end
  
end