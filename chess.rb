require_relative 'game.rb'

puts "Would you like to start a new game or load a game?"
input = gets.chomp
if input == "new"
  Game.new(HumanPlayer.new, ComputerPlayer.new).run
elsif input == "load"
  puts "What's the file you want to load?"
  filename = gets.chomp
  Game.load_game(filename)
end


if __FILE__ == $PROGRAM_NAME
  p1 = HumanPlayer.new
  p2 = HumanPlayer.new
  c1 = ComputerPlayer.new
  c2 = ComputerPlayer.new
  g = Game.new(c1, c2)
  # g.run
end
