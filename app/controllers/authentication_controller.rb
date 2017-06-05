# require 'auth/authenticate_user'

class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:phone_number], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.require(:user).permit(:email, :phone_number, :password)
  end
end
