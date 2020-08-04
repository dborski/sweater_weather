require 'rails_helper'

describe 'MapQuest API', :vcr do
  before(:each) do
    location = 'denver,co'

    from = 'denver,co'
    to = 'boulder,co'

    mapquest = MapquestService.new
    @geocode_address = mapquest.get_geocode_address(location)
    @directions = mapquest.get_directions(from, to)
  end

  it 'sends geocode address for given city and state' do
    expect(@geocode_address[:results]).to be_a(Array)
    expect(@geocode_address[:results].first[:locations].first[:latLng]).to have_key(:lat)
    expect(@geocode_address[:results].first[:locations].first[:latLng]).to have_key(:lng)
  end

  it 'sends directions given the from and to locations' do
    expect(@directions[:route]).to be_a(Hash)
    expect(@directions[:route]).to have_key(:distance)
  end
end