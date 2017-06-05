class SessionsController < ApplicationController

  def create
    phone_number = params[:user][:phone_number]
    email = params[:user][:email]
    if phone_number
  		@user = User.find_by_creds_phone(
        phone_number,
        params[:user][:password]
      )
    elsif email
      @user = User.find_by_creds_email(
        email,
        params[:user][:password]
      )
    else
      render(
        json: ["Must provide email or phone number"],
        status: 401
      )
      return
    end

    if @user
			login(@user)
			render json: @user
		else
			render(
        json: ["Invalid username/password combination"],
        status: 401
      )
		end
	end

	def destroy
		@user = current_user
		if @user
			logout(@user)
			render :partial => "users/show"
		else
			render(
        json: ["Nobody signed in"],
        status: 404
      )
		end
	end
end
