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
  
  def place_piece(class_name, pos, color)
    self[pos] = class_name.new(self, pos, color)
  end
  
  
  def place_pawns
    [1, 6].each do |row|
      8.times do |col|
        place_piece(Pawn, [row, col], (row == 1 ? :black : :white))
      end
    end
  end
  
  def place_royal_pieces()
    [0, 7].each do |row|
      SETUP.each_with_index do |piece, col|
        place_piece(piece, [row, col], (row == 0 ? :black : :white))
      end
    end
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
  
  def deep_dup
    b = Board.new
    @board.each_with_index do |row,x|
      row.each_with_index do |piece, y|
        pos = [x, y]
        b[pos] = piece.deep_dup(b) unless piece.nil?
      end
    end
    b
  end

  # def won?(color)
#     in_check?((color == :black ? :white : :black))
#   end
#
#   def in_check?(color)
#   end
end