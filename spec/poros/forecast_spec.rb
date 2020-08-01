require 'rails_helper'

describe 'Forecast' do
  before(:each) do
    lat = 39.738453
    lon = -104.984853
    exclude = 'minutely'

    weather = OpenweatherService.new
    @weather_data = weather.get_weather_by_location(lat, lon, exclude)
    @forecast = Forecast.new(@weather_data)
  end

  it 'exists', :vcr do
    expect(@forecast).to be_a(Forecast)
  end

  it 'attributes', :vcr do
    expect(@forecast.timezone).to eq(@weather_data[:timezone])
    expect(@forecast.current).to eq(@weather_data[:current])
    expect(@forecast.hourly).to eq(@weather_data[:hourly])
    expect(@forecast.daily).to eq(@weather_data[:daily])
  end
end