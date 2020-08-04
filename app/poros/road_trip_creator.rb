class RoadTripCreator
  include ServicesHelper

  attr_reader :origin, :destination

  def initialize(user, road_trip_info)
    @user = user
    @origin = road_trip_info[:origin]
    @destination = road_trip_info[:destination]
  end

  def get_forecast
    weather = get_geocoded_weather(@destination)
    {
      temperature: weather[:current][:temp],
      summary: weather[:current][:weather].first[:description]
    }
  end

  def name_generator
    "Road Trip from #{@origin} to #{@destination}"
  end

  def create_road_trip
    forecast = get_forecast
    @user.road_trips.create({
      name: name_generator,
      origin: @origin,
      destination: @destination,
      travel_time: get_directions(@origin, @destination)[:route][:formattedTime],
      arrival_temp: forecast[:temperature],
      arrival_weather_desc: forecast[:summary]
    })
  end
end
