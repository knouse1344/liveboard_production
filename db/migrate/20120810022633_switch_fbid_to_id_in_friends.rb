class SwitchFbidToIdInFriends < ActiveRecord::Migration
  def self.up
    rename_column :friendships, :user_fbid, :user_id
    rename_column :friendships, :friend_fbid, :friend_id
  end

  def self.down
    rename_column :friendships, :user_id, :user_fbid
    rename_column :friendships, :friend_id, :friend_fbid
  end
end
