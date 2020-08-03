class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    authenticate(user)
  end

  private

  def authenticate(user)
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UsersSerializer.new(user)
    else
      msg = { body: 'Credentials Invalid', status: 400 }
      render json: msg
    end
  end
end
