# frozen_string_literal: true

# module of how to guess code
module Guess
  PEG_COLORS_COPY = %w[yellow orange blue green purple brown].shuffle
  def first_guess
    random_guess = PEG_COLORS_COPY[@number_of_guess]
    @number_of_guess += 1
    @guess_code = [random_guess] * 4
  end

  def subsequent_guess
    counter = Board.retrieve_hint.count('black')
    counter.times do |i|
      @guess_code[i] = PEG_COLORS_COPY[@number_of_guess]
    end
    @number_of_guess += 1
  end

  def arrange_pegs
    loop do
      c = @guess_code.shuffle.dup
      unless @previous_arrangements.include?(c) # rubocop:disable Style/Next
        @previous_arrangements.push(c)
        @guess_code = c
        break
      end
    end
  end

  def make_guess
    if @number_of_guess < 1
      first_guess
    else
      subsequent_guess
    end
    arrange_pegs if Board.retrieve_hint.all?('white') || @number_of_guess > 6
    @guess_code
  end
end
