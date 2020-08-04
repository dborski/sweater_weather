require 'rails_helper'

describe 'Road Trip API' do
  before(:each) do
    @user1 = create(:user)
  end

  it 'sends road trip data including origin, destination, travel time, and arrival forecast', :vcr do
    body = {
      origin: 'Denver,CO',
      destination: 'Pueblo,CO',
      api_key: @user1.api_key
    }

    post '/api/v1/road_trip', params: body

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip[:data]).to have_key(:type)
    expect(road_trip[:data]).to have_key(:id)
    expect(road_trip[:data][:attributes][:origin]).to eq(body[:origin])
    expect(road_trip[:data][:attributes][:destination]).to eq(body[:destination])
    expect(road_trip[:data][:attributes]).to have_key(:arrival_forecast)
  end
end