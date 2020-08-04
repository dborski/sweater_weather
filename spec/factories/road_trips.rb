FactoryBot.define do
  factory :road_trip do
    name { "MyString" }
    origin { "MyString" }
    destination { "MyString" }
    travel_time { "MyString" }
    arrival_temp { 1.5 }
    arrival_weather_desc { "MyString" }
    user { nil }
  end
end
