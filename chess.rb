require_relative 'game.rb'



if __FILE__ == $PROGRAM_NAME
  p1 = HumanPlayer.new
  p2 = HumanPlayer.new
  g = Game.new(p1, p2)
  g.run
end

# g = Game.new(HumanPlayer.new(:white), HumanPlayer.new(:black))
# g.run
# a = Board.new
# a.render