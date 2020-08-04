class Api::V1::BaseController < ApplicationController
  include ServicesHelper
  protect_from_forgery prepend: true

  def register_success(user)
    render json: UserSerializer.new(user)
  end

  def register_failure(user)
    msg = { body: user.errors.full_messages.to_sentence, status: 400 }
    render json: msg
  end

  def login_success(user)
    session[:user_id] = user.id
    render json: UserSerializer.new(user)
  end

  def login_failure
    msg = { body: 'Credentials Invalid', status: 400 }
    render json: msg
  end

  def authorized_user?(user)
    user && road_trip_params[:api_key]
  end

  def road_trip_success(user)
    road_trip = RoadTripCreator.new(user, road_trip_params).create_road_trip
    options = { include: [:user], fields: { user: [:api_key] } }
    render json: RoadTripSerializer.new(road_trip, options)
  end

  def road_trip_failure
    msg = { body: 'Unauthorized', status: 401 }
    render json: msg
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def road_trip_params
    params.permit(:api_key, :origin, :destination)
  end
end
