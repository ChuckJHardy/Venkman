# Venkman [![Build Status](https://travis-ci.org/ChuckJHardy/Venkman.png)](https://travis-ci.org/ChuckJHardy/Venkman) [![Coverage Status](https://coveralls.io/repos/ChuckJHardy/Venkman/badge.png?branch=master)](https://coveralls.io/r/ChuckJHardy/Venkman) [![Code Climate](https://codeclimate.com/github/ChuckJHardy/Venkman.png)](https://codeclimate.com/github/ChuckJHardy/Venkman) [![Dependency Status](https://gemnasium.com/ChuckJHardy/Venkman.png)](https://gemnasium.com/ChuckJhardy/Venkman)

Retreive, parse, process, filter and assign emails from a Gmail account to a user, available for access through an API. A User has many Messages which are received from a Gmail account using the [Gmailish Gem](https://rubygems.org/gems/gmailish). This application was build using [Agile](http://agilemanifesto.org/principles.html), [Minimum Viable Product](http://en.wikipedia.org/wiki/Lean_Startup#Minimum_viable_product) and [Test Driven Development](http://en.wikipedia.org/wiki/Test-driven_development) principles.

## Usage

* [Create a User](#create_user)
* [Get a User](#get_a_user)
* [Update a User](#update_a_user)
* [Delete a User](#delete_a_user)
* [Get Messages](#get_messages)
* [Get a Message](#get_a_message)
* [Delete a Message](#delete_a_message)

#### [Create a User](id:create_user)
	# Route
	POST v1/users
	
	# Required Parameters
	[email, password, password_confirmation]
	
	# Body
	user[email]=chuckjhardy%40venkman-app.com&user[password]=ABC123789&user[password_confirmation]=ABC123789
	
	# Status
	201 Created
	
	# Response
	{
  		"user": {
    		"authentication_token": "DkrZ8BzppQAVpC59pGHj",
    		"email": "chuckjhardy@venkman-app.com",
    		"id": 1
  		}
	}
	
#### [Get a User](id:get_a_user)
	# Route
	GET v1/users/:id
	
	# Required Parameters
	[auth_token]
	
	# Query Parameter
	auth_token: eKgSzpK3KC4pSkhxYybG
	
	# Status
	200 OK
	
	# Response
	{
  		"user": {
    		"authentication_token": "DkrZ8BzppQAVpC59pGHj",
    		"email": "chuckjhardy@venkman-app.com",
    		"id": 1
  		}
	}
	
#### [Update a User](id:update_a_user)
	
	# Route
	PUT v1/users/:id
	
	# Required Parameters
	[auth_token]
	
	# Body
	auth_token=TqCjxhL3MMMj7g7GV8NV&user[email]=chuck%40venkman-app.com
	
	# Status
	204 No Content
	
	# Response
	{}
	
#### [Delete a User](id:delete_a_user)
	
	# Route
	DELETE v1/users/:id
	
	# Required Parameters
	[auth_token]
	
	# Body
	auth_token=TqCjxhL3MMMj7g7GV8NV
	
	# Status
	204 No Content
	
	# Response
	{}
	
#### [Get Messages](id:get_messages)
	# Route
	GET v1/users/:user_id/messages
	
	# Required Parameters
	[auth_token]
	
	# Query Parameter
	auth_token: eKgSzpK3KC4pSkhxYybG
	
	# Status
	200 OK
	
	# Response
    [
      {
        "message": {
          "body": "Lorem Ipsum is simply dummy text of the printing and typesetting.",
          "created_at": "2013-03-31T12:27:48Z",
          "id": 1,
          "subject": "Through the Looking Glass",
          "updated_at": "2013-03-31T12:27:48Z",
          "user_id": 1
        }
      }
    ]
    
#### [Get a Messages](id:get_a_message)
	# Route
	GET v1/users/:user_id/messages/:id
	
	# Required Parameters
	[auth_token]
	
	# Query Parameter
	auth_token: eKgSzpK3KC4pSkhxYybG
	
	# Status
	200 OK
	
	# Response
    {
      "message": {
        "body": "Lorem Ipsum is simply dummy text of the printing and typesetting.",
        "created_at": "2013-03-31T12:27:48Z",
        "id": 1,
        "subject": "Through the Looking Glass",
        "updated_at": "2013-03-31T12:27:48Z",
        "user_id": 1
      }
    }
    
#### [Delete a Messages](id:delete_a_message)
	# Route
	DELETE v1/users/:user_id/messages/:id
	
	# Required Parameters
	[auth_token]
	
	# Query Parameter
	auth_token: eKgSzpK3KC4pSkhxYybG
	
	# Status
	204 No Content
	
	# Response
    {}


## Contributing [![Maintained Status](http://stillmaintained.com/ChuckJHardy/Venkman.png)](http://stillmaintained.com/ChuckJHardy/Venkman)

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request