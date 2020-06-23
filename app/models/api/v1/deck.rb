class Api::V1::Deck < ApplicationRecord
  has_many :cards
  belongs_to :game
end
