class SharedList < ActiveRecord::Base
	belongs_to :user
	belongs_to :friendship
	belongs_to :list
end
