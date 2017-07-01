# newryd_api

# User creation

post request to '/signup'

  sample request:

```javascript
  {
    "user": {
      "first_name": "first",
      "last_name": "last",
      "email": "test5@newryd.com",
      "phone_number": "5555555555",
      "password": "password",
      "user_type": "customer"
    }
  }
```

sample response:

```javascript
{
  "message": "Account created successfully",
  "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7ImlkIjoxMiwiZmlyc3RfbmFtZSI6ImZpcnN0IiwibGFzdF9uYW1lIjoibGFzdCIsImVtYWlsIjoidGVzdDhAbmV3cnlkLmNvbSIsInBob25lX251bWJlciI6Ijg4ODg4ODg4ODgiLCJ1c2VyX3R5cGUiOiJjdXN0b21lciJ9LCJleHAiOjE0OTc0MDUwNzN9.C6RjEQnbk7WBZtkp5D6NWFiH16fLaNEImYvOS3W7r7w"
}
```
store auth_token in local storage on device

put auth_token in 'Authorization' header to authenticate future requests

the token is divided into 3 sections, the middle section is the user info encoded in base64 format,
decode to access info,
can use https://jwt.io/ to see decoded token

# Login

post request to '/login'

can use email or phone_number and password in request

sample requests:

email
```javascript
{
    "user": {
	"email": "ian@test.com",
	"password": "password"
    }
}
```
phone_number
```javascript
{
    "user": {
	"phone_number": "1111111111",
	"password": "password"
    }
}
```
sample response:
```javascript
{
  "message": "Logged in successfully",
  "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7ImlkIjoxLCJmaXJzdF9uYW1lIjoiaWFuIiwibGFzdF9uYW1lIjoiaGFsbCIsImVtYWlsIjoiaWFuQHRlc3QuY29tIiwicGhvbmVfbnVtYmVyIjoiMTExMTExMTExMSIsInVzZXJfdHlwZSI6ImFkbWluIn0sImV4cCI6MTQ5NzQwNDU0Nn0.ceW5u7ZDiATTUESuNoRmfKROUNllqjC32DC7ZpS4lUM"
}
```

# Logout

to log user out, remove auth token from local storage and throw away

# Car History

to get the car history for a user

type: GET

address: /users/car_history

params: auth token in Authorization header

sample response:
```javascript
[
  {
    "id": 1,
    "car": {
      "id": 1,
      "make": "Honda",
      "model": "Civic",
      "vin": "12345",
      "year": "2004",
      "color": "red",
      "license_plate": "abc123",
      "mileage": 40000,
      "type_id": 1
    },
    "rental_start": "2017-06-19T05:28:55.761Z",
    "rental_finish": "2017-06-19T05:28:55.802Z",
    "current": false
  },
  {
    "id": 3,
    "car": {
      "id": 3,
      "make": "BMW",
      "model": "M3",
      "vin": "67890",
      "year": "2010",
      "color": "black",
      "license_plate": "xyz890",
      "mileage": 85000,
      "type_id": 1
    },
    "rental_start": "2017-06-19T05:28:55.798Z",
    "rental_finish": null,
    "current": true
  }
]
```

# Current car

to get current car for user

type: GET

address: /users/current_car

params: auth token in Authorization header

sample response:
```javascript
{
  "id": 3,
  "make": "BMW",
  "model": "M3",
  "vin": "67890",
  "year": "2010",
  "color": "black",
  "license_plate": "xyz890",
  "mileage": 85000,
  "type_id": 1
}
```

# Car Types

to get car types

type: GET

address: /cars/car_types

params: none

sample response:
```javascript
[
  {
    "id": 1,
    "name": "Luxury",
    "description": "The car you want when you have a special event\n    or are trying to impress someone"
  },
  {
    "id": 2,
    "name": "Adventure",
    "description": "Perfect car for a weekend getaway"
  },
  {
    "id": 3,
    "name": "Family",
    "description": "Large, spacious cars. Great for large groups"
  },
  {
    "id": 4,
    "name": "City",
    "description": "Smaller cars for navigating cities"
  }
]
```

# Car Classes

to get car classes

type: GET

address: /cars/car_classes

params: none

sample response:
```javascript
[
  {
    "id": 1,
    "name": "Sedan",
    "description": null
  },
  {
    "id": 2,
    "name": "Coupe",
    "description": null
  },
  {
    "id": 3,
    "name": "Sports car",
    "description": null
  },
  ...
]
```

# Price Tiers

to get car price tiers

type: GET

address: /cars/price_tiers

params: none

sample response:
```javascript
[
  {
    "id": 1,
    "description": "Tier 1",
    "start_price": "550.0",
    "end_price": "749.0"
  },
  {
    "id": 2,
    "description": "Tier 1",
    "start_price": "750.0",
    "end_price": "899.0"
  },
  {
    "id": 3,
    "description": "Tier 1",
    "start_price": "900.0",
    "end_price": "1399.0"
  },
  {
    "id": 4,
    "description": "Tier 1",
    "start_price": "1400.0",
    "end_price": "2000.0"
  }
]
```

# Car Rentals, create rental request
to create a rental request

type: GET

address: /cars/price_tiers

params: type_id, class_id, price_tier_id, rental_start_date
*** Logged in user must be activated! ***

sample request:
```json
{
  "car_rental": {
  	"type_id": 2,
  	"class_id": 2,
  	"price_tier_id": 2,
  	"rental_start_date": "2017-07-01 14:05:00 -0700"
  }
}
```
Successful response
```json
{
  "message": "Rental request created!"
}
```
