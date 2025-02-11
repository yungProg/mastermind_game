# frozen_string_literal: true

# class representing mastermind game
class Game
  def initialize(player1, player2)
    @secret_maker = player1
    @secret_guesser = player2
  end

  def play # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    board = nil
    loop do
      @secret_maker.create_secret_code
      print @secret_maker.create_secret_code
      board = Board.new(@secret_maker.retrieve_secret_code)
      break if board.valid_guess?(@secret_maker.retrieve_secret_code)
    end
    loop do
      board.display
      loop do
        @secret_guesser.make_guess
        if board.valid_guess?(@secret_guesser.retrieve_guess_code)
          board.take_guess(@secret_guesser.retrieve_guess_code)
          break
        end
      end
      board.check_guess
      board.provide_hint
      if board.any_winner?
        board.display
        board.declare_winner(@secret_maker.retrieve_name, @secret_guesser.retrieve_name)
        break
      end
      board.next_row
    end
  end

  def play_again?
    puts 'Do you want to play again? (yes/no)'
    gets.chomp
  end
end
