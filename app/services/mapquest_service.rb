class MapquestService < BaseService

  def initialize
    @base_url = 'http://www.mapquestapi.com/geocoding/v1/'
    @mapquest_key = ENV['MAPQUEST_API_KEY']
  end

  def get_geocode_address(location)
    params = { key: @mapquest_key, location: location }

    get_json(@base_url, 'address', params)
  end
end
