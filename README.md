# newryd_api

# User creation

post request to '/signup'

  sample request:

```json
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

```json
{
  "message": "Account created successfully",
  "user": {
    "id": 9,
    "first_name": "first",
    "last_name": "last",
    "email": "test5@newryd.com",
    "phone_number": "5555555555",
    "session_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE0OTczMjc4NTh9.4JRhvI9r62sa6gFl9IRqAmOVvVFJh0Z6ytsGPQrvbGk",
    "user_type": "customer"
  }
}
```

put session_token in 'Authorization' header to authenticate future requests

# Login

post request to '/login'

can use email or phone_number and password in request

sample requests:
```json
{
	"user": {
		"email": "ian@test.com",
		"password": "password"
	}
}

{
	"user": {
		"phone_number": "1111111111",
		"password": "password"
	}
}
```
sample response:
```json
{
  "id": 1,
  "first_name": "ian",
  "last_name": "hall",
  "email": "ian@test.com",
  "phone_number": "1111111111",
  "session_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0OTczMjgxODB9.wKUvRRFhPyjDutpSCErZbBTSVN4l3avRzrODGk5uEak",
  "user_type": "admin"
}
```
