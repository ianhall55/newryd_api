class CarRentalsController < ApplicationController

  def request_rental
    @rental = CarRental.new(car_rental_params)
    @rental.user_id = set_current_user

    debugger
    if @rental.errors.messages.present? || !@rental.save
      render json: @rental.errors.full_messages
    else
      render json: { message: "Rental request created!"}
    end
  end

  private

  def set_current_user
    if current_user && current_user.activated
      return current_user.id
    else
      @rental.errors.add(:user, "User must be logged in and activated")
    end
  end

  def car_rental_params
    params
      .require(:car_rental)
      .permit(:type_id, :class_id, :price_tier_id, :rental_start_date)
  end

end
