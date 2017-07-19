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

# User Price Tier
to update the price tier for a user, returns updated auth_token 

type: PUT

address: /users/price_tier

params: price_tier_id in body and auth token in Authorization header

sample response:
```json
{
  "message": "Update successful",
  "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7ImlkIjoxLCJmaXJzdF9uYW1lIjoiSWFuIiwibGFzdF9uYW1lIjoiSGFsbCIsImVtYWlsIjoiaWFuQHRlc3QuY29tIiwicGhvbmVfbnVtYmVyIjoiMTExMTExMTExMSIsInVzZXJfdHlwZSI6ImFkbWluIiwicHJpY2VfdGllciI6eyJpZCI6Mywic3RhcnRfcHJpY2UiOiI5MDAuMCIsImVuZF9wcmljZSI6IjEzOTkuMCIsImRlc2NyaXB0aW9uIjoiVGllciAxIn19LCJleHAiOjE1MDEwNDMyMzR9.VOud04Pb12tvYxeCGiACHxEc7fpoxlHb2D03n1SpXLs"
}
```

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

# Car Rentals

# Create rental request

to create a rental request

type: POST

address: /car_rentals

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

# Pending Rentals
returns all pending future rentals for user

type: GET

address: /car_rentals/pending

params: jwt in auth header

Successful response
```text
same as confirmed
```

# Confirm Rental
confirms a pending rental request,
can use to confirm rental or just to update car for rental

type: POST

address: /car_rentals/confirm

params: rental_id, car_id

successful response
```json
{
  "message": "Rental confirmed!",
  "rental": {
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
    "car_type": {
      "id": 3,
      "name": "Family",
      "description": "Large, spacious cars. Great for large groups"
    },
    "car_class": {
      "id": 3,
      "name": "Sports car",
      "description": null
    },
    "price_tier": {
      "id": 3,
      "description": "Tier 1",
      "start_price": "900.0",
      "end_price": "1399.0"
    },
    "status": "confirmed",
    "rental_start_date": "2017-07-28T20:55:51.401Z"
  }
}
```

# Upcoming rentals

# all
returns all pending rentals and future confirmed rentals

type: GET

address: /upcoming_rentals/all

params: jwt in auth header

Successful response
```json
{
  "pending": [
    {
      "id": 3,
      "car": null,
      "car_type": {
        "id": 3,
        "name": "Family",
        "description": "Large, spacious cars. Great for large groups"
      },
      "car_class": {
        "id": 3,
        "name": "Sports car",
        "description": null
      },
      "price_tier": {
        "id": 3,
        "description": "Tier 1",
        "start_price": "900.0",
        "end_price": "1399.0"
      },
      "status": "pending",
      "rental_start_date": "2017-07-28T20:55:51.401Z"
    }
  ],
  "confirmed": [
    {
      "id": 2,
      "car": {
        "id": 2,
        "make": "Toyota",
        "model": "Corolla",
        "vin": "67890",
        "year": "2010",
        "color": "blue",
        "license_plate": "xyz890",
        "mileage": 85000,
        "type_id": 2
      },
      "car_type": {
        "id": 2,
        "name": "Adventure",
        "description": "Perfect car for a weekend getaway"
      },
      "car_class": {
        "id": 2,
        "name": "Coupe",
        "description": null
      },
      "price_tier": {
        "id": 2,
        "description": "Tier 1",
        "start_price": "750.0",
        "end_price": "899.0"
      },
      "status": "confirmed",
      "rental_start_date": "2017-07-18T20:55:51.398Z"
    }
  ]
}
```

# Confirmed
returns all confirmed future rentals for user,
confirmed rentals should have car attached

type: GET

address: /upcoming_rentals/confirmed

params: jwt in auth header

Successful response
```json
[
  {
    "id": 2,
    "car": {
      "id": 2,
      "make": "Toyota",
      "model": "Corolla",
      "vin": "67890",
      "year": "2010",
      "color": "blue",
      "license_plate": "xyz890",
      "mileage": 85000,
      "type_id": 2
    },
    "car_type": {
      "id": 2,
      "name": "Adventure",
      "description": "Perfect car for a weekend getaway"
    },
    "car_class": {
      "id": 2,
      "name": "Coupe",
      "description": null
    },
    "price_tier": {
      "id": 2,
      "description": "Tier 1",
      "start_price": "750.0",
      "end_price": "899.0"
    },
    "status": "confirmed",
    "rental_start_date": "2017-07-18T20:55:51.398Z"
  }
]
```

