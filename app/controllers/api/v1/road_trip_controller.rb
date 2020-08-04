class Api::V1::RoadTripController < Api::V1::BaseController
  def create
    user = User.find_by(api_key: road_trip_params[:api_key])
    authorized_user?(user) ? road_trip_success(user) : road_trip_failure
  end
end
