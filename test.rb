require_relative 'chess.rb'


# set up tests


p1 = HumanPlayer.new
p2 = HumanPlayer.new
g = Game.new(p1, p2, Board.new(false))
g.board.place_piece(Pawn, [1, 7], :black)
g.board.place_piece(Pawn, [6, 0], :white)
g.board.place_piece(King, [7, 7], :black)
g.board.place_piece(King, [0, 0], :white)
g.run
