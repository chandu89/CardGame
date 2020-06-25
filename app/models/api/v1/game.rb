module Api
  module V1
    # Game class to work with game details
    class Game < ApplicationRecord
      validates :first_player, :second_player, presence: true
    end
  end
end