# Braintree Payments

# Client Token
to get client token

type: GET

address: /client_token

params: none

Successful response
```text
eyJ2ZXJzaW9uIjoyLCJhdXRob3JpemF0aW9uRmluZ2VycHJpbnQiOiI4YTQyODE1ZTI5YjJkZjI5YzVlM2I4YTU5MDM1MzdiZmZkYmExYWRlMTRiZGU0ODJjMGNkYzc5YWJjZmI4MzQ3fGNyZWF0ZWRfYXQ9MjAxNy0wNy0wMVQyMjo1NTozNy41MTY1NDY1OTUrMDAwMFx1MDAyNm1lcmNoYW50X2lkPXI5N21ieWM5NnBkYmpyc3lcdTAwMjZwdWJsaWNfa2V5PXEyOTI1NXBydm12Yms3YjkiLCJjb25maWdVcmwiOiJodHRwczovL2FwaS5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tOjQ0My9tZXJjaGFudHMvcjk3bWJ5Yzk2cGRianJzeS9jbGllbnRfYXBpL3YxL2NvbmZpZ3VyYXRpb24iLCJjaGFsbGVuZ2VzIjpbXSwiZW52aXJvbm1lbnQiOiJzYW5kYm94IiwiY2xpZW50QXBpVXJsIjoiaHR0cHM6Ly9hcGkuc2FuZGJveC5icmFpbnRyZWVnYXRld2F5LmNvbTo0NDMvbWVyY2hhbnRzL3I5N21ieWM5NnBkYmpyc3kvY2xpZW50X2FwaSIsImFzc2V0c1VybCI6Imh0dHBzOi8vYXNzZXRzLmJyYWludHJlZWdhdGV3YXkuY29tIiwiYXV0aFVybCI6Imh0dHBzOi8vYXV0aC52ZW5tby5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tIiwiYW5hbHl0aWNzIjp7InVybCI6Imh0dHBzOi8vY2xpZW50LWFuYWx5dGljcy5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tL3I5N21ieWM5NnBkYmpyc3kifSwidGhyZWVEU2VjdXJlRW5hYmxlZCI6dHJ1ZSwicGF5cGFsRW5hYmxlZCI6dHJ1ZSwicGF5cGFsIjp7ImRpc3BsYXlOYW1lIjoiTmV3UnlkIiwiY2xpZW50SWQiOm51bGwsInByaXZhY3lVcmwiOiJodHRwOi8vZXhhbXBsZS5jb20vcHAiLCJ1c2VyQWdyZWVtZW50VXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3RvcyIsImJhc2VVcmwiOiJodHRwczovL2Fzc2V0cy5icmFpbnRyZWVnYXRld2F5LmNvbSIsImFzc2V0c1VybCI6Imh0dHBzOi8vY2hlY2tvdXQucGF5cGFsLmNvbSIsImRpcmVjdEJhc2VVcmwiOm51bGwsImFsbG93SHR0cCI6dHJ1ZSwiZW52aXJvbm1lbnROb05ldHdvcmsiOnRydWUsImVudmlyb25tZW50Ijoib2ZmbGluZSIsInVudmV0dGVkTWVyY2hhbnQiOmZhbHNlLCJicmFpbnRyZWVDbGllbnRJZCI6Im1hc3RlcmNsaWVudDMiLCJiaWxsaW5nQWdyZWVtZW50c0VuYWJsZWQiOnRydWUsIm1lcmNoYW50QWNjb3VudElkIjoibmV3cnlkIiwiY3VycmVuY3lJc29Db2RlIjoiVVNEIn0sImNvaW5iYXNlRW5hYmxlZCI6ZmFsc2UsIm1lcmNoYW50SWQiOiJyOTdtYnljOTZwZGJqcnN5IiwidmVubW8iOiJvZmYifQ==
```

# Process Checkout
to process payment

type: POST

address: /process_checkout

params: payment_method_nonce, amount

sample response:
```json
{
  "message": "Payment accepted!"
}
```
