class Forecast
  attr_reader :id, :timezone, :current, :hourly, :daily

  def initialize(weather_data)
    @timezone = weather_data[:timezone]
    @current = weather_data[:current]
    @hourly = weather_data[:hourly]
    @daily = weather_data[:daily]
  end
end 