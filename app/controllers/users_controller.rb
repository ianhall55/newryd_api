class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      auth_token = AuthenticateUser.new(@user.email, @user.phone_number, @user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      json_response(response, :created)
    else
      render json: @user.errors.full_messages
    end
  end

	private

	def user_params
		params
      .require(:user)
      .permit(:first_name, :last_name, :email, :phone_number, :password, :user_type)
	end

end
