# frozen_string_literal: true

require_relative 'guess'
# class representing computer player
class ComputerPlayer
  include Guess
  def initialize(name)
    @name = name
    @secret_code = []
    @guess_code = []
    @number_of_guess = 0
    @previous_arrangements = []
  end

  def create_secret_code
    @secret_code = Array.new(4) { Board::PEG_COLORS.sample }
  end

  # def make_guess
  #   @guess_code = Array.new(4) { Board::PEG_COLORS.sample }
  #   print @guess_code
  # end

  def retrieve_secret_code
    @secret_code
  end

  def retrieve_guess_code
    @guess_code
  end

  def retrieve_name
    @name
  end

  def retrieve_hint_c
    Board.retrieve_hint
  end
end
