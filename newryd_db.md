# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
phone_number    | string    | not null, indexed, unique
email           | string    | not null, indexed, unique
password_digest | string    | not null
first_name	    | string    | not null
last_name	 	| string    | not null
session_token   | string    | not null, indexed, unique
car_id			| integer	| foreign key (references cars), indexed

probably better to have a cars table that has a full record of the cars history with a boolean to the current?

pricing_package ?

credit_card ? -> this is going to be integrated with braintree to handle all the transactions.

## locations
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
address     | string    | not null
name	   	| string    | not null
instructions| string    |
user_id     | integer   | not null, foreign key (references users), indexed

## cars
column name      | data type | details
-----------------|-----------|-----------------------
id               | integer   | not null, primary key
color            | string    | not null
make	         | string    | not null
model            | string    | not null
vin	             | string    | not null
license_plate    | string    | not null
Mileage			 | integer	 | not null
type_id			 | integer   | not null, foreign key (references types), indexed

## Insurance

column name      | data type | details
-----------------|-----------|-----------------------
id               | integer   | not null, primary key
name_insured   	 | string    | not null
company          | string    | not null
issued           | string    | not null
expiration       | string    | not null
policy_number    | string    | not null
car_id		     | string    | not null, foreign key (references cars), indexed

company should reference an insurnace companies table?

name_insured could by more that one person?



Ratings:
Car_id
User_id
Question_id
Rating

Questions:
Question

Flip requests:
Day
Time
Location_id
User_id
Upgrade
Comment
Type_id

Type:
Name
Description

Stats to track
Mileage driven
Number of flips
Total value of cars
Brands driven


https://developers.google.com/maps/documentation/geocoding/start
