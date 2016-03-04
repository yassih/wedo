class AddDetailsToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :user_id, :integer
    add_column :friendships, :friend_id, :integer
    add_column :friendships, :state, :string
    add_column :friendships, :friended_at, :datetime
  end
end
