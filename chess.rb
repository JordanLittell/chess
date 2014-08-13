require_relative 'game.rb'



if __FILE__ == $PROGRAM_NAME
  p1 = HumanPlayer.new
  p2 = HumanPlayer.new
  c1 = ComputerPlayer.new
  c2 = ComputerPlayer.new
  g = Game.new(c1, c2)
  g.run
end
