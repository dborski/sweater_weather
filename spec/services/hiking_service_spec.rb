require 'rails_helper'

describe 'Hiking Project API', :vcr do
  before(:each) do
    lat = 39.738453
    lon = -104.984853

    hiking = HikingService.new
    @trails = hiking.get_trails(lat, lon)
  end

  it 'sends list of trails nearby for given lat and lon' do
    expect(@trails[:results]).to be_a(Array)
    expect(@trails[:results].first[:locations].first[:latLng]).to have_key(:lat)
    expect(@trails[:results].first[:locations].first[:latLng]).to have_key(:lng)
  end
end