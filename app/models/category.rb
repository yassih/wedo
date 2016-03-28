class Category < ActiveRecord::Base
	has_many :lists
	validates_uniqueness_of :name , :case_sensitive => false
	validates :name, presence: true
end
