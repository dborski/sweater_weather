require 'rails_helper'

describe 'RoadTrip' do
  before(:each) do
    @user = create(:user)
    @origin = 'Denver,CO'
    @destination = 'Pueblo,CO'

    @road_trip = RoadTripCreator.new(@user.api_key, @origin, @destination)
  end

  it 'exists', :vcr do
    expect(@road_trip).to be_a(RoadTripCreator)
  end

  it 'attributes', :vcr do
    expect(@road_trip.origin).to eq(@origin)
    expect(@road_trip.destination).to eq(@destination)
    expect(@road_trip.travel_time).to_not eq(nil)
    expect(@road_trip.arrival_forecast).to_not eq(nil)
  end
end