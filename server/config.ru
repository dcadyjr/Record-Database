require 'bundler'
Bundler.reguire

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	adapter: 'postgresql',
	database: 'products'
	)

