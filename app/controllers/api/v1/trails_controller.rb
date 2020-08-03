class Api::V1::TrailsController < ApplicationController
  def index
    # address = MapquestService.new.get_geocode_address(params[:location])
    # lat = address[:results].first[:locations].first[:latLng][:lat]
    # lng = address[:results].first[:locations].first[:latLng][:lng]
    # weather_data = OpenweatherService.new.get_weather_by_location(lat, lng)

    # trails = HikingService.new.get_trails(lat, lon)

    # trail = Trail.new(
    #   location: params[:location],
    #   forecast: Forecast.new(weather_data).current,
    #   trails: trails
    # )

    trails = Trail.new(params[:location])
    render json: TrailSerializer.new(trails)
  end
end