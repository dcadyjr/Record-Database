require 'net/http'
require 'json'

class AlbumController < ApplicationController


	#get request to /albums
	get '/' do 
		albums = Album.all
		albums.to_json
	end

	#get request to /albums/id to get specific album info
	get '/:id' do
		id = params[:id]
		album = Album.find(id)
		{album: album}.to_json
	end

	#post request to /albums. saves a new album to the users account
	post '/' do
		new_search = JSON.parse(request.body.read)
		

		auth_wrapper = Discogs::Wrapper.new("My awesome web app", user_token: "JXIHTcvmYrJmSxdOHTOOsynymapkXxGjhsikOWLm")
		search       = auth_wrapper.search(new_search["name"], :per_page => 10, :type => "master", :sort =>  "score", :sort_order => "desc")
		
		search.to_json
		
	end

	get '/details/:id' do

		id = params[:id]
		url = 'https://api.discogs.com/masters/' + id
		uri = URI(url)

		response = Net::HTTP.get(uri)
		results = JSON.parse(response)

		results.to_json

	end

	post '/save' do
		response['Access-Control-Allow-Origin'] = '*'

		request_body = JSON.parse(request.body.read)
		album = Album.new(request_body)
		album.save
		Album.all.to_json

	end


	patch '/:id' do

		id = params[:id]
		album = Album.find(id)
		updated_album = JSON.parse(request.body.read)
		album.update_attributes(updated_album)
		album.save
		album.to_json

		"success"
	end

	delete '/:id' do

		id = params[:id]
		album = Album.find(id)
		album.destroy
		albums = Album.all
		albums.to_json

		"success"
	end


end