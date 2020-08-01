require 'rails_helper'

describe 'OpenWeather API' do
  before(:each) do
    lat = 39.738453
    lon = -104.984853
    exclude = "minutely"

    weather = OpenweatherService.new
    @weather_data = weather.get_weather_by_location(lat, lon, exclude)
  end

  it 'sends current weather data' do
    
    expect(@weather_data[:current]).to be_a(Hash)
    expect(@weather_data[:current]).to have_key(:dt)
    expect(@weather_data[:current]).to have_key(:sunrise)
    expect(@weather_data[:current]).to have_key(:sunset)
    expect(@weather_data[:current]).to have_key(:temp)
    expect(@weather_data[:current]).to have_key(:feels_like)
    expect(@weather_data[:current]).to have_key(:pressure)
    expect(@weather_data[:current]).to have_key(:humidity)
    expect(@weather_data[:current]).to have_key(:dew_point)
    expect(@weather_data[:current]).to have_key(:uvi)
    expect(@weather_data[:current]).to have_key(:clouds)
    expect(@weather_data[:current]).to have_key(:visibility)
    expect(@weather_data[:current]).to have_key(:wind_speed)
    expect(@weather_data[:current]).to have_key(:wind_deg)
    # expect(@weather_data[:current]).to have_key(:wind_gust)
    expect(@weather_data[:current][:weather].first).to have_key(:id)
    expect(@weather_data[:current][:weather].first).to have_key(:main)
    expect(@weather_data[:current][:weather].first).to have_key(:description)
    expect(@weather_data[:current][:weather].first).to have_key(:icon)
  end

  it 'sends hourly weather data' do
    
    expect(@weather_data[:hourly]).to be_a(Array)
    expect(@weather_data[:hourly].first).to have_key(:dt)
    expect(@weather_data[:hourly].first).to have_key(:temp)
    expect(@weather_data[:hourly].first).to have_key(:feels_like)
    expect(@weather_data[:hourly].first).to have_key(:pressure)
    expect(@weather_data[:hourly].first).to have_key(:humidity)
    expect(@weather_data[:hourly].first).to have_key(:dew_point)
    expect(@weather_data[:hourly].first).to have_key(:clouds)
    expect(@weather_data[:hourly].first).to have_key(:visibility)
    expect(@weather_data[:hourly].first).to have_key(:wind_speed)
    expect(@weather_data[:hourly].first).to have_key(:wind_deg)
    expect(@weather_data[:hourly].first[:weather].first).to have_key(:id)
    expect(@weather_data[:hourly].first[:weather].first).to have_key(:main)
    expect(@weather_data[:hourly].first[:weather].first).to have_key(:description)
    expect(@weather_data[:hourly].first[:weather].first).to have_key(:icon)
  end

  it 'sends daily weather data' do
    
    expect(@weather_data[:daily]).to be_a(Array)
    expect(@weather_data[:daily].first).to have_key(:dt)
    expect(@weather_data[:daily].first).to have_key(:sunrise)
    expect(@weather_data[:daily].first).to have_key(:sunset)
    expect(@weather_data[:daily].first[:temp]).to have_key(:day)
    expect(@weather_data[:daily].first[:temp]).to have_key(:min)
    expect(@weather_data[:daily].first[:temp]).to have_key(:max)
    expect(@weather_data[:daily].first[:temp]).to have_key(:night)
    expect(@weather_data[:daily].first[:temp]).to have_key(:eve)
    expect(@weather_data[:daily].first[:temp]).to have_key(:morn)
    expect(@weather_data[:daily].first[:feels_like]).to have_key(:day)
    expect(@weather_data[:daily].first[:feels_like]).to have_key(:night)
    expect(@weather_data[:daily].first[:feels_like]).to have_key(:eve)
    expect(@weather_data[:daily].first[:feels_like]).to have_key(:morn)
    expect(@weather_data[:daily].first).to have_key(:pressure)
    expect(@weather_data[:daily].first).to have_key(:humidity)
    expect(@weather_data[:daily].first).to have_key(:dew_point)
    expect(@weather_data[:daily].first).to have_key(:wind_speed)
    expect(@weather_data[:daily].first).to have_key(:wind_deg)
    expect(@weather_data[:daily].first[:weather].first).to have_key(:id)
    expect(@weather_data[:daily].first[:weather].first).to have_key(:main)
    expect(@weather_data[:daily].first[:weather].first).to have_key(:description)
    expect(@weather_data[:daily].first[:weather].first).to have_key(:icon)
    expect(@weather_data[:daily].first).to have_key(:clouds)
    expect(@weather_data[:daily].first).to have_key(:pop)
    expect(@weather_data[:daily].first).to have_key(:rain)
    expect(@weather_data[:daily].first).to have_key(:uvi)
  end
end