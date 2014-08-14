# encoding: UTF-8

require_relative 'sliding_piece.rb'

class Rook < SlidingPiece
  attr_accessor :moved
  
  def initialize(board,position, color, moved=false)
    @moved = moved
    super(board, position, color)
  end
  
  MOVE_DIRECTIONS = [[0,1], [1,0], [-1,0], [0,-1]]
  
  def inspect
    '♜'
  end
end