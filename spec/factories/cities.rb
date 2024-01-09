FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    country { Faker::Address.country }
    state { Faker::Address.state }
  end
end
