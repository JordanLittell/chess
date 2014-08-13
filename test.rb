require_relative 'chess.rb'


# set up tests


p1 = HumanPlayer.new
p2 = HumanPlayer.new
g = Game.new(p1, p2, Board.new(false))
g.board.place_piece(King, [0, 2], :black)
g.board.place_piece(Rook, [0, 0], :black)
g.board.place_piece(Rook, [7, 7], :black)
g.board.place_piece(Queen, [0, 7], :black)
g.board.place_piece(Queen, [5, 6], :white)
g.board.place_piece(Rook, [6, 2], :white)
g.board.place_piece(King, [7, 0], :white)
g.run
