require_relative 'sliding_piece.rb'
require_relative 'stepping_piece.rb'

class Board
  SETUP = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
  
  
  def initialize
    @board = Array.new(8) { Array.new(8) }
    place_initial_pieces
  end
  
  def [](pos)
    @board[pos[0]][pos[1]]
  end
  
  def []=(pos, value)
    @board[pos[0]][pos[1]] = value
  end
  
  def place_initial_pieces
    place_pawns
    place_royal_pieces
  end
  
  def place_piece(class_name, color, pos)
    nil
  end
  
  
  def place_pawns
    [1, 6].each do |row|
      @board[row].map! do |col|
        Pawn.new(self, [row, col], (row == 1 ? :black : :white))
      end
    end
  end
  
  def place_royal_pieces()
    [0, 7].each do |row|
      SETUP.each_with_index do |piece, col|
        pos = [row, col]
        self[pos] = piece.new(self, pos, (row == 0 ? :black : :white))
      end
    end
    
    # [0, 7].each do |row|
#       pieces = SETUP.each
#       pieces.each_with_index do |piece, index|
#         piece.color = (row == 0 ? :black : :white)
#         piece.move([row, index])
#       end
#
#       pieces = [Rook.new(self), Knight.new(self), Bishop.new(self),King.new(self)]
#       pieces.each_with_index do |piece, index|
#         piece.color = (row == 0 ? :black : :white)
#         piece.move([row, 7 - index])
#       end
#     end
  end
  
  def render
    @board.each do |row|
      str= ""
      row.map do |piece|
        if piece.nil?
          str+= "- "
        else
          str+= "#{piece.inspect} "
        end
      end
      puts str
    end
  end

  # def won?(color)
#     in_check?((color == :black ? :white : :black))
#   end
#
#   def in_check?(color)
#   end
end