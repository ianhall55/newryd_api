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
  "message": "Logged in successfully",
  "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7ImlkIjoxLCJmaXJzdF9uYW1lIjoiaWFuIiwibGFzdF9uYW1lIjoiaGFsbCIsImVtYWlsIjoiaWFuQHRlc3QuY29tIiwicGhvbmVfbnVtYmVyIjoiMTExMTExMTExMSIsInVzZXJfdHlwZSI6ImFkbWluIn0sImV4cCI6MTQ5NzQwNDU0Nn0.ceW5u7ZDiATTUESuNoRmfKROUNllqjC32DC7ZpS4lUM"
}
```

# Logout

to log user out, remove auth token from local storage and throw away
