class CarRentalsController < ApplicationController

  def request_rental
    @rental = CarRental.new(car_rental_params)

    if @rental.save
      render json: { message: "Rental request created!"}
    else
      render json: @rental.errors.full_messages
    end
  end

  def car_rental_params
    params
      .require(:car_rental)
      .permit(:type_id, :class_id, :price_tier_id, :rental_start_date)
  end

end
