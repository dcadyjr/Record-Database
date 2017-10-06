require 'net/http'
require 'json'

class WishController < ApplicationController


	#get request to /wishes
	get '/' do
		token = params[:token]
		user = User.find_by(:token => token)
		wishes = user.wishes
		wishes.to_json
	end

	#get request to /wishes/id to get specific album info
	get '/:id' do
		id = params[:id]
		wish = Wish.find(id)
		{wish: wish}.to_json
	end


	#get request to albums/saveddetails to get details for each saved album
	get '/saveddetails' do
		request_body = JSON.parse(request.body.read)

	end

	# post request to /wishes to save a album to your collection
	post '/save' do
		response['Access-Control-Allow-Origin'] = '*'

		request_body = JSON.parse(request.body.read)
		token = params[:token]
		wish = Wish.new
		wish.artist = request_body["title"].split(%r{ -\s*})[0]
		wish.name = request_body["title"].split(%r{ -\s*})[1]
		wish.release_year = request_body["year"]
		wish.image_url = request_body["thumb"]
		wish.detail_url = 'https://api.discogs.com/masters/' + request_body["id"].to_s
		wish.discogs_id = request_body["id"]
		wish.save
		user = User.find_by(:token => token)
		user_wish = UsersWish.new(user_id: user.id, wish_id: wish.id)
		user_wish.save
		user.wishes.to_json

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
		response['Access-Control-Allow-Origin'] = '*'
		token = params[:token]
		user = User.find_by(:token => token)
	
		id = params[:id]
		album = Wish.find(id)
	

		user_wish = UsersWish.find_by(user_id: user.id, wish_id: wish.id)
		user_wish.destroy
		wishes = Wish.all
		user.wishes.to_json

	end


end