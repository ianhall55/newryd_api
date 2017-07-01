class CarClassesController < ApplicationController

  skip_before_action :authorize_request, only: :index

  def index
    @car_classes = CarClass.all
    render json: @car_classes
  end

end
