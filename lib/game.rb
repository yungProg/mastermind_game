# frozen_string_literal: true

# class representing mastermind game
class Game
  def initialize(player1, player2)
    @secret_maker = Player.new(player1)
    @secret_guesser = Player.new(player2)
  end

  def play # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    puts 'Create code by listing comma separated colors'
    puts '[yellow, blue, green, orange, pink, brown]'
    secret_code = gets.chomp
    board = Board.new(secret_code)
    @secret_maker.create_secret_code(secret_code)
    loop do
      board.display
      puts 'Guess code by listing comma separated colors'
      puts '[yellow, blue, green, orange, pink, brown]'
      guess_code = gets.chomp
      @secret_guesser.make_guess(guess_code)
      board.take_guess(guess_code) if board.valid_guess?(guess_code)
      board.check_guess
      board.provide_hint
      board.declare_winner
      board.next_row
    end
  end
end
