class RoadTripCreator
  attr_reader :origin, :destination

  def initialize(road_trip_info)
    @user_key = road_trip_info[:api_key]
    @origin = road_trip_info[:origin]
    @destination = road_trip_info[:destination]
  end

  def user
    User.find_by(api_key: @user_key)
  end

  def get_forecast
    weather = get_weather(@destination)
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
    user.road_trips.create({
      name: name_generator,
      origin: @origin,
      destination: @destination,
      travel_time: get_directions(@origin, @destination)[:route][:formattedTime],
      arrival_temp: forecast[:temperature],
      arrival_weather_desc: forecast[:summary]
    })
  end

  private

  def get_weather(location)
    coordinates = get_coordinates(location)
    lat = coordinates[:results].first[:locations].first[:latLng][:lat]
    lng = coordinates[:results].first[:locations].first[:latLng][:lng]
    OpenweatherService.new.get_weather_by_location(lat, lng)
  end

  def get_coordinates(location)
    MapquestService.new.get_geocode_address(location)
  end

  def get_directions(origin, destination)
    MapquestService.new.get_directions(origin, destination)
  end
end
