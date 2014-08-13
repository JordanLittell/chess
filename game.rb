require_relative 'board.rb'
require_relative 'player.rb'

class Game
  attr_reader :board
  
  def initialize(player1, player2, board = Board.new)
    @board = board
    @p1 = player1
    @p1.board = @board
    @p1.color = :white
    @p2 = player2
    @p2.board = @board
    @p2.color = :black
    @current_player = @p1
  end
  
  def process_turn(positions) 
    piece_pos, destination = positions[0], positions[1]
    raise ArgumentError.new("no piece at that position!") if @board[piece_pos].nil?
    if @current_player.color == @board[piece_pos].color
      current_piece = @board[piece_pos]
      if @board.move(current_piece, destination)
        pawn_promoted = @board.check_pawn_promotion(@current_player.color)
        if pawn_promoted
          choice = @current_player.get_promotion_choice
          @board.promote_pawn(pawn_promoted, choice)
        end
        switch_current_player
      end
    else
      raise ArgumentError.new("That is not your piece!")
    end
  end
  
  def run
    until @board.won? || @board.no_valid_moves?(@current_player.color)
      @board.render
      p "you are in check" if @board.in_check?(@current_player.color)
      p "#{@current_player.color.to_s}'s turn"
      begin
        # sleep 0.1
        # system 'clear'
        positions = @current_player.play_turn
        process_turn(positions)
      rescue => e
        p e.message
        retry
      end
    end
    @board.render
    if @board.won?
      p "Checkmate"
    elsif @board.no_valid_moves?(@current_player.color)
      p "Stalemate"
    end
  end
  
  def switch_current_player
    @current_player = (@current_player == @p1 ? @p2 : @p1)
  end
end