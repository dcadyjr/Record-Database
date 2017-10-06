require 'bundler'
Bundler.require
require 'discogs-wrapper'

require './models/AlbumModel'
require './models/UserModel'
require './models/UsersRecordModel'
require './models/WishModel'
require './models/UsersWishModel'

require './controllers/ApplicationController'
require './controllers/AlbumController'
require './controllers/UserController'
require './controllers/WishController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	adapter: 'postgresql',
	database: 'record_collections'
	)

map('/users'){run UserController}
map('/albums'){run AlbumController}
map('/wishes'){run WishController}