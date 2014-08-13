require_relative 'sliding_piece.rb'
require_relative 'stepping_piece.rb'

class Board
  SETUP = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
  
  
  def initialize(initial = true)
    @board = Array.new(8) { Array.new(8) }
    place_initial_pieces if initial
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
        place_piece(Pawn, [row, col], (row == 1 ? :white : :black))
      end
    end
  end
  
  
  def place_royal_pieces()
    [0, 7].each do |row|
      SETUP.each_with_index do |piece, col|
        place_piece(piece, [row, col], (row == 0 ? :white : :black))
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
    @board.each_with_index do |row, x|
      row.each_with_index do |piece, y|
        pos = [x, y]
        b[pos] = piece.deep_dup(b) unless piece.nil?
      end
    end
    b
  end

  def get_king_position(color)
    king_position = nil
    get_all_colored_pieces(color).each do |piece|
      king_position = piece.current_position if piece.class == King
    end
    king_position
  end
  
  def get_all_moves(color)
    all_moves = []
    get_all_colored_pieces(color).each do |piece|
      all_moves += piece.gen_valid_moves
    end
    all_moves
  end
  
  def get_all_valid_moves(color)
    all_valid_moves = []
    get_all_colored_pieces(color).each do |piece|
      all_valid_moves += piece.gen_valid_moves.select do |move|
        piece.is_valid_move?(move)
      end
    end
    all_valid_moves
  end
  
  def in_check?(color)
    king_position = get_king_position(color)
    opponent_color = (color == :black ? :white : :black)
    opponent_valid_moves = get_all_moves(opponent_color)
    opponent_valid_moves.include?(king_position)
  end
  
  def move(piece, new_pos)
    if piece.is_valid_move?(new_pos)
      self[piece.current_position] = nil
      piece.current_position = new_pos
      self[new_pos] = piece
      return true
    end
    false
  end
  
  def move!(piece, new_pos)
    self[piece.current_position] = nil
    piece.current_position = new_pos
    self[new_pos] = piece 
  end
  
  def get_all_colored_pieces(color)
    @board.flatten.compact.select {|piece| piece.color == color}
  end
  
  def opposite_color(color)
    (color == :white ? :black : :white)
  end
  
  def checkmate?(color)
    variable = get_all_valid_moves(color)
    in_check?(color) && variable.empty?
  end
  
  def won?
    checkmate?(:black) || checkmate?(:white)
  end

end