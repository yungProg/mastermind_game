# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/computer_player'
require_relative 'lib/human_player'
require_relative 'lib/player_factory'

puts 'Welcome to Mastermind!'
puts 'Choose player type for player 1 (human/computer)'
player1_type = gets.chomp
puts 'Enter player 1 name'
player1_name = gets.chomp
puts
puts 'Choose player type for player 2 (human/computer)'
player2_type = gets.chomp
puts 'Enter player 2 name'
player2_name = gets.chomp

Game.new(PlayerFactory.create_player(player1_type, player1_name), PlayerFactory.create_player(player2_type, player2_name)).play
Game.new(PlayerFactory.create_player(player1_type, player1_name), PlayerFactory.create_player(player2_type, player2_name)).play while Game.new(PlayerFactory.create_player(player1_type, player1_name), PlayerFactory.create_player(player2_type, player2_name)).play_again?.downcase == 'yes'
puts 'Thanks for playing!'