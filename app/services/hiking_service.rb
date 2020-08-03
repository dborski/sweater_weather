class HikingService < BaseService
  def initialize
    @base_url = 'https://www.hikingproject.com/data/'
    @hiking_key = ENV['HIKING_API_KEY']
  end

  def get_trails(lat, lon)
    params = { key: @hiking_key, lat: lat, lon: lon }

    get_json(@base_url, 'get-trails', params)
  end
end
