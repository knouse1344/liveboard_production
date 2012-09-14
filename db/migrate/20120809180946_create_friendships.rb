class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_fbid
      t.integer :friend_fbid

      t.timestamps
    end
  end
end
