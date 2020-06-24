require 'rails_helper'

RSpec.describe Api::V1::GamesController, type: :controller do
    let(:game){FactoryBot.create(:game)}

    describe '#create_game' do
      it 'returns created new game json' do
        get(:create_game, params: {game: {first_player: "Chandan Choubey", second_player: "Krum"}, format: :json})
        expect(JSON.parse(response.body)["first_player"]).to eql "Chandan Choubey"
      end

      it 'returns validation error for first_player and error code 422' do
        get(:create_game, params: {game: {first_player: "", second_player: "Krum"}, format: :json})
        expect(JSON.parse(response.body)).to eql "Validation failed: First player can't be blank"
        expect(response.code).to eql '422'
      end

      it 'returns validation error for second_player and error code 422' do
        get(:create_game, params: {game: {first_player: "Chandan Choubey", second_player: ""}, format: :json})
        expect(response.code).to eql '422'
      end

      it 'returns validation error for second_player and error code 422' do
        get(:create_game, params: {game: {first_player: "Chandan Choubey", second_player: ""}, format: :json})
        expect(response.code).to eql '422'
      end

      it 'returns error when empty params' do
        get(:create_game, params: {game: {}, format: :json})
        expect(JSON.parse(response.body)).to eql 'param is missing or the value is empty: game'
        expect(response.code).to eql '422'
      end
    end

    describe '#get_card_by_game' do
      it 'returns deleted card from deck' do
        get(:get_card_by_game, params: {id: game.id, format: :json})
        expect(JSON.parse(response.body)['id']).to be_a Numeric
      end

      it 'returns empty deck message' do
        game.deck.cards.delete_all
        get(:get_card_by_game, params: {id: game.id, format: :json})
        expect(JSON.parse(response.body)).to eql 'your deck got empty'
      end
    end

     describe '#compare_cards' do
      it 'returns bigger card' do
        get(:compare_cards, params: {id: game.id, cards: ["Jack of Spades", "11 of Hearts"], format: :json})
        expect(JSON.parse(response.body)["winner"]).to eql "11 of Hearts"
      end
      it 'returns card empty json message' do
        get(:compare_cards, params: {id: game.id, cards: [], format: :json})
        expect(JSON.parse(response.body)).to eql "your card array is empty"
      end
      it 'returns card contains empty string json message' do
        get(:compare_cards, params: {id: game.id, cards: ["", "11 of Hearts"], format: :json})
        expect(JSON.parse(response.body)).to eql "your card array contains empty string"
      end
    end
end
