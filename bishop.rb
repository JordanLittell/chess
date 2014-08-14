# encoding: UTF-8

require_relative 'sliding_piece.rb'

class Bishop < SlidingPiece
  MOVE_DIRECTIONS = [[1,1], [1,-1], [-1,-1], [-1,1]]
  
  def inspect
    '♝'
  end
end