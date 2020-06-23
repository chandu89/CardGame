class Api::V1::Game < ApplicationRecord
  def create_deck
    Api::V1::Deck.new
  end
end
