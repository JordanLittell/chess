require_relative 'game.rb'



if __FILE__ == $PROGRAM_NAME
  
  begin
    print "Would you like to start a new game "
    print "or load a game or watch two computers battle??\n"
    input = gets.chomp.downcase
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
    else 
      raise ArgumentError.new("You must choose either new, load, or battle")
    end
  rescue => error
    puts error.message
    retry
  end
end
