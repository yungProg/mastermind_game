# frozen_string_literal: true

# class to create player
class PlayerFactory
  def self.create_player(player_type, name)
    case player_type
    when 'human'
      HumanPlayer.new(name)
    when 'computer'
      ComputerPlayer.new(name)
    end
  end
end