# frozen_string_literal: true

# class representing mastermind game
class Game
  def initialize(player1, player2)
    @new_board = Board.new
    @secret_maker = Player.new(player1)
    @secret_guesser = Player.new(player2)
  end
end
