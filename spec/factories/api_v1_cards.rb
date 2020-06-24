FactoryBot.define do
  factory :card, class: 'Api::V1::Card' do
    rank {Faker::Name.unique.name}
    suit {Faker::Name.unique.name}
  end
end
