class Api::V1::Game < ApplicationRecord
  has_one :deck

  validates :first_player, :second_player, presence: true
end
