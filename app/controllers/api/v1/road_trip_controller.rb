class Api::V1::RoadTripController < ApplicationController
  def create
  #   user = User.find(params[:api_key])
  #   origin = params[:origin]
  #   destination = params[:destination]

  #   mapquest_service = MapquestService.new
  #   # most likely need to convert travel time
  #   travel_time = mapquest_service.get_directions(origin, destination)[:route][:formatted_time]
  #   address = mapquest_service.get_geocode_address(destination)
  #   lat = address[:results].first[:locations].first[:latLng][:lat]
  #   lng = address[:results].first[:locations].first[:latLng][:lng]
  #   weather_data = OpenweatherService.new.get_weather_by_location(lat, lng)

  #   destination_forecast = Forecast.new(weather_data)

  #   user.road_trip.create(
  #     origin: origin,
  #     destination: destination,
  #     travel_time: travel_time,
  #     arrival_forecast: destination_forecast.current
  #   )
  # end
end