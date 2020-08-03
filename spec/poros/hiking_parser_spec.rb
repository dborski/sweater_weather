require 'rails_helper'

describe 'Hiking parser' do
  it 'can parse trails', :vcr do
    parser = HikingParser.new
    trails = parser.get_trails

    expect(trails.first[:name]).to eq('Boulder Skyline Traverse')

    # expect(trails[:data][:attributes][:trails]).to be_a(Array)
    # expect(trails[:data][:attributes][:trails].first[:name]).to eq('Boulder Skyline Traverse')
    # expect(trails[:data][:attributes][:trails].first[:summary]).to eq('The classic long mountain route in Boulder.')
    # expect(trails[:data][:attributes][:trails].first[:difficulty]).to eq('black')
    # expect(trails[:data][:attributes][:trails].first[:location]).to eq('Superior, Colorado')
    # expect(trails[:data][:attributes][:trails].first[:distance_to_trail]).to eq(23.008)
  end
end