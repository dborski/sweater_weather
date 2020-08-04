class Api::V1::ForecastController < Api::V1::BaseController
  def index
    weather_data = get_geocoded_weather(params[:location])
    render json: ForecastSerializer.new(Forecast.new(weather_data))
  end
end
