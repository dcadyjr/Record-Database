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
		puts search
		search.to_json
		
	end

	#get request to /albums/details/id to get the details for each album in the search
	get '/details/:id' do

		id = params[:id]
		url = 'https://api.discogs.com/masters/' + id + '?token=JXIHTcvmYrJmSxdOHTOOsynymapkXxGjhsikOWLm'
		uri = URI(url)

		response = Net::HTTP.get(uri)
		results = JSON.parse(response)

		results.to_json

	end

	#get request to albums/saveddetails to get details for each saved album
	get '/saveddetails' do
		request_body = JSON.parse(request.body.read)

	end

	# post request to /albums to save a album to your collection
	post '/save' do
		response['Access-Control-Allow-Origin'] = '*'

		request_body = JSON.parse(request.body.read)
		
		album = Album.new
		album.artist = request_body["title"].split(%r{ -\s*})[0]
		album.name = request_body["title"].split(%r{ -\s*})[1]
		album.release_year = request_body["year"]
		album.image_url = request_body["thumb"]
		album.detail_url = 'https://api.discogs.com/masters/' + request_body["id"].to_s
		album.discogs_id = request_body["id"]
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

	end

	# delete request to albums/id to delete an album from your collection
	delete '/:id' do

		id = params[:id]
		album = Album.find(id)
		album.destroy
		albums = Album.all
		albums.to_json

	end


end