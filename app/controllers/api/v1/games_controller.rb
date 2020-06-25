module Api
  module V1
    # GamesController is used to Games related changes
    class GamesController < ApplicationController
      before_action :initialize_deck, only: [:create_game]
      before_action :set_game, only: [:show_card_by_game]

      # create_game will create the game with two player
      # initilize deck and card classes
      def create_game
        if @game.persisted?
          render status: :created, json: @game
        else
          render :json => @game.error, :status => :unprocessable_entity
        end
      end

      # show_card_by_game will delete and return top card  from deck
      def show_card_by_game
        game = @game.try(:deck)
        cards = JSON.parse(game)
        if cards['cards'].present?
          deleted_card = cards['cards'].pop
          @game.update(deck: cards.to_json)
          render json: deleted_card
        else
          # If Cards is empty for the game, then game should be deleted
          render json: 'your deck got empty'.to_json
        end
      end

      # compare_cards will compare two cards and will return winner
      def compare_cards
        cards = params[:cards]
        if cards.present?
          if cards.any?(&:blank?)
            render json: 'your card array contains empty string'.to_json
          else
            render json: { winner: compare_and_return_card(cards) }
          end
        else
          render json: 'your card array is empty'.to_json
        end
      end

      private

      # initialize_deck will initialize deck and card classes
      def initialize_deck
        @game = Api::V1::Game.create!(game_params)
        @game.update(deck: Api::V1::Deck.new.to_json)
      rescue ActiveRecord::RecordInvalid => e
        render :json => e, :status => :unprocessable_entity
      end

      # game_params will restrict other params to create game
      # strong params
      def game_params
        params.require(:game).permit(:first_player, :second_player)
      end

      # set_game It will retrieve the game by id
      def set_game
        @game = Api::V1::Game.find_by(id: params[:id])
      end
    end
  end
end
