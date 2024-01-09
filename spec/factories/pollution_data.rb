FactoryBot.define do
  factory :pollution_datum do
    carbon_monoxide { 1.5 }
    nitric_oxide { 1.5 }
    nitrogen_dioxide { 1.5 }
    ozone { 1.5 }
    sulfur_dioxide { 1.5 }
    particulate_matter_2_5 { 1.5 }
    particulate_matter_10 { 1.5 }
    ammonia { 1.5 }
    timestamp { Time.now.to_i }
    data_index { 1 }
    association :city, factory: :city
  end
end
