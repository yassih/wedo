class Note < ActiveRecord::Base
	validates :content, presence: true
	validates :content, length: {maximum: 25}
end


