require_relative 'chess.rb'


# set up tests


b = Board.new

b.place_piece..
b.place_piece..

b.move(a, b)

b.render
puts 'pawn should take knight!'