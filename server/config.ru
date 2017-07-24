require 'bundler'
Bundler.require
require 'discogs-wrapper'

require './models/AlbumModel'
require './models/UserModel'
require './models/UsersRecordModel'

require './controllers/ApplicationController'
require './controllers/AlbumController'
require './controllers/UserController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	adapter: 'postgresql',
	database: 'record_collections'
	)

map('/users'){run UserController}
map('/albums'){run AlbumController}