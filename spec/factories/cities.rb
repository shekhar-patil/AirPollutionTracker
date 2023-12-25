FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
    country { Faker::Address.country }
    state { Faker::Address.state }
  end
end
