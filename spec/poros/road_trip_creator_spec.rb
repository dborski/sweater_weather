require 'rails_helper'

describe 'RoadTrip' do
  before(:each) do
    @user = create(:user)
    @origin = 'Denver,CO'
    @destination = 'Pueblo,CO'

    @rt_creator = RoadTripCreator.new(@user.api_key, @origin, @destination)

    # @road_trip = RoadTrip.last
  end

  it 'exists', :vcr do
    expect(@rt_creator).to be_a(RoadTripCreator)
  end

  it 'attributes', :vcr do
    expect(@rt_creator.origin).to eq(@origin)
    expect(@rt_creator.destination).to eq(@destination)
  end 

  it 'Creates a user road_trip', :vcr do
    expect(@user.road_trips.first.origin).to eq(@origin)
    expect(@user.road_trips.first.destination).to eq(@desintation)
    expect(@user.road_trips.first.travel_time).to_not eq(nil)
    expect(@user.road_trips.first.arrival_temp).to_not eq(nil)
    expect(@user.road_trips.first.arrival_weather_desc).to_not eq(nil)
  end
end