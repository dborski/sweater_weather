require 'rails_helper'

describe 'Weather API' do
  before(:each) do
    lat = 39.738453
    lon = -104.984853
    exclude = 'minutely'

    weather = OpenweatherService.new
    @weather_data = weather.get_weather_by_location(lat, lon, exclude)
    @forecast = Forecast.new(@weather_data)
  end

  it 'sends current weather forecast', :vcr do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast[:data][:attributes][:timezone]).to eq(@forecast.timezone)
    expect(forecast[:data][:attributes][:hourly]).to eq(@forecast.hourly)
    expect(forecast[:data][:attributes][:current]).to eq(@forecast.current)
    expect(forecast[:data][:attributes][:daily]).to eq(@forecast.daily)
  end
end