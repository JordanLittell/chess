require_relative 'king.rb'
require_relative 'queen.rb'
require_relative 'rook.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'pawn.rb'

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
        place_piece(Pawn, [row, col], (row == 1 ? :black: :white))
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
    puts ""
    puts "  a b c d e f g h  "
    @board.each_with_index do |row, i|
      str = "#{8-i} "
      row.map do |piece|
        if piece.nil?
          str += "- "
        else
          str+= "#{piece.inspect} "
        end
      end
      puts str
    end
    puts
  end
  
  def deep_dup
    duped_board = Board.new(false)
    @board.flatten.compact.each do |piece|
      duped_board.place_piece(piece.class, piece.current_position, piece.color)
    end
    duped_board
  end

  def get_king_position(color)
    get_all_colored_pieces(color).find do |piece|
      piece.is_a?(King)
    end.current_position
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
    opponent_color = opposite_color(color)
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
    raise ArgumentError.new("That is not a valid move!")
    false
  end
  
  def move!(piece, new_pos)
    self[piece.current_position] = nil
    piece.current_position = new_pos
    self[new_pos] = piece 
  end
  
  def get_all_colored_pieces(color)
    @board.flatten.compact.select { |piece| piece.color == color }
  end
  
  def get_all_colored_pawns(color)
    get_all_colored_pieces(color).select { |piece| piece.is_a?(Pawn) }
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
  
  def promote_pawn(pawn, new_piece_class)
    place_piece(new_piece_class, pawn.current_position, pawn.color)
  end
  
  def check_pawn_promotion(color)
    get_all_colored_pawns(color).find { |pawn| pawn.on_last_row? }
  end
  
  def no_valid_moves?(color)
    get_all_valid_moves(color).empty?
  end
end