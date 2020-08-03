class Api::V1::TrailsController < ApplicationController
  def index
    
    trails = Trail.new(params[:location])
    render json: TrailSerializer.new(trails)
  end
end