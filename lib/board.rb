# frozen_string_literal: true

# class representing mastermind board
class Board
  PEG_COLORS = %w[yellow orange blue green purple pink brown].freeze
  HINT_PEGS = %w[red white black].freeze
  def initialize(secret_code)
    @secret_code = secret_code.split
    @guess_code = nil
    @hint = []
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
    @hint.all?('red')
  end

  def next_row
    @current_row += 1 unless board_full?
  end

  def any_winner?
    correct_guess? || board_full?
  end

  def declare_winner(player1, player2)
    if board_full?
      puts "#{player1} wins"
    elsif correct_guess?
      puts "#{player2} wins"
    end
  end

  def check_guess
    @guess_code.each_with_index do |peg, position|
      @hint[position] = if peg == @secret_code[position]
                          'red'
                        elsif @secret_code.include?(peg)
                          'white'
                        else
                          'black'
                        end
    end
    @hint.shuffle!
  end

  def provide_hint
    @game_board[@current_row][1] = @hint
  end
end

# a = %w[yellow blue red blue]
# b = %w[green blue yellow green]
# puts check_guess(a, b)
