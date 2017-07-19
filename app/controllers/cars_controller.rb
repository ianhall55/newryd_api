class CarsController < ApplicationController
  def index
    @cars = Car.all
    render json: @cars
  end

  def show
    car_id = params[:car_id]

    if car_id
      @car = Car.find(car_id)
    else
      render json: { message: 'Need car id'}
    end

    if @car
      render json: @car
    else
      render json: { message: 'Car not found' }
    end
  end
end
