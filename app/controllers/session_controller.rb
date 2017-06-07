class SessionController < ApplicationController

  skip_before_action :authorize_request, only: [:authenticate, :destroy]

  # return auth token once user is authenticated
  def authenticate
    authenticated_user =
      AuthenticateUser.new(auth_params[:email], auth_params[:phone_number], auth_params[:password]).call
    response = { message: Message.successful_login, user: UserSerializer.new(authenticated_user) }
    json_response(response)
  end

  def destroy
		@user = current_user
    debugger
		if @user
			logout(@user)
			render json: @user
		else
			render(
        json: ["Nobody signed in"],
        status: 404
      )
		end
	end

  private

  def auth_params
    params.require(:user).permit(:email, :phone_number, :password)
  end
end
