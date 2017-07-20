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

  def update_price_tier
    if current_user.update_price_tier(params[:price_tier_id])
      auth_token =
        JsonWebToken.encode(user: current_user.to_json)
      render json: { message: "Update successful", auth_token: auth_token }
    else
      render json: { message: "Price Tier update failed" }
    end
  end

  def current_car
    @car = current_user.current_car
    if @car
      render json: @car
    else
      render json: { message: 'User does not currently have a rental car' }
    end
  end

  def car_history
    @car_histories = current_user.car_histories.includes(:car)
    if @car_histories
      render json: @car_histories
    else
      render json: { message: 'User does not have any previous rentals' }
    end
  end

	private

	def user_params
		params
      .require(:user)
      .permit(:first_name, :last_name, :email, :phone_number, :password, :user_type, :price_tier_id, :car_id)
	end
end
