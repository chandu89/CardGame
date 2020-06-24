FactoryBot.define do
  factory :deck, class: 'Api::V1::Deck' do
    after(:create) do |deck|
      FactoryBot.create_list(:card, 1, deck: deck)
    end
  end
end
