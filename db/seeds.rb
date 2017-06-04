# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.create!(
  phone_number: '1111111111',
  email: 'ian@test.com',
  password: 'password',
  first_name: 'ian',
  last_name: 'hall',
  user_type: 'admin',
  car_id: 1
)
