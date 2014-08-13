# encoding: UTF-8

require_relative 'stepping_piece.rb'

class Pawn < SteppingPiece
  def inspect
    (@color == :white ? '♙' : '♟')
  end
  
  def gen_valid_moves
    moves = []
    
    if @color == :white 
      dir = [[-1,0], [-1,1], [-1,-1]]
      if @current_position[0] == 6
        dir << [-2,0] unless @board[add_vectors(@current_position, [-1, 0])]
      end
     
    else
      dir = [[1, 0], [1,1], [1,-1]]
      if @current_position[0] == 1
        dir << [2,0] unless @board[add_vectors(@current_position, [1, 0])]
      end
    end
    
    dir.each do |vec|
      new_pos = add_vectors(@current_position, vec)
      break unless is_valid_pos?(new_pos)
      moves << new_pos if !@board[new_pos] && vec[1] == 0
      moves << new_pos if @board[new_pos] && vec[1] != 0
    end
    
    moves
  end
  
  def on_last_row?
    if @color == :white
      @current_position[0] == 0
    else
      @current_position[0] == 7
    end
  end
end