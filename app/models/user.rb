class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#   validates :username, presence: true, uniqueness: true


# 	has_many :friendships, dependent: :destroy
# 	has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"

# 	# the friendship has been created but the state is depending on acceptance(must have a request)
# 	# friend_id is user_2 in inverse_friendships of has_many
# 	def request_friendship(user_2)
# 		self.friendships.create(friend: user_2)
# 	end

# # where returns an array, self.friendships returns all friendships, state tells to get just the active friendships
# # print an array with the active usre names, on the friend side we want users and on user side we want friends.
# 	def active_friends
# 		self.friendships.where(state: "active").map(&:friend) + self.inverse_friendships.where(state: "active").map(&:user)
# 	end

# # waiting on acceptance
# 	def pending_friend_request_from
# 		self.inverse_friendships.where(state: "pending").map(&:user)
# 	end

# # we initiated the friendship
# 	def pending_friend_request_to
# 		self.friendships.where(state: "pending").map(&:friend)
# 	end

# 	def friendship_status(user_2)
# 		friendship = Friendship.where(user_id: [self.id, user_2.id], friend_id:[self.id, user_2.id])
# 		if friendship.any? == false
# 			return "not_friends"
# 		elsif friendship.first.state == "active"
# 			return "friends"
# 		elsif friendship.first.user == self
# 			return "pending"
# 	# we initiated request, first.user calls first object, could use friendship[0]
# 		elsif friendship.first.friend == self
# 			return "requested"
# 		end	
# 	end

# 	def friendship_relation(user_2)
# 		Friendship.where(user_id: [self.id, user_2.id], friend_id:[self.id, user_2.id]).first
# 	end
# end

end
