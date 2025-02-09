# frozen_string_literal: true

# class representing player
class Player
  def initialize(name)
    @name = name
    @secret_code = []
    @guess_code = []
  end

  def create_secret_code(code)
    @secret_code = code.gsub(/[^a-z]/i, ' ').split
  end

  def make_guess(code)
    @guess_code = code.gsub(/[^a-z]/i, ' ').split
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
