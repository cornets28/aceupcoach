## Coach Appointment API (AceUp Tech Assessment Project)

This is a Ruby on Rails API Backend that feeds the coaches' appointments app. It is an avenue for the front-end app built with React.js to send and receive data from the backend. User authentication, model associations, and validations are embedded in this API.

## Features 
- Model associations implemented.
- CRUD implementation for registrations route.
- CRUD implementation for appointments route.
- CRUD implementation for coaches route.
- POST and GET routes for sessions route. 
- Data presence validations for User, CoachInstructor, and Appointment models.
- Unique validations for email and username.

## Built With
- Ruby v3.2.2
- Rails v7.1.3.2
- bcrypt
- SQLite
### Tested With
TBD

## ENDPOINTS SUMMARY

| Method   |        Endpoint              | Public |       Action                       |
|:--------:|:----------------------------:|:------:|:----------------------------------:|
|  POST    | /api/v1/registrations        | True   |Register a new user                 |
|  POST    | /api/v1/login                | True   |Login registered user               |
|  GET     | /api/v1/coach_instructors    | False  |Fetch all coaches                   | 
|  POST     | /api/v1/coach_instructors   | False  |Create a Coach's                    |
|  POST    | /api/v1/appointments         | False  |Create appointments                 |
|  GET     | /api/v1/appointments/id      | False  |Fetch booked appointments for a user|
|  DELETE  | /api/v1/appointments/id      | False  |Deletes an appointment for a user   |
|  PATCH   | /api/v1/appointments/id      | False  |Edit an appointment for a user      |


## Project SetUp (Reproduce project on local computer)

Get a local copy of the file. Clone with HTTPS using the command below.

```
git clone git@github.com:cornets28/aceupcoach.git
```
## Access project folders 
```
cd aceupcoach
```
## Install all the dependencies
```
bundle install
```

## Move to the develop branch
```
git fetch origin
```

```
git checkout develop
```


## Create the database with the following command
```
rails db:create
```
## Migrate the database with the following command
```
rails db:migrate
```

## Register as a client
```
{
    "full_name": "John Doe",
    "username": "Client1",
    "email": "client1@test.com",
    "password": "332222222",
    "phone_number": "4434344343",
    "address": "New York city",
}
```

## Register as an administrator
```
{
    "full_name": "John Doe",
    "username": "Client2",
    "email": "client2@test.com",
    "password": "332222222",
    "phone_number": "4434344343",
    "address": "New York City",
    "role": "admin"
}
```

## Login with your email address
```
{
    "username": "Client2",
    "password": "332222222"
}
```
## Add coach if your are an admin user
```
{
    "full_name": "Coach1",
    "email": "coach1@test.com",
    "picture": "www.sam933239.com",
    "phone_number": "212233333",
    "location": "New York City",
    "years_of_experience": 3
}
```

## Schedule an appointment with a coach
```
{
    "coach_instructor_id": 2,
    "appointment_start_date": "2024-12-25T17:00:00",
    "duration": 60,
    "location": "Some location",
    "coach_name": "Some coach"
}
```

## Testing

### Type rspec in the project root to run tests.
```
rspec
```

## Run the server
  ```rails server```


## Author

👤 **Samuel Cornet**
- Github: [@cornets28](https://github.com/cornets28)

