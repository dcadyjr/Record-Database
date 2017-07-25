
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
		
		#https://api.discogs.com/database/search?sort=score&f=json&q=%7B%22name%22%3D%3E%22Led+Zeppelin%22%7D&token=JXIHTcvmYrJmSxdOHTOOsynymapkXxGjhsikOWLm&sort_order=desc&per_page=10&type=release&page=19

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