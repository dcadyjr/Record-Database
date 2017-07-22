class UsersRecord < ActiveRecord::Base

	self.table_name = 'users_records'
	has_secure_password

	belongs_to :album
	belongs_to :user

end