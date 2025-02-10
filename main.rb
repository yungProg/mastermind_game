# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/player'

Game.new('Gideon', 'Ama').play
Game.new('Gideon', 'Ama').play while Game.new('Gideon', 'Ama').play_again?.downcase == 'yes'
puts 'Thanks for playing!'