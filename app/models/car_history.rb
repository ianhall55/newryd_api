class CarHistory < ActiveRecord::Base

  belongs_to :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :car,
    class_name: 'Car',
    primary_key: :id,
    foreign_key: :car_id

  before_create :update_previous_car_history
  after_create :update_current_user

  def update_previous_car_history
    previous_history = user.car_histories.last
    if previous_history
      previous_history.update_attributes(current: false)
      previous_history.update_attributes(rental_finish: Time.now) if previous_history.rental_finish.nil?
    end
  end

  def update_current_user
    user.update_attributes!(car_id: car.id)
  end

end
