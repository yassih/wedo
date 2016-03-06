class List < ActiveRecord::Base
	has_many :items
	has_many :shared_lists
	belongs_to :category
	belongs_to :user

	def start_time
		self.due_date
	end
end
