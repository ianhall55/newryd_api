class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def index
    @users = User.all
    render json: @users
  end

  def create
    user = User.create!(user_params)
    authenticated_user = AuthenticateUser.new(user.email, user.phone_number, user.password).call
    response = { message: Message.account_created, user: UserSerializer.new(authenticated_user) }
    json_response(response, :created)
  end

	private

	def user_params
		params
      .require(:user)
      .permit(:first_name, :last_name, :email, :phone_number, :password, :user_type)
	end

end
