# class SessionsController < ApplicationController
#
#   def create
# 		@user = User.find_by_creds(
#       email: params[:user][:email],
#       phone_number: params[:user][:phone_number],
#       password: params[:user][:password]
#     )
#
#     auth_token =
#       AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
#     json_response(auth_token: auth_token)
#
#     if @user
# 			login(@user)
# 			render json: @user
# 		else
# 			render(
#         json: ["Invalid username/password combination"],
#         status: 401
#       )
# 		end
# 	end
#
# 	def destroy
# 		@user = current_user
#
# 		if @user
# 			logout(@user)
# 			render json: @user
# 		else
# 			render(
#         json: ["Nobody signed in"],
#         status: 404
#       )
# 		end
# 	end
# end
