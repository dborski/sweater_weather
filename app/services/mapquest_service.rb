class MapquestService 

  def get_geocode_address(location)
    params = { location: location}

    get_json('address', params)
  end
  
  private

  def get_json(url, params)
    response = conn.get(url, params) do |request|
      request.params['key'] = ENV['MAPQUEST_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end