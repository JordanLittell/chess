require_relative 'chess.rb'


# set up tests


p1 = HumanPlayer.new
p2 = HumanPlayer.new
g = Game.new(p1, p2)
g2 = Game.new(p1, p2)
v = g.board.deep_dup.place_piece(Queen,[5,0],:black)
v.board.render
g.board.place_piece(Queen, [4, 4], :black)
g.board.render
