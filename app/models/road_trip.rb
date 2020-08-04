class RoadTrip < ApplicationRecord
  include ServicesHelper

  belongs_to :user

  after_find do |trip|
    weather = get_geocoded_weather(destination)
    trip.travel_time = get_directions(origin, destination)[:route][:formattedTime],
    trip.arrival_temp = weather[:current][:temp],
    trip.arrival_weather_desc = weather[:current][:weather].first[:description]
  end 
end
