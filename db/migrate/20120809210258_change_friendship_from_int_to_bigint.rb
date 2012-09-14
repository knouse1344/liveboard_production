class ChangeFriendshipFromIntToBigint < ActiveRecord::Migration
  def self.up
    change_column :friendships, :user_fbid, :bigint
    change_column :friendships, :friend_fbid, :bigint
  end

  def self.down
    change_column :friendships, :user_fbid, :integer
    change_column :friendships, :friend_fbid, :integer
  end
end
