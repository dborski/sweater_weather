require 'rails_helper'

describe 'MapQuest API' do
  before(:each) do
    location = 'denver,co'

    mapquest = MapquestService.new
    @geocode_address = mapquest.get_geocode_address(location)
  end

  it 'sends geocode address for given city and state' do
    
    expect(@geocode_address[:results]).to be_a(Array)
    expect(@geocode_address[:results].first[:locations].first[:latLng]).to have_key(:lat)
    expect(@geocode_address[:results].first[:locations].first[:latLng]).to have_key(:lng)
  end
end