class OpenweatherService < BaseService
  def initialize
    @base_url = 'https://api.openweathermap.org/data/2.5/'
    @openweather_key = ENV['OPEN_WEATHER_API_KEY']
  end

  def get_weather_by_location(lat, lon, exclude)
    params = { appid: @openweather_key, lat: lat, lon: lon, exclude: exclude }

    get_json(@base_url, 'onecall', params)
  end
end
