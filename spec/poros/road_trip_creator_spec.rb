require 'rails_helper'

describe 'RoadTrip' do
  before(:each) do
    @user = create(:user)
    @origin = 'Denver,CO'
    @destination = 'Pueblo,CO'

    @rt_creator = RoadTripCreator.new({
                                        api_key: @user.api_key,
                                        origin: @origin,
                                        destination: @destination
                                      })
  end

  it 'exists', :vcr do
    expect(@rt_creator).to be_a(RoadTripCreator)
  end

  it 'attributes', :vcr do
    expect(@rt_creator.origin).to eq(@origin)
    expect(@rt_creator.destination).to eq(@destination)
  end

  it 'Can get a forecast for the destination', :vcr do
    expect(@rt_creator.get_forecast).to have_key(:temperature)
    expect(@rt_creator.get_forecast).to have_key(:summary)
  end

  it 'Can create a name for the road_trip', :vcr do
    expect(@rt_creator.name_generator).to eq("Road Trip from #{@origin} to #{@destination}")
  end

  it 'Creates a user road_trip', :vcr do
    @rt_creator.create_road_trip

    expect(@user.road_trips.first.origin).to eq(@origin)
    expect(@user.road_trips.first.destination).to eq(@destination)
    expect(@user.road_trips.first.travel_time).to_not eq(nil)
    expect(@user.road_trips.first.arrival_temp).to_not eq(nil)
    expect(@user.road_trips.first.arrival_weather_desc).to_not eq(nil)
  end
end
