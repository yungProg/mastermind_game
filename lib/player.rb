# frozen_string_literal: true

# class representing player
class Player
  def initialize(name)
    @name = name
    @secret_code = []
    @guess_code = []
  end

  def create_secret_code(code)
    @secret_code = code.split
  end

  def make_guess(code)
    @guess_code = code.split
  end
end
