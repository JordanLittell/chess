require_relative 'chess.rb'


# set up tests


p1 = HumanPlayer.new
p2 = HumanPlayer.new
g = Game.new(p1, p2)
g.board.place_piece(King, [4, 0], :black)
g.board.place_piece(Rook, [2, 1], :black)
g.board.place_piece(Queen, [5, 6], :white)
g.board.place_piece(Rook, [6, 2], :white)
g.board.place_piece(King, [7, 0], :white)
g.run
