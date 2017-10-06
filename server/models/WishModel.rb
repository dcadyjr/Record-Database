class Wish < ActiveRecord::Base

	self.table_name = 'wishes'

	has_many :userswishes, class_name: 'UsersWish'
	has_many :users, through: :userswishes

end