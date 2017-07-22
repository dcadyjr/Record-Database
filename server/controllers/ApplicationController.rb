class ApplicationController < Sinatra::Base

	options '*' do
	    response['Access-Control-Allow-Headers'] = 'content-type'
	    response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
	    response['Access-Control-Allow-Origin'] = '*'
	    200
	end


	before do 


		content_type :json	

	end


end
