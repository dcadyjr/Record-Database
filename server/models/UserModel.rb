class User < ActiveRecord::Base

	self.table_name = 'users'
	has_secure_password

	has_many :usersrecords, class_name: 'UsersRecord'
	has_many :albums, through: :usersrecords

	has_many :userswishes, class_name: 'UsersWish'
	has_many :wishes, through: :userswishes	

end
