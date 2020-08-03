require 'rails_helper'

describe 'Hiking parser' do
  it 'can parse trails', :vcr do
    lat = 39.738453
    lon = -104.984853

    parser = TrailParser.new
    trails = parser.get_trails(lat, lon)

    expect(trails.first[:name]).to eq('Boulder Skyline Traverse')
    expect(trails.first[:summary]).to eq('The classic long mountain route in Boulder.')
    expect(trails.first[:difficulty]).to eq('black')
    expect(trails.first[:location]).to eq('Superior, Colorado')
  end
end
