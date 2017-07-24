require 'open-uri'

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



# You must be authenticated in order to search. I provide a few ways to do this. See the AUTHENTICATION section below.
		auth_wrapper = Discogs::Wrapper.new("My awesome web app", user_token: "JXIHTcvmYrJmSxdOHTOOsynymapkXxGjhsikOWLm")
		search       = auth_wrapper.search("OK Computer", :per_page => 10, :type => :release)

		search.to_json
		#search = open('https://api.discogs.com/database/search?q=Radiohead&key=qYjzXPborXKBFtCiHoRI&secret=YXHseigKePrhNhUyKhHMnBHdxhFmgfzh')


		
		# def authenticate
		# 	@discogs = Discogs::Wrapper.new("Test OAuth")
		# 	request_data = discogs.get_request_token('qYjzXPborXKBFtCiHoRI', 'YXHseigKePrhNhUyKhHMnBHdxhFmgfzh', 'http://172.20.0.160/callback')

		# 	session[:request_token] = request_data[:request_token]

		# 	redirect_to request_data[:authorize_url]
		# end

		# def callback
		# 	@discogs = @discogs = Discogs::Wrapper.new("Test OAuth")
		# 	request_token = session[:request_token]
		# 	verifier = params[:oauth_verifier]
		# 	access_token = @discogs.authenticate(request_token, verifier)

		# 	session[:request_token] = nil
		# 	session[:access_token] = access_token
		# end

		# def search
		# 	auth_wrapper = Discogs::Wrapper.new('record database', user_token: request_token)
		# 	search = auth_wrapper.search('Radiohead', :per_page => 10, :type => :artist)
			
		# 	return search.to_json
		# 	# results.to_json
		# end

		# 	# new_album = JSON.parse(request.body.read)
		# 	# new_album.to_json
		# end
		# # album = Album.new(new_album)
		# # album.save
		# # album.to_json

		# "success"
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