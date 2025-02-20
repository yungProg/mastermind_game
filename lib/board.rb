# frozen_string_literal: true

# class representing mastermind board
class Board
  PEG_COLORS = %w[yellow orange blue green purple brown].freeze
  HINT_PEGS = %w[red white black].freeze
  @@hint = []
  def initialize(secret_code)
    @secret_code = secret_code
    @guess_code = nil
    @game_board = Array.new(12) { Array.new([%w[X X X X], %w[O O O O]]) }
    @current_row = 0
  end

  def display # rubocop:disable Metrics/MethodLength
    @game_board.each do |sub_arr|
      sub_arr.each_with_index do |sub_sub_arr, ind|
        if ind.zero?
          print sub_sub_arr
        else
          sub_sub_arr.each_with_index do |inner_arr, ind2|
            if ind2 == 2
              puts
              print "#{' ' * 19} #{inner_arr}"
            else
              print inner_arr
            end
          end
        end
      end
      puts
    end
    puts
  end

  def valid_guess?(guess)
    guess.length == 4 && guess.all? { |guess_peg| PEG_COLORS.include?(guess_peg) }
  end

  def board_full?
    @current_row == 11
  end

  def take_guess(guess)
    @guess_code = guess
    @game_board[@current_row][0] = @guess_code
  end

  def correct_guess?
    @@hint.all?('red')
  end

  def next_row
    @current_row += 1 unless board_full?
  end

  def any_winner?
    correct_guess? || board_full?
  end

  def declare_winner(player1, player2)
    if correct_guess?
      puts "#{player2} wins"
    elsif board_full?
      puts "#{player1} wins"
    end
    puts "The secret code was #{@secret_code}"
  end

  def check_guess # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    secret_code_clone = @secret_code.dup
    guess_code_clone = @guess_code.dup
    exact_matches = 0
    near_matches = 0
    guess_code_clone.each_with_index do |color, index|
      if color == secret_code_clone[index] # rubocop:disable Style/Next
        exact_matches += 1
        secret_code_clone[index] = nil
        guess_code_clone[index] = nil
      end
    end
    guess_code_clone.each_with_index do |color, index| # rubocop:disable Style/CombinableLoops,Lint/UnusedBlockArgument
      next if color.nil?

      if secret_code_clone.include?(color)
        near_matches += 1
        secret_code_clone[secret_code_clone.index(color)] = nil
      end
    end
    @@hint = [].concat(['red'] * exact_matches, ['white'] * near_matches,
                       ['black'] * (4 - exact_matches - near_matches))
  end

  def provide_hint
    @game_board[@current_row][1] = @@hint.shuffle
  end

  def self.retrieve_hint
    @@hint
  end
end

# a = %w[yellow blue red blue]
# b = %w[green blue yellow green]
# puts check_guess(a, b)
