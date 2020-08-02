class Api::V1::UsersController < ApplicationController
  protect_from_forgery prepend: true

  def create
    user = User.new(user_params)
    if user.save && passwords_match?
      render json: UsersSerializer.new(user)
    else
      msg = { body: user.errors.full_messages.to_sentence, status: 400 }
      render json: msg
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def passwords_match?
    params[:password] == params[:password_confirmation]
  end
end
