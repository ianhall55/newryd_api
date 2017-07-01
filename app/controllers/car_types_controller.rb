class CarTypesController < ApplicationController

  skip_before_action :authorize_request, only: :index

  def index
    @car_types = CarType.all
    render json: @car_types
  end

end
