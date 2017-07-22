class User < ActiveRecord::Base

	self.table_name = 'users'

	has_many :usersrecords, class_name: 'UsersRecord'
	has_many :album, through: :usersrecords

end
