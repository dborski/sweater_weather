class Api::V1::ForecastController < ActionController::API
  def index
    address = MapquestService.new.get_geocode_address(params[:location])
    lat = address[:results].first[:locations].first[:latLng][:lat]
    lng = address[:results].first[:locations].first[:latLng][:lng]
    weather_data = OpenweatherService.new.get_weather_by_location(lat, lng)

    render json: ForecastSerializer.new(Forecast.new(weather_data))
  end 
end