class CarRentalsController < ApplicationController
  def request_rental
    @rental = CarRental.new(car_rental_params)
    @rental.user_id = set_current_user

    if @rental.errors.messages.present? || !@rental.save
      render json: @rental.errors.full_messages
    else
      render json: { message: "Rental request created!"}
    end
  end

  def confirm_rental
    @rental = CarRental.find(params[:rental_id])
    @car = Car.find(params[:car_id])

    # TODO: add logic to check if car is reserved

    if @rental.present? && @car.present?
      @rental.confirm!(@car)
      render json: { message: "Rental confirmed!", rental: CarRentalSerializer.new(@rental) }
    else
      render json: { message: "Invalid car or rental, rental not confirmed" }
    end
  end

  def rentals_pending
    @rentals = CarRental.for_user(current_user.id).pending
    if @rentals.present?
      render json: @rentals
    else
      render json: { message: "No pending rentals" }
    end
  end

  def upcoming_rentals_all
    @upcoming_rentals = CarRental.for_user(current_user.id).upcoming(Time.now)

    if @upcoming_rentals.present?
      render json: @upcoming_rentals
    else
      render json: { message: "No upcoming rentals" }
    end
  end

  def upcoming_rentals_confirmed
    @rentals = CarRental.for_user(current_user.id).upcoming(Time.now).confirmed
    if @rentals.present?
      render json: @rentals
    else
      render json: { message: "No upcoming rentals" }
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

  def serialize_rentals(rentals)
    rentals.map { |rental| CarRentalSerializer.new(rental) }
  end
end
