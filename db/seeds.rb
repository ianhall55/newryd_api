# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Price tiers

@price_tier1 = PriceTier.create!(
  description: 'Tier 1',
  start_price: 550.0,
  end_price: 749.0
)
@price_tier2 = PriceTier.create!(
  description: 'Tier 2',
  start_price: 750.0,
  end_price: 899.0
)
@price_tier3 = PriceTier.create!(
  description: 'Tier 3',
  start_price: 900.0,
  end_price: 1399.0
)
@price_tier4 = PriceTier.create!(
  description: 'Tier 4',
  start_price: 1400.0,
  end_price: 2000.0
)

# Users

@user1 = User.create!(
  phone_number: '1111111111',
  email: 'ian@test.com',
  password: 'password',
  first_name: 'Ian',
  last_name: 'Hall',
  user_type: 'admin',
  activated: true,
  price_tier_id: @price_tier1.id
)

@user2 = User.create!(
  phone_number: '2222222222',
  email: 'alex@test.com',
  password: 'password',
  first_name: 'Alex',
  last_name: 'Mattson',
  user_type: 'admin',
  price_tier_id: @price_tier2.id
)

# car types
@car_type1 = CarType.create!(
  name: 'Luxury',
  description: 'The car you want when you have a special event or are trying to impress someone'
)

@car_type2 = CarType.create!(
  name: 'Adventure',
  description: 'Perfect car for a weekend getaway'
)

@car_type3 = CarType.create!(
  name: 'Family',
  description: 'Large, spacious cars. Great for large groups'
)

@car_type4 = CarType.create!(
  name: 'City',
  description: 'Smaller cars for navigating cities'
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
  type_id:          @car_type1.id
)

@car2 = Car.create!(
  make:             'Toyota',
  model:            'Corolla',
  vin:              '67890',
  year:             '2010',
  color:            'blue',
  license_plate:    'xyz890',
  mileage:          85000,
  type_id:          @car_type2.id
)

@car3 = Car.create!(
  make:             'BMW',
  model:            'M3',
  vin:              '67890',
  year:             '2010',
  color:            'black',
  license_plate:    'xyz890',
  mileage:          85000,
  type_id:          @car_type3.id
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
  rental_start: 30.days.ago,
  rental_finish: 20.days.ago,
  current: false
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
  rental_start: 15.days.ago,
  rental_finish: nil,
  current: true
)


# car classes
@car_class1 = CarClass.create!(name: 'Sedan')
@car_class2 = CarClass.create!(name: 'Coupe')
@car_class3 = CarClass.create!(name: 'Sports car')
@car_class4 = CarClass.create!(name: 'Hatchback')
@car_class5 = CarClass.create!(name: 'Van')
@car_class6 = CarClass.create!(name: 'Truck')
@car_class7 = CarClass.create!(name: 'Compact')

# Car rental test

@car_rental1 = CarRental.create!(
  user_id: @user1.id,
  car_id: @car1.id,
  type_id: @car_type1.id,
  class_id: @car_class1.id,
  price_tier_id: @price_tier1.id,
  status: 'completed',
  confirmed: true,
  rental_start_date: 30.days.ago,
  rental_start_date: 20.days.ago
)

@car_rental2 = CarRental.create!(
  user_id: @user1.id,
  car_id: @car2.id,
  type_id: @car_type2.id,
  class_id: @car_class2.id,
  price_tier_id: @price_tier2.id,
  status: 'confirmed',
  confirmed: true,
  rental_start_date: 10.days.from_now
)

@car_rental3 = CarRental.create!(
  user_id: @user1.id,
  type_id: @car_type3.id,
  class_id: @car_class3.id,
  price_tier_id: @price_tier3.id,
  status: 'pending',
  confirmed: false,
  rental_start_date: 20.days.from_now
)
