FactoryBot.define do
  factory :game, class: 'Api::V1::Game' do
    first_player {Faker::Name.unique.name}
    second_player {Faker::Name.unique.name}
    deck {Api::V1::Deck.new.to_json}
  end
end
