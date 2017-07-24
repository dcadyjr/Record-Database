
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
		puts "#{new_search}"

		auth_wrapper = Discogs::Wrapper.new("My awesome web app", user_token: "JXIHTcvmYrJmSxdOHTOOsynymapkXxGjhsikOWLm")
		search       = auth_wrapper.search("#{new_search}", :per_page => 10, :type => :release)

		search.to_json
		

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