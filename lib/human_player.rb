# frozen_string_literal: true

# class representing player
class HumanPlayer
  def initialize(name)
    @name = name
    @secret_code = []
    @guess_code = []
  end

  def create_secret_code
    puts 'Create code by listing comma separated colors'
    puts %w[Y O B G P R].inspect
    code = gets.chomp
    @secret_code = code.gsub(/[^a-z]/i, ' ').split.each(&:upcase!)
  end

  def make_guess
    puts 'Guess code by listing colors'
    puts %w[Y O B G P R].inspect
    code = gets.chomp
    @guess_code = code.gsub(/[^a-z]/i, ' ').split.each(&:upcase!)
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
