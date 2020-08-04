class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: road_trip_params[:api_key])

    if authorized_user?(user)
      road_trip = RoadTripCreator.new(user, road_trip_params).create_road_trip
      options = { include: [:user], fields: { user: [:api_key] } }
      render json: RoadTripSerializer.new(road_trip, options)
    else
      msg = { body: 'Unauthorized', status: 401 }
      render json: msg
    end
  end

  private

  def authorized_user?(user)
    user && road_trip_params[:api_key]
  end

  def road_trip_params
    params.permit(:api_key, :origin, :destination)
  end
end
