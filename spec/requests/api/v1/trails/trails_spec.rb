require 'rails_helper'

describe 'Trails API' do
  before(:each) do
    @location = 'denver,co'
    lat = 39.738453
    lon = -104.984853

    # exclude = 'minutely'

    # weather = OpenweatherService.new
    # @weather_data = weather.get_weather_by_location(lat, lon, exclude)
    # @forecast = Forecast.new(@weather_data)
    @trails = Trail.new(trail_data)
  end

  it 'sends trail info for nearby location', :vcr do
    get '/api/v1/trails?location=denver,co'

    expect(response).to be_successful

    trails = JSON.parse(response.body, symbolize_names: true)

    expect(trails[:data]).to have_key([:id])
    expect(trails[:data][:type]).to eq('trails')
    expect(trails[:data][:attributes][:location]).to eq(@location)
    expect(trails[:data][:attributes][:forecast[:summary]]).to eq()
    expect(trails[:data][:attributes][:forecast[:temperature]]).to eq()

    expect(trails[:data][:attributes][:trails]).to be_a(Array)
    expect(trails[:data][:attributes][:trails].first[:name]).to eq()
    expect(trails[:data][:attributes][:trails].first[:summary]).to eq()
    expect(trails[:data][:attributes][:trails].first[:difficulty]).to eq()
    expect(trails[:data][:attributes][:trails].first[:location]).to eq()
    expect(trails[:data][:attributes][:trails].first[:distance_to_trail]).to eq()
  end
end