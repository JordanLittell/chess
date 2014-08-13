require_relative 'board.rb'
require_relative 'player.rb'

class Game
  attr_reader :board
  
  def initialize(player1, player2, board = Board.new)
    @board = board
    @p1 = player1
    @p1.color = :white
    @p2 = player2
    @p2.color = :black
    @current_player = @p1
  end
  
  def run
    until false# @board.won?
      @board.render
      p "#{@current_player.color.to_s}'s turn"
      p "Enter your piece coords"
      piece_pos = gets.chomp.split(" ").map(&:to_i)
      p "Enter your destination coords"
      destination = gets.chomp.split(" ").map(&:to_i)
      if @current_player.color == @board[piece_pos].color
        switch_current_player if @board[piece_pos].move(destination)
      end
    end
  end
  
  def switch_current_player
    @current_player = (@current_player == @p1 ? @p2 : @p1)
  end
end