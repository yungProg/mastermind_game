# frozen_string_literal: true

# class representing computer player
class ComputerPlayer
  def initialize
    @name = 'Computer'
    @secret_code = []
    @guess_code = []
  end

  def create_secret_code
    @secret_code = Array.new(4) { Board::PEG_COLORS.sample }
  end

  def make_guess
    @guess_code = Array.new(4) { Board::PEG_COLORS.sample }
  end

  def retrieve_secret_code
    @secret_code
  end

  def retrieve_guess_code
    @guess_code
  end

  def retrieve_name
    @name
  end
end