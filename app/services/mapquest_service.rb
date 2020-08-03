class MapquestService < BaseService
  def initialize
    @base_url = 'http://www.mapquestapi.com/geocoding/v1/'
    @directions_url = 'http://www.mapquestapi.com/directions/v2/'
    @mapquest_key = ENV['MAPQUEST_API_KEY']
  end

  def get_geocode_address(location)
    params = { key: @mapquest_key, location: location }

    get_json(@base_url, 'address', params)
  end

  def get_directions(from_address, to_address)
    params = { key: @mapquest_key, from: from_address, to: to_address }

    get_json(@directions_url,'route', params)
  end
end
