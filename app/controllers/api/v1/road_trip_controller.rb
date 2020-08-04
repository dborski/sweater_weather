class Api::V1::RoadTripController < ApplicationController
  def create
  user_api_key = params[:api_key]
  origin = params[:origin]
  destination = params[:destination]

  road_trip = RoadTripCreator.new(user_api_key, origin, destination).create_road_trip
  # render json: RoadTripSerializer.new(road_trip)
  end
end