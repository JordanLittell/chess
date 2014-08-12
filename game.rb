require_relative 'board.rb'
require_relative 'player.rb'

class Game
  def initialize(player1, player2, board = Board.new)
    @board = board
    @p1 = player1
    @p2 = player2
    @current_player = @p1
  end
  
  def run
    until false# @board.won?
      @board.render
      p "Enter your piece coords"
      piece_pos = gets.chomp.split(" ").map(&:to_i)
      p "Enter your destination coords"
      destination = gets.chomp.split(" ").map(&:to_i)
      if @current_player.color == @board[piece_pos].color
        @board[piece_pos].move(destination)
      end
    end
  end
end