class Car < ActiveRecord::Base

  has_one :current_driver,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :car_id

  has_many :car_histories,
    class_name: 'CarHistory',
    primary_key: :id,
    foreign_key: :car_id

end
