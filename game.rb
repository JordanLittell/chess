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
      p "you are in check" if @board.in_check?(@current_player.color)
      p "#{@current_player.color.to_s}'s turn"
      positions = @current_player.play_turn
      piece_pos = positions[0]
      destination = positions[1]
      if @current_player.color == @board[piece_pos].color
        current_piece = @board[piece_pos]
        switch_current_player if @board.move(current_piece, destination)
      end
    end
  end
  
  def switch_current_player
    @current_player = (@current_player == @p1 ? @p2 : @p1)
  end
end