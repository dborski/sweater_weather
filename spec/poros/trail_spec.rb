require 'rails_helper'

describe 'Trail' do
  before(:each) do
    @location = 'denver,co'
    @trail = Trail.new(location)
  end

  it 'exists', :vcr do
    expect(@trail).to be_a(Trail)
  end

  it 'attributes', :vcr do
    expect(@trail.location).to eq(@location)
    
    expect(@trail.forecast[:summary]).to eq('clear sky')
    expect(@trail.forecast[:temperature]).to eq('70.52')


    expect(@trail.trails.first[:name]).to eq('Boulder Skyline Traverse')
    expect(@trail.trails.first[:summary]).to eq('The classic long mountain route in Boulder.')
    expect(@trail.trails.first[:dfficulty]).to eq('black')
    expect(@trail.trails.first[:location]).to eq('Superior, Colorado')
    expect(@trail.trails.first[:distance_to_trail]).to eq("23.008")
  end
end