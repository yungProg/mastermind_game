# frozen_string_literal: true

# module of how to guess code
module Guess
  @@colors = []
  @@shuffled_colors = PEG_COLORS.shuffle
  @@attempt = 0
  def first_guess
    random_color = @@shuffled_colors[@@attempt]
    @@attempt += 1
    @@colors = [random_color, random_color, random_color, random_color]
  end

  def check_hint
    retrieve_hint.count('white' || 'red')
  end

  def subsequent_guess
    if check_hint.zero?
      @@colors = [@@shuffled_colors[@@attempt], @@shuffled_colors[@@attempt], @@shuffled_colors[@@attempt], @@shuffled_colors[@@attempt]]
    else
      (4 - check_hint).times do |i|
        @@colors[4 - check_hint + i] = @@shuffled_colors[@@attempt]
    end
  end

  def rearrange
    until @@colors == @@colors.shuffle
      @@colors.shuffle!
    end
  end
end
