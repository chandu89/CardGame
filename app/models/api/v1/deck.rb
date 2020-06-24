module Api
  module V1
    # Deck class to work with Deck details
    class Deck < ApplicationRecord
      has_many :cards, dependent: :destroy
      belongs_to :game
    end
  end
end
