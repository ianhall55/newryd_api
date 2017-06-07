class AuthenticationController < ApplicationController

  skip_before_action :authorize_request, only: :login

  # return auth token once user is authenticated
  def login
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:phone_number], auth_params[:password]).call
    response = { message: Message.successful_login, auth_token: auth_token }
    json_response(response)
  end

  private

  def auth_params
    params.require(:user).permit(:email, :phone_number, :password)
  end
end
