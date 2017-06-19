# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




@user1 = User.create!(
  phone_number: '1111111111',
  email: 'ian@test.com',
  password: 'password',
  first_name: 'Ian',
  last_name: 'Hall',
  user_type: 'admin'
)

@user2 = User.create!(
  phone_number: '2222222222',
  email: 'alex@test.com',
  password: 'password',
  first_name: 'Alex',
  last_name: 'Mattson',
  user_type: 'admin'
)

# create_table "cars"
#   t.string  "make",          null: false
#   t.string  "model",         null: false
#   t.string  "vin",           null: false
#   t.string  "year",          null: false
#   t.string  "color",         null: false
#   t.string  "license_plate", null: false
#   t.integer "mileage",       null: false
#   t.integer "type_id",       null: false
#   t.index ["type_id"], name: "index_cars_on_type_id", using: :btree
# end


@car1 = Car.create!(
  make:             'Honda',
  model:            'Civic',
  vin:              '12345',
  year:             '2004',
  color:            'red',
  license_plate:    'abc123',
  mileage:          40000,
  type_id:          @user1.id
)

@car2 = Car.create!(
  make:             'Toyota',
  model:            'Corolla',
  vin:              '67890',
  year:             '2010',
  color:            'blue',
  license_plate:    'xyz890',
  mileage:          85000,
  type_id:          @user2.id
)

@car3 = Car.create!(
  make:             'BMW',
  model:            'M3',
  vin:              '67890',
  year:             '2010',
  color:            'black',
  license_plate:    'xyz890',
  mileage:          85000,
  type_id:          @user1.id
)


# create_table "car_history", force: :cascade do |t|
#   t.integer  "user_id",                       null: false
#   t.integer  "car_id",                        null: false
#   t.datetime "rental_start",                  null: false
#   t.datetime "rental_finish"
#   t.boolean  "current",       default: false, null: false
#   t.index ["car_id"], name: "index_car_history_on_car_id", using: :btree
#   t.index ["user_id"], name: "index_car_history_on_user_id", using: :btree
# end

@car_history1 = CarHistory.create!(
  user_id: @user1.id,
  car_id: @car1.id,
  rental_start: Time.now,
  rental_finish: nil,
  current: true
)

@car_history2 = CarHistory.create!(
  user_id: @user2.id,
  car_id: @car2.id,
  rental_start: Time.now,
  rental_finish: nil,
  current: true
)

@car_history3 = CarHistory.create!(
  user_id: @user1.id,
  car_id: @car3.id,
  rental_start: Time.now,
  rental_finish: nil,
  current: true
)
