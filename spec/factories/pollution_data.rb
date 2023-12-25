FactoryBot.define do
  factory :pollution_datum do
    co { 1.5 }
    no { 1.5 }
    no2 { 1.5 }
    o3 { 1.5 }
    so2 { 1.5 }
    pm2_5 { 1.5 }
    pm10 { 1.5 }
    nh3 { 1.5 }
    dt { "" }
    index { 1 }
    city { nil }
  end
end
