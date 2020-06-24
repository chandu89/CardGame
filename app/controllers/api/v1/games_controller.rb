class Api::V1::GamesController < ApplicationController
  before_action :initialize_deck, only: [:create_game]
  before_action :set_game, only: [:get_card_by_game]

  def create_game
    if @game.persisted?
      render status: :created, json: @game
    else
      render :json => @game.error, :status => :unprocessable_entity
    end
  end

  def get_card_by_game
    render json: @game.deck.present? && @game.deck.cards.present? ? @game.deck.cards.first.delete : "your deck got empty".to_json
  end

  def compare_cards
    cards = params[:cards]
    if cards.present?
      response = cards.first.empty? || cards.last.empty? ? "your card array contains empty string".to_json : {winner: compare_and_return_card(params[:cards])}
    else
      response = "your card array is empty".to_json
    end
    render json: response 
  end

  private

  def initialize_deck
    begin
      @game = Api::V1::Game.create!(game_params)
      cards = (0..51).to_a.shuffle.collect { |id| Api::V1::Card.create(rank: RANKS[id % 13], suit: SUITS[id % 4]) }
      deck = Api::V1::Deck.new(game_id: @game.id)
      deck.cards << cards
      deck.save!
    rescue => e
      render :json => e, :status => :unprocessable_entity
    end
  end
  def game_params
    params.require(:game).permit(:first_player, :second_player)
  end
  def set_game
    @game = Api::V1::Game.find_by_id params[:id]
  end
end
