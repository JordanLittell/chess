require_relative 'game.rb'



if __FILE__ == $PROGRAM_NAME
  

  puts "Would you like to start a new game or load a game or watch two computers battle??"
  input = gets.chomp
  if input == "new"
    Game.new(HumanPlayer.new, ComputerPlayer.new).run
  elsif input == "load"
    puts "What's the file you want to load?"
    filename = gets.chomp
    Game.load_game(filename)
  elsif input == "battle"
    c1 = ComputerPlayer.new
    c2 = ComputerPlayer.new
    Game.new(c1, c2).run
  end
end
