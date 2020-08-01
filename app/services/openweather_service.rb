class OpenweatherService 

  def get_weather_by_location(lat, lon, exclude)
    params = { lat: lat, lon: lon, exclude: exclude}

    get_json('onecall', params)
  end
  
  private

  def get_json(url, params)
    response = conn.get(url, params) do |request|
      request.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end

