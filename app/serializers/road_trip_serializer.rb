class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :origin, :destination, :travel_time, :arrival_temp, :arrival_weather_desc

  attribute :updated_at do |trip|
    trip.updated_at.strftime("%c %:z")
  end 

  belongs_to :user
end
