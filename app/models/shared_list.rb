class SharedList < ActiveRecord::Base
	belongs_to :user
	belongs_to :friendship
	belongs_to :list

	before_create :already_shared

	private

	def already_shared
		@shared_lists = SharedList.where(:list_id => self.list_id)
								  .where(:friend_id => self.friend_id)
								  .where(:user_id => self.user_id)
		if @shared_lists.length > 0 
			return false
		else
			return true
		end
	end
end
