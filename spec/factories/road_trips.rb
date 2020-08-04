FactoryBot.define do
  factory :road_trip do
    name { '' }
    origin { '' }
    destination { '' }
    travel_time { '' }
    arrival_temp { 1.5 }
    arrival_weather_desc { '' }
    user { nil }
  end
end
