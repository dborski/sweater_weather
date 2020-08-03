require 'rails_helper'

describe 'Trails API' do
  before(:each) do
    @location = 'denver,co'

    @trails = Trail.new(@location)
  end

  it 'sends trail info for nearby location', :vcr do
    get '/api/v1/trails?location=denver,co'

    expect(response).to be_successful

    trails = JSON.parse(response.body, symbolize_names: true)

    expect(trails[:data][:type]).to eq('trail')
    expect(trails[:data][:attributes][:location]).to eq(@location)
    # expect(trails[:data][:attributes][:forecast[:summary]]).to eq('clear sky')
    # expect(trails[:data][:attributes][:forecast[:temperature]]).to eq(72.77)

    expect(trails[:data][:attributes][:trails]).to be_a(Array)
    expect(trails[:data][:attributes][:trails].first[:name]).to eq('Boulder Skyline Traverse')
    expect(trails[:data][:attributes][:trails].first[:summary]).to eq('The classic long mountain route in Boulder.')
    expect(trails[:data][:attributes][:trails].first[:difficulty]).to eq('black')
    expect(trails[:data][:attributes][:trails].first[:location]).to eq('Superior, Colorado')
    expect(trails[:data][:attributes][:trails].first[:distance_to_trail]).to eq(23.008)
  end
end