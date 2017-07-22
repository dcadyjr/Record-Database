class UserController < ApplicationController

require 'SecureRandom'

	#post request to /users/register

	post '/register' do 

		user_details = JSON.parse(request.body.read)
		user = User.new

		user.email = user_details["email"]
		user.password = user_details["password"]
		user.screen_name = user_details["screen_name"]
		user.token = SecureRandom.hex
		
		user.save
		user.to_json
		
	end

	#post request to users/login
	post '/login' do

		user_details = JSON.parse(request.body.read)
		user = User.find_by({email: user_details["email"]})
		if user && user.authenticate(user_details["password"])
			user.to_json
			"success"
		else
			"ACCESS DENIED"
		end
	end
end