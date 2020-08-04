class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :origin, :destination, :travel_time, :arrival_temp, :arrival_weather_desc

  belongs_to :user
end
