module GeoCodeable
  def get_coords(location)
    address = MapquestService.new.get_geocode_address(location)
    {
      lat: address[:results].first[:locations].first[:latLng][:lat],
      lng: address[:results].first[:locations].first[:latLng][:lng]
    }
  end 

  def get_geocoded_weather(location)
    coords = get_coords(location)
    weather_data = OpenweatherService.new.get_weather_by_location(coords[:lat], coords[:lng])
  end 
end 