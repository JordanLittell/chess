# encoding: UTF-8

require_relative 'sliding_piece.rb'

class Queen < SlidingPiece
  MOVE_DIRECTIONS = [[0,1], [1,0], [-1,0], [0,-1], 
                     [1,1], [1,-1], [-1,-1], [-1,1]]
  def inspect
    '♛'
  end
end