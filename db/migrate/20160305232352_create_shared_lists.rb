class CreateSharedLists < ActiveRecord::Migration
  def change
    create_table :shared_lists do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
