class Trail
  attr_reader :id, :location

  def initialize(location)
    @location = location
  end

  def forecast
    weather = get_weather(location)
    {
      summary: weather[:current][:weather].first[:description]
      temperature: weather[:current][:temp]
    }
  end 

  def trails

  end 



  private

  def get_weather(location)
    coordinates = get_coordinates(location))
    lat = address[:results].first[:locations].first[:latLng][:lat]
    lng = address[:results].first[:locations].first[:latLng][:lng]
    OpenWeatherService.new.get_weather_by_location(lat, lng)
  end 

  def get_coordinates(location)
    MapquestService.new.get_geocode_address(location)
  end

  def get_trails(location)
    coordinates = get_coordinates(location))
    lat = address[:results].first[:locations].first[:latLng][:lat]
    lng = address[:results].first[:locations].first[:latLng][:lng]
    HikingService.new.get_trails(lat, lng)
  end 
end 
