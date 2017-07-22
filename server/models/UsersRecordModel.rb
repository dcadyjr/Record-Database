class UsersRecord < ActiveRecord::Base

	self.table_name = 'users_records'
	

	belongs_to :album
	belongs_to :user

end