class List < ActiveRecord::Base
	has_many :items
	belongs_to :category

	def start_time
		self.due_date
	end
end
