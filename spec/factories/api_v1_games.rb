FactoryBot.define do
  factory :game, class: 'Api::V1::Game' do
    first_player {Faker::Name.unique.name}
    second_player {Faker::Name.unique.name}
    after(:create) do |game|
      FactoryBot.create(:deck, game: game)
    end
  end
end
