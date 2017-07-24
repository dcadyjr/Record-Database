class ApplicationController < Sinatra::Base

	options '*' do
	    response['Access-Control-Allow-Headers'] = 'content-type'
	    response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
	    response['Access-Control-Allow-Origin'] = '*'
	    200
	end


	 before do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json 

		path = request.fullpath.split("?")[0]


		if ['users/login', '/users/register'].include?(path) || request.request_method == 'OPTIONS'
			pass
		end
		content_type :json
		token = params[:token]
		user = User.find_by(token: token).to_json
		
		if user
			pass
		else
			halt 403
		end	
	end
end
