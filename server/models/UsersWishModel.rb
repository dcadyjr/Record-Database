class UsersWish < ActiveRecord::Base

	self.table_name = 'users_wishes'
	
	belongs_to :wish
	belongs_to :user

end