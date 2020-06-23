class Api::V1::GamesController < ApplicationController
  before_action :initialize_deck, only: [:create_game]
  
  def create_game
  end
  def get_card_by_game
  end

  private
  def initialize_deck
    
  end
end
