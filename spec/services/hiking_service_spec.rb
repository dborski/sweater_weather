require 'rails_helper'

describe 'Hiking Project API', :vcr do
  before(:each) do
    lat = 39.738453
    lon = -104.984853

    hiking = HikingService.new
    @trails = hiking.get_trails(lat, lon)
  end

  it 'sends list of trails nearby for given lat and lon' do
    expect(@trails[:trails]).to be_a(Array)
    expect(@trails[:trails].first).to have_key(:id)
    expect(@trails[:trails].first).to have_key(:name)
    expect(@trails[:trails].first).to have_key(:summary)
    expect(@trails[:trails].first).to have_key(:difficulty)
    expect(@trails[:trails].first).to have_key(:location)
  end
end
