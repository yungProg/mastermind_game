# frozen_string_literal: true

# module of how to guess code
module Guess
  PEG_COLORS_COPY = %w[yellow orange blue green purple pink brown].shuffle
  def first_guess
    random_guess = PEG_COLORS_COPY[@number_of_guess]
    @number_of_guess += 1
    @guess_code = [random_guess] * 4
  end

  def subsequent_guess(hint)
    counter = hint.count('black')
    counter.times do |i|
      @guess_code[i] = PEG_COLORS_COPY[@number_of_guess]
    end
  end

  def arrange_pegs
    loop do |i|
      @guess_code.shuffle!
      if @previous_arrangements.include?( @guess_code)
        @previous_arrangements.push( @guess_code)
        break
      end
    end
  end

  def make_guess(hint)
    if @number_of_guess < 1
      first_guess
    else
      subsequent_guess(hint)
    end
    if retrieve_guess_code.all?('red')
      arrange_pegs
    end
    @guess_code
  end
end
