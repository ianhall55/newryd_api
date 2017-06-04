class UsersController < ApplicationController

  def index
    User.all
  end

  def show
    User.find(params[:user_id])

  end


end
