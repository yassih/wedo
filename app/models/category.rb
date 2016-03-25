class Category < ActiveRecord::Base
	has_many :lists
	validates_uniqueness_of :name
	validates :name, presence: true
end
