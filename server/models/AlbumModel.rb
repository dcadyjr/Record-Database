class Album < ActiveRecord::Base

	self.table_name = 'albums'

	has_many :usersrecords, class_name: 'UsersRecord'
	has_many :users, through: :usersrecords

end
