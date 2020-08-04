class RoadTripCreator
  attr_reader :origin, :destination

  def initialize(user_key, origin, destination)
    @user_key = user_key
    @origin = origin
    @destination = destination
  end

  def user
    User.find_by(api_key: @user_key)
  end

  def forecast
    weather = get_weather(@destination)
    {
      temperature: weather[:current][:temp],
      summary: weather[:current][:weather].first[:description],
    }
  end

  def create_road_trip
    user.road_trips.create({
      origin: @origin,
      destination: @destination,
      travel_time: get_directions(@origin, @destination)[:route][:formattedTime],
      arrival_temp: forecast[:temperature],
      arrival_weather_desc: forecast[:summary],
    })
  end 
  
  private

  def get_weather(location)
    coordinates = get_coordinates(location)
    lat = coordinates[:results].first[:locations].first[:latLng][:lat]
    lng = coordinates[:results].first[:locations].first[:latLng][:lng]
    OpenweatherService.new.get_weather_by_location(lat, lng)
  end

  def get_coordinates(destination)
    MapquestService.new.get_geocode_address(destination)
  end

  def get_directions(from, to)
    MapquestService.new.get_directions(from, to)
  end

end 